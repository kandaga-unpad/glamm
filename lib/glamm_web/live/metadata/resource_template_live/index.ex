defmodule GlammWeb.ResourceTemplateLive.Index do
  use GlammWeb, :live_view_dashboard

  alias Glamm.Metadata
  alias Glamm.Metadata.ResourceTemplate

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :resource_template_collection, Metadata.list_resource_template())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Resource template")
    |> assign(:resource_template, Metadata.get_resource_template!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Resource template")
    |> assign(:resource_template, %ResourceTemplate{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Resource template")
    |> assign(:resource_template, nil)
  end

  @impl true
  def handle_info(
        {GlammWeb.ResourceTemplateLive.FormComponent, {:saved, resource_template}},
        socket
      ) do
    {:noreply, stream_insert(socket, :resource_template_collection, resource_template)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    resource_template = Metadata.get_resource_template!(id)
    {:ok, _} = Metadata.delete_resource_template(resource_template)

    {:noreply, stream_delete(socket, :resource_template_collection, resource_template)}
  end
end
