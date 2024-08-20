defmodule GlammWeb.PropertyLive.Index do
  use GlammWeb, :live_view_dashboard

  alias Glamm.Metadata
  alias Glamm.Metadata.Property

  @impl true
  def mount(_params, _session, socket) do
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

    socket = socket |> assign(:metadata_menu, metadata_menu)

    {:ok, stream(socket, :metadata_properties, Metadata.list_metadata_properties())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Property")
    |> assign(:property, Metadata.get_property!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Property")
    |> assign(:property, %Property{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Metadata properties")
    |> assign(:property, nil)
  end

  @impl true
  def handle_info({GlammWeb.PropertyLive.FormComponent, {:saved, property}}, socket) do
    {:noreply, stream_insert(socket, :metadata_properties, property)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    property = Metadata.get_property!(id)
    {:ok, _} = Metadata.delete_property(property)

    {:noreply, stream_delete(socket, :metadata_properties, property)}
  end
end
