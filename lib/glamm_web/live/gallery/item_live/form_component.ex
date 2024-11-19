defmodule GlammWeb.ItemLive.FormComponent do
  use GlammWeb, :live_component

  alias Glamm.Gallery

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.simple_form
        for={@form}
        id="item-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <h6>Item Information</h6>
        
        <div class="grid grid-cols-1 md:grid-cols-2 gap-5">
          <.input
            field={@form[:collection_id]}
            type="select"
            label="Collection"
            options={Enum.map(@list_collection, &{&1.title, &1.id})}
            prompt="Choose Collection"
          /> <.input field={@form[:item_code]} type="text" label="Item code" />
          <.input field={@form[:inventory_code]} type="text" label="Inventory code" />
          <.input field={@form[:item_status]} type="text" label="Item Status" />
          <.input field={@form[:order_date]} type="datetime-local" label="Order date" />
          <.input field={@form[:received_date]} type="datetime-local" label="Received date" />
          <.input field={@form[:invoice]} type="text" label="Invoice" />
          <.input field={@form[:invoice_date]} type="date" label="Invoice date" />
        </div>
        
        <h6>Item Metadata</h6>
        
        <div class="grid grid-cols-3 gap-5">
          <div class="col-span-2">
            <.input
              field={@form[:chosen]}
              type="select"
              label="Chosen Thing"
              options={[
                {"Thing 1", 1},
                {"Thing 2", 2},
                {"Thing 3", 3}
              ]}
              prompt="Choose a thing"
            />
          </div>
          
          <div>
            <p>List of available metadata</p>
          </div>
        </div>
        
        <:actions>
          <.button phx-disable-with="Saving...">Save Item</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{item: item} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Gallery.change_item(item))
     end)}
  end

  @impl true
  def handle_event("validate", %{"item" => item_params}, socket) do
    changeset = Gallery.change_item(socket.assigns.item, item_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"item" => item_params}, socket) do
    save_item(socket, socket.assigns.action, item_params)
  end

  defp save_item(socket, :edit, item_params) do
    case Gallery.update_item(socket.assigns.item, item_params) do
      {:ok, item} ->
        notify_parent({:saved, item})

        {:noreply,
         socket
         |> put_flash(:info, "Item updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_item(socket, :new, item_params) do
    dbg(socket.assigns)

    case Gallery.create_item(item_params) do
      {:ok, item} ->
        notify_parent({:saved, item})

        {:noreply,
         socket
         |> put_flash(:info, "Item created successfully")
         |> push_navigate(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
