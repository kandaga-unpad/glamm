defmodule GlammWeb.ResourceTemplatePropertyLive.Index do
  use GlammWeb, :live_view_dashboard

  alias Glamm.Metadata
  alias Glamm.Metadata.ResourceTemplateProperty

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     stream(
       socket,
       :resource_template_property_collection,
       Metadata.list_resource_template_property()
     )}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Resource template property")
    |> assign(:resource_template_property, Metadata.get_resource_template_property!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Resource template property")
    |> assign(:resource_template_property, %ResourceTemplateProperty{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Resource template property")
    |> assign(:resource_template_property, nil)
  end

  @impl true
  def handle_info(
        {GlammWeb.ResourceTemplatePropertyLive.FormComponent,
         {:saved, resource_template_property}},
        socket
      ) do
    {:noreply,
     stream_insert(socket, :resource_template_property_collection, resource_template_property)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    resource_template_property = Metadata.get_resource_template_property!(id)
    {:ok, _} = Metadata.delete_resource_template_property(resource_template_property)

    {:noreply,
     stream_delete(socket, :resource_template_property_collection, resource_template_property)}
  end
end
