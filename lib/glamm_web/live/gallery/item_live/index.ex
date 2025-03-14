defmodule GlammWeb.Gallery.ItemLive.Index do
  use GlammWeb, :live_view_gallery_dashboard

  alias Glamm.Gallery
  alias Glamm.Gallery.Item
  alias Glamm.Gallery.ItemValue

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:total_items, Gallery.length_gal_items())
      |> stream(:list_collection, Gallery.list_gal_collections())
      |> stream(:gal_items, Gallery.list_gal_items())

    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Item")
    |> assign(:item, Gallery.get_item!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Item")
    |> assign(:item, %Item{})
    |> assign(:item_value, %ItemValue{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Gal items")
    |> assign(:item, nil)
  end

  @impl true
  def handle_info({GlammWeb.ItemLive.FormComponent, {:saved, item}}, socket) do
    {:noreply, stream_insert(socket, :gal_items, item)}
  end

  @impl true
  def handle_info({GlammWeb.ItemValueLive.FormComponent, {:saved, item_value}}, socket) do
    {:noreply, stream_insert(socket, :gal_item_value, item_value)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    item = Gallery.get_item!(id)
    {:ok, _} = Gallery.delete_item(item)

    {:noreply, stream_delete(socket, :gal_items, item)}
  end
end
