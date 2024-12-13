defmodule GlammWeb.ResourceTemplatePropertyLive.FormComponent do
  use GlammWeb, :live_component

  alias Glamm.Metadata

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        {@title}
        <:subtitle>
          Use this form to manage resource_template_property records in your database.
        </:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="resource_template_property-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:alternate_label]} type="text" label="Alternate label" />
        <.input field={@form[:alternate_information]} type="text" label="Alternate information" />
        <.input field={@form[:position]} type="number" label="Position" />
        <.input
          field={@form[:data_type]}
          type="select"
          multiple
          label="Data type"
          options={[{"Option 1", "option1"}, {"Option 2", "option2"}]}
        />
        <.input field={@form[:is_required]} type="checkbox" label="Is required" />
        <.input field={@form[:is_public]} type="checkbox" label="Is public" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Resource template property</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{resource_template_property: resource_template_property} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Metadata.change_resource_template_property(resource_template_property))
     end)}
  end

  @impl true
  def handle_event(
        "validate",
        %{"resource_template_property" => resource_template_property_params},
        socket
      ) do
    changeset =
      Metadata.change_resource_template_property(
        socket.assigns.resource_template_property,
        resource_template_property_params
      )

    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event(
        "save",
        %{"resource_template_property" => resource_template_property_params},
        socket
      ) do
    save_resource_template_property(
      socket,
      socket.assigns.action,
      resource_template_property_params
    )
  end

  defp save_resource_template_property(socket, :edit, resource_template_property_params) do
    case Metadata.update_resource_template_property(
           socket.assigns.resource_template_property,
           resource_template_property_params
         ) do
      {:ok, resource_template_property} ->
        notify_parent({:saved, resource_template_property})

        {:noreply,
         socket
         |> put_flash(:info, "Resource template property updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_resource_template_property(socket, :new, resource_template_property_params) do
    case Metadata.create_resource_template_property(resource_template_property_params) do
      {:ok, resource_template_property} ->
        notify_parent({:saved, resource_template_property})

        {:noreply,
         socket
         |> put_flash(:info, "Resource template property created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
