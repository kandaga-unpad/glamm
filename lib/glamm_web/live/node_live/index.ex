defmodule GlammWeb.NodeLive.Index do
  use GlammWeb, :live_view_dashboard

  alias Glamm.System
  alias Glamm.System.Node

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :nodes, System.list_nodes())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Node")
    |> assign(:node, System.get_node!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Node")
    |> assign(:node, %Node{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Nodes")
    |> assign(:node, nil)
  end

  @impl true
  def handle_info({GlammWeb.NodeLive.FormComponent, {:saved, node}}, socket) do
    {:noreply, stream_insert(socket, :nodes, node)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    node = System.get_node!(id)
    {:ok, _} = System.delete_node(node)

    {:noreply, stream_delete(socket, :nodes, node)}
  end
end
