defmodule GlammWeb.Gallery.ItemLive.New do
  use GlammWeb, :live_view_gallery_dashboard

  alias Glamm.Gallery
  alias Glamm.Gallery.Item
  alias Glamm.Gallery.ItemValue

  @impl true
  def mount(_params, _session, socket) do
    current_user = socket.assigns.current_user
    list_collection = Gallery.list_gal_collections()

    socket =
      socket
      |> assign(:page_title, "Add New Item")
      |> assign(:current_user, current_user)
      |> assign(:item, %Item{})
      |> assign(:item_value, %ItemValue{})
      |> assign(:list_collection, list_collection)

    {:ok, socket}
  end

  @impl true
  def handle_params(params, _uri, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Item")
    |> assign(:collection, %Item{})
  end

  @impl true
  def handle_info({GlammWeb.ItemLive.FormComponent, {:saved, item}}, socket) do
    {:noreply, stream_insert(socket, :gal_items, item)}
  end
end
