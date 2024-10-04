defmodule GlammWeb.Gallery.AssetsLive.Index do
  use GlammWeb, :live_view_gallery_dashboard

  alias Glamm.Gallery
  alias Glamm.Gallery.Assets

  @impl true
  def mount(_params, _session, socket) do
    total_assets = Gallery.length_gal_assets()
    socket = socket |> assign(:total_assets, total_assets)
    {:ok, stream(socket, :gal_assets, Gallery.list_gal_assets())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Assets")
    |> assign(:assets, Gallery.get_assets!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Assets")
    |> assign(:assets, %Assets{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Gallery assets")
    |> assign(:assets, nil)
  end

  @impl true
  def handle_info({GlammWeb.AssetsLive.FormComponent, {:saved, assets}}, socket) do
    {:noreply, stream_insert(socket, :gal_assets, assets)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    assets = Gallery.get_assets!(id)
    {:ok, _} = Gallery.delete_assets(assets)

    {:noreply, stream_delete(socket, :gal_assets, assets)}
  end
end
