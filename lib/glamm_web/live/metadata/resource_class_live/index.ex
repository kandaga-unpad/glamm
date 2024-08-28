defmodule GlammWeb.ResourceClassLive.Index do
  use GlammWeb, :live_view_dashboard

  alias Glamm.Metadata
  alias Glamm.Metadata.ResourceClass

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :resource_class_collection, Metadata.list_resource_class())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Resource class")
    |> assign(:resource_class, Metadata.get_resource_class!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Resource class")
    |> assign(:resource_class, %ResourceClass{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Resource class")
    |> assign(:resource_class, nil)
  end

  @impl true
  def handle_info({GlammWeb.ResourceClassLive.FormComponent, {:saved, resource_class}}, socket) do
    {:noreply, stream_insert(socket, :resource_class_collection, resource_class)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    resource_class = Metadata.get_resource_class!(id)
    {:ok, _} = Metadata.delete_resource_class(resource_class)

    {:noreply, stream_delete(socket, :resource_class_collection, resource_class)}
  end
end
