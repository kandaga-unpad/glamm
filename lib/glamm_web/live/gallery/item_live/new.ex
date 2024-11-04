defmodule GlammWeb.Gallery.CollectionItemLive.New do
  use GlammWeb, :live_view_gallery_dashboard

  # alias Glamm.Gallery
  # alias Glamm.Metadata
  # alias Glamm.Gallery.Collection
  alias Glamm.Gallery.Item
  # alias Glamm.Gallery.ItemValue

  @impl true
  def mount(_params, _session, socket) do
    current_user = socket.assigns.current_user

    socket =
      socket
      |> assign(:page_title, "Add New Item")
      |> assign(:current_user, current_user)
      |> assign(:item, %Item{})

    {:ok, socket}
  end

  @impl true
  def handle_params(params, _uri, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  @impl true
  def handle_info({GlammWeb.ItemLive.FormComponent, {:saved, item}}, socket) do
    {:noreply, stream_insert(socket, :gal_items, item)}
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Item")
    |> assign(:collection, %Item{})
  end
end
