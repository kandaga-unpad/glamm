defmodule GlammWeb.FilesLive.Index do
  use GlammWeb, :live_view_dashboard

  alias Glamm.Gallery
  alias Glamm.Gallery.Files

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :gal_files, Gallery.list_gal_files())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Files")
    |> assign(:files, Gallery.get_files!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Files")
    |> assign(:files, %Files{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Gal files")
    |> assign(:files, nil)
  end

  @impl true
  def handle_info({GlammWeb.FilesLive.FormComponent, {:saved, files}}, socket) do
    {:noreply, stream_insert(socket, :gal_files, files)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    files = Gallery.get_files!(id)
    {:ok, _} = Gallery.delete_files(files)

    {:noreply, stream_delete(socket, :gal_files, files)}
  end
end
