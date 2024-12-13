defmodule GlammWeb.MetadataDashboardLive.Index do
  use GlammWeb, :live_view_dashboard

  alias Glamm.Metadata
  # alias Glamm.Metadata.Property

  def mount(_params, _session, socket) do
    count_properties = Metadata.list_metadata_properties() |> length()
    count_resource_class = Metadata.list_resource_class() |> length()
    count_resource_template = Metadata.list_resource_template() |> length()
    count_resource_template_property = Metadata.list_resource_template_property() |> length()
    count_vocabulaies = Metadata.list_metadata_vocabularies() |> length()

    socket =
      socket
      |> assign(
        prop_count: count_properties,
        vocab_count: count_vocabulaies,
        rc_count: count_resource_class,
        rt_count: count_resource_template,
        rtp_count: count_resource_template_property
      )

    # dbg(socket)

    {:ok, stream(socket, :dashboard, %{})}
  end

  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Dashboard")
    |> assign(:dashboard, nil)
  end
end
