defmodule GlammWeb.Gallery.CollectionLive.Index do
  use GlammWeb, :live_view_gallery_dashboard

  alias Glamm.Gallery
  alias Glamm.Metadata
  alias Glamm.Gallery.Collection

  @impl true
  def mount(_params, _session, socket) do
    current_user = socket.assigns.current_user

    vocabulary_list =
      Metadata.list_metadata_vocabularies()
      |> Enum.reduce(%{}, fn %{id: id, label: label}, acc ->
        Map.put(acc, id, label)
      end)

    resource_list =
      Metadata.list_resource_class()
      |> Enum.group_by(fn %{vocabulary_id: vocabulary_id} ->
        vocabulary_list[vocabulary_id]
      end)

    socket =
      socket
      |> assign(:page_title, "Listing Gal collections")
      |> assign(:total_collections, Gallery.length_gal_collections())
      |> assign(:collection, %Collection{})
      |> assign(:resource_class_list, resource_list)
      |> assign(:collection_type_list, Gallery.list_gal_collection_type())
      |> assign(:node_list, Glamm.System.list_nodes())
      |> assign(:current_user, current_user)
      |> stream(:gal_collections, Gallery.list_gal_collections())

    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Collection")
    |> assign(:collection, Gallery.get_collection!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Collection")
    |> assign(:collection, %Collection{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Gal collections")
    |> assign(:collection, nil)
  end

  @impl true
  def handle_info({GlammWeb.CollectionLive.FormComponent, {:saved, collection}}, socket) do
    {:noreply, stream_insert(socket, :gal_collections, collection)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    collection = Gallery.get_collection!(id)
    {:ok, _} = Gallery.delete_collection(collection)

    {:noreply, stream_delete(socket, :gal_collections, collection)}
  end
end
