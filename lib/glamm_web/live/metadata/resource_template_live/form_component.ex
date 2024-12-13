defmodule GlammWeb.ResourceTemplateLive.FormComponent do
  use GlammWeb, :live_component

  alias Glamm.Metadata

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        {@title}
        <:subtitle>Use this form to manage resource_template records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="resource_template-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:label]} type="text" label="Label" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Resource template</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{resource_template: resource_template} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Metadata.change_resource_template(resource_template))
     end)}
  end

  @impl true
  def handle_event("validate", %{"resource_template" => resource_template_params}, socket) do
    changeset =
      Metadata.change_resource_template(
        socket.assigns.resource_template,
        resource_template_params
      )

    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"resource_template" => resource_template_params}, socket) do
    save_resource_template(socket, socket.assigns.action, resource_template_params)
  end

  defp save_resource_template(socket, :edit, resource_template_params) do
    case Metadata.update_resource_template(
           socket.assigns.resource_template,
           resource_template_params
         ) do
      {:ok, resource_template} ->
        notify_parent({:saved, resource_template})

        {:noreply,
         socket
         |> put_flash(:info, "Resource template updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_resource_template(socket, :new, resource_template_params) do
    case Metadata.create_resource_template(resource_template_params) do
      {:ok, resource_template} ->
        notify_parent({:saved, resource_template})

        {:noreply,
         socket
         |> put_flash(:info, "Resource template created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
