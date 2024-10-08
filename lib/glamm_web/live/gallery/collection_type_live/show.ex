defmodule GlammWeb.Gallery.CollectionTypeLive.Show do
  use GlammWeb, :live_view_gallery_dashboard

  alias Glamm.Gallery

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:collection_type, Gallery.get_collection_type!(id))}
  end

  defp page_title(:show), do: "Show Collection type"
  defp page_title(:edit), do: "Edit Collection type"
end
