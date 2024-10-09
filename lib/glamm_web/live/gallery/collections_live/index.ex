defmodule GlammWeb.Gallery.CollectionsHomeLive.Index do
  use GlammWeb, :live_view_gallery_dashboard

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Gallery Collections")
    |> assign(:assets, nil)
  end
end
