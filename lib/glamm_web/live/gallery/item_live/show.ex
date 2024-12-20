defmodule GlammWeb.Gallery.ItemLive.Show do
  use GlammWeb, :live_view_gallery_dashboard

  alias Glamm.Gallery
  alias Glamm.Master.Authority
  alias Glamm.Metadata

  @impl true
  def mount(_params, _session, socket) do
    list_collection = Gallery.list_gal_collections()
    list_properties = Metadata.list_metadata_properties()
    list_supplier = Authority.list_mst_suppliers()

    socket =
      socket
      |> assign(:page_title, page_title(socket.assigns.live_action))
      |> assign(:item, %Gallery.Item{})
      |> assign(:item_value, %Gallery.ItemValue{})
      |> assign(:list_collection, list_collection)
      |> assign(:list_supplier, list_supplier)
      |> assign(:list_properties, list_properties)

    {:ok, socket}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    item = Gallery.get_item!(id)
    {:ok, _} = Gallery.delete_item(item)

    socket =
      socket
      |> push_navigate(to: "/manage/gallery/collections/items")

    {:noreply, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    list_collection = Gallery.list_gal_collections()

    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:item, Gallery.get_item!(id))
     |> assign(:list_collection, list_collection)}
  end

  defp page_title(:show), do: "Show Item"
  defp page_title(:edit), do: "Edit Item"
end
