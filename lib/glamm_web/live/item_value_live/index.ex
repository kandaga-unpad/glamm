defmodule GlammWeb.ItemValueLive.Index do
  use GlammWeb, :live_view_gallery_dashboard

  alias Glamm.Gallery
  alias Glamm.Gallery.ItemValue

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :gal_item_value, Gallery.list_gal_item_value())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Item value")
    |> assign(:item_value, Gallery.get_item_value!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Item value")
    |> assign(:item_value, %ItemValue{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Gal item value")
    |> assign(:item_value, nil)
  end

  @impl true
  def handle_info({GlammWeb.ItemValueLive.FormComponent, {:saved, item_value}}, socket) do
    {:noreply, stream_insert(socket, :gal_item_value, item_value)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    item_value = Gallery.get_item_value!(id)
    {:ok, _} = Gallery.delete_item_value(item_value)

    {:noreply, stream_delete(socket, :gal_item_value, item_value)}
  end
end
