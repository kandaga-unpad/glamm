defmodule GlammWeb.RequisitionLive.FormComponent do
  use GlammWeb, :live_component

  alias Glamm.Gallery

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        {@title}
        <:subtitle>Use this form to manage requisition records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="requisition-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:member_id]} type="text" label="Member" value={@users.username} disabled />
        <.input field={@form[:member_name]} type="text" label="Member name" />
        <.input field={@form[:identifier]} type="text" label="Identifier" />
        <.input field={@form[:title]} type="text" label="Title" />
        <.input field={@form[:creator]} type="text" label="Creator" />
        <.input field={@form[:owner]} type="text" label="Owner" />
        <.input field={@form[:year_created]} type="number" label="Year created" />
        <.input field={@form[:description]} type="text" label="Description" />
        <.input field={@form[:price_currency]} type="text" label="Price currency" />
        <.input field={@form[:price]} type="number" label="Price" />
        <.input field={@form[:information]} type="text" label="Information" />
        <.input field={@form[:req_state]} type="text" label="Req state" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Requisition</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{requisition: requisition} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Gallery.change_requisition(requisition))
     end)}
  end

  @impl true
  def handle_event("validate", %{"requisition" => requisition_params}, socket) do
    changeset = Gallery.change_requisition(socket.assigns.requisition, requisition_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"requisition" => requisition_params}, socket) do
    save_requisition(socket, socket.assigns.action, requisition_params)
  end

  defp save_requisition(socket, :edit, requisition_params) do
    case Gallery.update_requisition(socket.assigns.requisition, requisition_params) do
      {:ok, requisition} ->
        notify_parent({:saved, requisition})

        {:noreply,
         socket
         |> put_flash(:info, "Requisition updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_requisition(socket, :new, requisition_params) do
    case Gallery.create_requisition(requisition_params) do
      {:ok, requisition} ->
        notify_parent({:saved, requisition})

        {:noreply,
         socket
         |> put_flash(:info, "Requisition created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
