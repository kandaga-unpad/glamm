defmodule GlammWeb.CollectionTypeLive.FormComponent do
  use GlammWeb, :live_component

  alias Glamm.Gallery

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        {@title}
        <:subtitle>Use this form to manage collection_type records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="collection_type-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:collection_name]} type="text" label="Collection name" />
        <.input field={@form[:description]} type="text" label="Description" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Collection type</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{collection_type: collection_type} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Gallery.change_collection_type(collection_type))
     end)}
  end

  @impl true
  def handle_event("validate", %{"collection_type" => collection_type_params}, socket) do
    changeset =
      Gallery.change_collection_type(socket.assigns.collection_type, collection_type_params)

    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"collection_type" => collection_type_params}, socket) do
    save_collection_type(socket, socket.assigns.action, collection_type_params)
  end

  defp save_collection_type(socket, :edit, collection_type_params) do
    case Gallery.update_collection_type(socket.assigns.collection_type, collection_type_params) do
      {:ok, collection_type} ->
        notify_parent({:saved, collection_type})

        {:noreply,
         socket
         |> put_flash(:info, "Collection type updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_collection_type(socket, :new, collection_type_params) do
    case Gallery.create_collection_type(collection_type_params) do
      {:ok, collection_type} ->
        notify_parent({:saved, collection_type})

        {:noreply,
         socket
         |> put_flash(:info, "Collection type created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
