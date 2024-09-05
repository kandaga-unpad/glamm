defmodule GlammWeb.CollectionTypeLive.Index do
  use GlammWeb, :live_view_gallery_dashboard

  alias Glamm.Gallery
  alias Glamm.Gallery.CollectionType

  @impl true
  def mount(_params, _session, socket) do
    socket = socket |> assign(:total_collection_type, Gallery.length_gal_collection_type())

    {:ok, stream(socket, :gal_collection_type, Gallery.list_gal_collection_type())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Collection type")
    |> assign(:collection_type, Gallery.get_collection_type!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Collection type")
    |> assign(:collection_type, %CollectionType{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Gallery collection type")
    |> assign(:collection_type, nil)
  end

  @impl true
  def handle_info({GlammWeb.CollectionTypeLive.FormComponent, {:saved, collection_type}}, socket) do
    {:noreply, stream_insert(socket, :gal_collection_type, collection_type)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    collection_type = Gallery.get_collection_type!(id)
    {:ok, _} = Gallery.delete_collection_type(collection_type)

    {:noreply, stream_delete(socket, :gal_collection_type, collection_type)}
  end
end
