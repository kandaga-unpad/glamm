defmodule GlammWeb.Gallery.CollectionLive.New do
  use GlammWeb, :live_view_gallery_dashboard

  alias Glamm.Gallery
  alias Glamm.Metadata
  alias Glamm.Gallery.Collection

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
      |> assign(:page_title, "Add New Collection")
      |> assign(:total_collections, Gallery.length_gal_collections())
      |> assign(:collection, %Collection{})
      |> assign(:resource_class_list, resource_list)
      |> assign(:collection_type_list, Gallery.list_gal_collection_type())
      |> assign(:node_list, Glamm.System.list_nodes())
      |> assign(:current_user, current_user)
      |> stream(:gal_collections, Gallery.list_gal_collections())

    {:ok, socket}
  end
end
