defmodule GlammWeb.AssetsLive.Show do
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
     |> assign(:assets, Gallery.get_assets!(id))}
  end

  defp page_title(:show), do: "Show Assets"
  defp page_title(:edit), do: "Edit Assets"
end
