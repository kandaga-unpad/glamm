defmodule GlammWeb.FilesLive.FormComponent do
  use GlammWeb, :live_component

  alias Glamm.Gallery

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        {@title}
        <:subtitle>Use this form to manage files records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="files-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:file_title]} type="text" label="File title" />
        <.input field={@form[:file_type]} type="text" label="File type" />
        <.input field={@form[:file_url]} type="text" label="File url" />
        <.input field={@form[:file_directory]} type="text" label="File directory" />
        <.input field={@form[:mime_type]} type="text" label="Mime type" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Files</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{files: files} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Gallery.change_files(files))
     end)}
  end

  @impl true
  def handle_event("validate", %{"files" => files_params}, socket) do
    changeset = Gallery.change_files(socket.assigns.files, files_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"files" => files_params}, socket) do
    save_files(socket, socket.assigns.action, files_params)
  end

  defp save_files(socket, :edit, files_params) do
    case Gallery.update_files(socket.assigns.files, files_params) do
      {:ok, files} ->
        notify_parent({:saved, files})

        {:noreply,
         socket
         |> put_flash(:info, "Files updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_files(socket, :new, files_params) do
    case Gallery.create_files(files_params) do
      {:ok, files} ->
        notify_parent({:saved, files})

        {:noreply,
         socket
         |> put_flash(:info, "Files created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
