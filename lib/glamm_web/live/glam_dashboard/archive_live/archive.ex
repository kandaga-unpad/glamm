defmodule GlammWeb.GlamDashboardLive.Archive do
  use GlammWeb, :live_view_archive_dashboard

  @impl true
  def mount(_params, _session, socket) do
    archive = [
      %{
        id: 1,
        name: "Collection",
        url: "/manage/archive/collection"
      },
      %{
        id: 2,
        name: "Item",
        url: "/manage/archive/item"
      }
    ]

    socket = socket |> assign(:archive_menu, archive)

    {:ok, stream(socket, :archive_data, %{})}
  end

  @impl true
  def handle_params(params, _uri, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Archive Dashboard")
    |> assign(:archive_collection, nil)
  end
end
