defmodule GlammWeb.NodeLive.Show do
  use GlammWeb, :live_view_dashboard

  alias Glamm.System

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:node, System.get_node!(id))}
  end

  defp page_title(:show), do: "Show Node"
  defp page_title(:edit), do: "Edit Node"
end
