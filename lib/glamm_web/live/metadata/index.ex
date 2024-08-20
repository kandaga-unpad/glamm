defmodule GlammWeb.MetadataDashboardLive.Index do
  use GlammWeb, :live_view_dashboard

  def mount(_params, _session, socket) do
    {:ok, stream(socket, :dashboard, %{})}
  end

  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    metadata_menu = [
      %{
        name: "Properties",
        url: "/manage/metadata_properties"
      },
      %{
        name: "Resource Class",
        url: "/manage/resource_class"
      },
      %{
        name: "Vocabularies",
        url: "/manage/metadata_vocabularies"
      }
    ]

    socket
    |> assign(:page_title, "Dashboard")
    |> assign(:metadata_menu, metadata_menu)
    |> assign(:dashboard, nil)
  end
end
