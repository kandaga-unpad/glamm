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
          options={[{"User", "user"}, {"Private", "private"}, {"Admin", "admin"}]}
          prompt="Scope for accessing this collection"
        />
        <.input
          field={@form[:node_id]}
          type="select"
          label="Node Collection"
          options={Enum.map(@node_list, &{&1.name, &1.id})}
          prompt="Node Location for this collection"
        /> <.input type="hidden" field={@form[:owner_id]} value={@current_user.id} />
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
     |> assign_new(:form, fn ->
       to_form(Gallery.change_collection(collection))
     end)}
  end

  @impl true
  def handle_event("validate", %{"collection" => collection_params}, socket) do
    changeset = Gallery.change_collection(socket.assigns.collection, collection_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"collection" => collection_params}, socket) do
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
    case Gallery.create_collection(collection_params) do
      {:ok, collection} ->
        notify_parent({:saved, collection})

        {:noreply,
         socket
         |> put_flash(:info, "Collection created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
