defmodule GlammWeb.Gallery.CollectionLive.Show do
  use GlammWeb, :live_view_gallery_dashboard

  alias Glamm.Gallery
  alias Glamm.Metadata

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
      |> assign(:resource_class_list, resource_list)
      |> assign(:collection_type_list, Gallery.list_gal_collection_type())
      |> assign(:node_list, Glamm.System.list_nodes())
      |> assign(:current_user, current_user)

    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:collection, Gallery.get_collection!(id))}
  end

  defp page_title(:show), do: "Show Collection"
  defp page_title(:edit), do: "Edit Collection"
end
