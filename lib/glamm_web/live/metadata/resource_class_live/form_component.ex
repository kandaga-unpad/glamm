defmodule GlammWeb.ResourceClassLive.FormComponent do
  use GlammWeb, :live_component

  alias Glamm.Metadata

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        {@title}
        <:subtitle>Use this form to manage resource_class records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="resource_class-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:local_name]} type="text" label="Local name" />
        <.input field={@form[:label]} type="text" label="Label" />
        <.input field={@form[:information]} type="text" label="Information" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Resource class</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{resource_class: resource_class} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Metadata.change_resource_class(resource_class))
     end)}
  end

  @impl true
  def handle_event("validate", %{"resource_class" => resource_class_params}, socket) do
    changeset =
      Metadata.change_resource_class(socket.assigns.resource_class, resource_class_params)

    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"resource_class" => resource_class_params}, socket) do
    save_resource_class(socket, socket.assigns.action, resource_class_params)
  end

  defp save_resource_class(socket, :edit, resource_class_params) do
    case Metadata.update_resource_class(socket.assigns.resource_class, resource_class_params) do
      {:ok, resource_class} ->
        notify_parent({:saved, resource_class})

        {:noreply,
         socket
         |> put_flash(:info, "Resource class updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_resource_class(socket, :new, resource_class_params) do
    case Metadata.create_resource_class(resource_class_params) do
      {:ok, resource_class} ->
        notify_parent({:saved, resource_class})

        {:noreply,
         socket
         |> put_flash(:info, "Resource class created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
