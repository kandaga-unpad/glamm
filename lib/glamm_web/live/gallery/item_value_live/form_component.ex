defmodule GlammWeb.ItemValueLive.FormComponent do
  use GlammWeb, :live_component

  alias Glamm.Gallery

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage item_value records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="item_value-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:type]} type="text" label="Type" />
        <.input field={@form[:lang]} type="text" label="Lang" />
        <.input field={@form[:value]} type="text" label="Value" />
        <.input field={@form[:url]} type="text" label="Url" />
        <.input field={@form[:scope_view]} type="text" label="Scope view" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Item value</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{item_value: item_value} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Gallery.change_item_value(item_value))
     end)}
  end

  @impl true
  def handle_event("validate", %{"item_value" => item_value_params}, socket) do
    changeset = Gallery.change_item_value(socket.assigns.item_value, item_value_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"item_value" => item_value_params}, socket) do
    save_item_value(socket, socket.assigns.action, item_value_params)
  end

  defp save_item_value(socket, :edit, item_value_params) do
    case Gallery.update_item_value(socket.assigns.item_value, item_value_params) do
      {:ok, item_value} ->
        notify_parent({:saved, item_value})

        {:noreply,
         socket
         |> put_flash(:info, "Item value updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_item_value(socket, :new, item_value_params) do
    case Gallery.create_item_value(item_value_params) do
      {:ok, item_value} ->
        notify_parent({:saved, item_value})

        {:noreply,
         socket
         |> put_flash(:info, "Item value created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
