defmodule GlammWeb.CollectionLive.FormComponent do
  use GlammWeb, :live_component

  alias Glamm.Gallery

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage collection records in your database.</:subtitle>
      </.header>
      
      <.simple_form
        for={@form}
        id="collection-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input
          field={@form[:resource_class_id]}
          type="select"
          label="Resource Class"
          options={
            Enum.map(@resource_class_list, fn {category, items} ->
              {category, Enum.map(items, &{&1.label, &1.id})}
            end)
          }
        /> <.input field={@form[:title]} type="text" label="Title" />
        <.input
          field={@form[:collection_type_id]}
          type="select"
          label="Collection Type"
          options={Enum.map(@collection_type_list, &{&1.collection_name, &1.id})}
          prompt="Type of this Collection"
        /> <.input field={@form[:is_public]} type="checkbox" label="Is public" />
        <.input
          field={@form[:view_scope]}
          type="select"
          label="View scope"
          options={[
            {"Public", "public"},
            {"User", "user"},
            {"Private", "private"},
            {"Admin", "admin"}
          ]}
          prompt="Scope for accessing this collection"
        />
        <.input
          field={@form[:node_id]}
          type="select"
          label="Node Collection"
          options={Enum.map(@node_list, &{&1.name, &1.id})}
          prompt="Node Location for this collection"
        /> <.live_file_input upload={@uploads.thumbnail} />
        <section>
          <%!-- render each avatar entry --%>
          <%= if @uploads.thumbnail.entries do %>
            <%= for entry <- @uploads.thumbnail.entries do %>
              <article class="upload-entry">
                <figure>
                  <.live_img_preview entry={entry} />
                  <figcaption><%= entry.client_name %></figcaption>
                </figure>
                 <%!-- entry.progress will update automatically for in-flight entries --%>
                <progress value={entry.progress} max="100"><%= entry.progress %>%</progress>
                <%!-- a regular click event whose handler will invoke Phoenix.LiveView.cancel_upload/3 --%>
                <button
                  type="button"
                  phx-click="cancel-upload"
                  phx-value-ref={entry.ref}
                  aria-label="cancel"
                >
                  &times;
                </button>
                 <%!-- Phoenix.Component.upload_errors/2 returns a list of error atoms --%>
                <%= for err <- upload_errors(@uploads.thumbnail, entry) do %>
                  <p class="alert alert-danger"><%= error_to_string(err) %></p>
                <% end %>
              </article>
            <% end %>
             <%!-- Phoenix.Component.upload_errors/1 returns a list of error atoms --%>
            <%= for err <- upload_errors(@uploads.thumbnail) do %>
              <p class="alert alert-danger"><%= error_to_string(err) %></p>
            <% end %>
          <% else %>
            <p>No image is selected</p>
          <% end %>
        </section>
         <.input type="hidden" field={@form[:owner_id]} value={@current_user.id} />
        <:actions>
          <.button phx-disable-with="Saving...">Save Collection</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{collection: collection} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign(:uploaded_files, [])
     |> allow_upload(:thumbnail, accept: ~w(image/*), max_file_size: 2_000_000)
     |> assign_new(:form, fn ->
       to_form(Gallery.change_collection(collection))
     end)}
  end

  @impl true
  def handle_event("validate", %{"collection" => collection_params}, socket) do
    changeset = Gallery.change_collection(socket.assigns.collection, collection_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  @impl true
  def handle_event("cancel-upload", %{"ref" => ref}, socket) do
    {:noreply, cancel_upload(socket, :thumbnail, ref)}
  end

  def handle_event("save", %{"collection" => collection_params}, socket) do
    uploaded_files =
      consume_uploaded_entries(socket, :thumbnail, fn %{path: path}, _entry ->
        dest = Path.join([:code.priv_dir(:glamm), "static", "uploads", Path.basename(path)])
        # You will need to create `priv/static/uploads` for `File.cp!/2` to work.
        File.cp!(path, dest)
        {:ok, ~p"/uploads/#{Path.basename(dest)}"}
      end)

    thumbnail_map = %{
      :file_name => collection_params["title"],
      :path => uploaded_files |> List.first(),
      :description => "Thumbnail for collection of #{collection_params["title"]}",
      :uploader_id => collection_params["owner_id"]
    }

    collection_params = Map.put(collection_params, "thumbnail", thumbnail_map)

    save_collection(socket, socket.assigns.action, collection_params)
  end

  defp save_collection(socket, :edit, collection_params) do
    case Gallery.update_collection(socket.assigns.collection, collection_params) do
      {:ok, collection} ->
        notify_parent({:saved, collection})

        {:noreply,
         socket
         |> put_flash(:info, "Collection updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_collection(socket, :new, collection_params) do
    case Gallery.create_assets(collection_params["thumbnail"]) do
      {:ok, thumbnail} ->
        update(socket, :uploaded_files, &(&1 ++ thumbnail.file_name))

        {:ok, thumbnail_id} = Ecto.UUID.cast(thumbnail.id)

        collection_params = collection_params |> Map.put("thumbnail_id", thumbnail_id)

        case Gallery.create_collection(collection_params) do
          {:ok, collection} ->
            notify_parent({:saved, collection})

            {:noreply,
             socket
             |> put_flash(:info, "Collection created successfully")
             |> push_navigate(to: socket.assigns.patch)}

          {:error, %Ecto.Changeset{} = changeset} ->
            IO.puts("Error: #{inspect(changeset)}")
            IO.puts("Collection Params: #{inspect(collection_params)}")
            {:noreply, assign(socket, form: to_form(changeset))}
        end

      {:error, %Ecto.Changeset{} = changeset} ->
        IO.puts("Error: #{inspect(changeset)}")
        IO.puts("Collection Params: #{inspect(collection_params)}")
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
  defp error_to_string(:too_large), do: "Too large"
  defp error_to_string(:too_many_files), do: "You have selected too many files"
  defp error_to_string(:not_accepted), do: "You have selected an unacceptable file type"
end
