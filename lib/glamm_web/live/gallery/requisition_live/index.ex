defmodule GlammWeb.RequisitionLive.Index do
  use GlammWeb, :live_view_gallery_dashboard

  alias Glamm.Gallery
  alias Glamm.Gallery.Requisition
  alias Glamm.Accounts

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:total_requisitions, Gallery.length_gal_requisition())
      |> stream(:gal_requisitions, Gallery.list_gal_requisitions())
      |> stream(:users, Accounts.list_users())

    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    user_data = Accounts.list_users()

    socket
    |> assign(:page_title, "Edit Requisition")
    |> assign(:users, user_data)
    |> assign(:requisition, Gallery.get_requisition!(id))
  end

  defp apply_action(socket, :new, _params) do
    # user_data = Accounts.list_users()
    user_data = socket.assigns.current_user

    socket
    |> assign(:page_title, "New Requisition")
    |> assign(:users, user_data)
    |> assign(:requisition, %Requisition{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Gal requisitions")
    |> assign(:requisition, nil)
  end

  @impl true
  def handle_info({GlammWeb.RequisitionLive.FormComponent, {:saved, requisition}}, socket) do
    {:noreply, stream_insert(socket, :gal_requisitions, requisition)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    requisition = Gallery.get_requisition!(id)
    {:ok, _} = Gallery.delete_requisition(requisition)

    {:noreply, stream_delete(socket, :gal_requisitions, requisition)}
  end
end
