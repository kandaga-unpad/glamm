defmodule GlammWeb.ItemStatusController do
  use GlammWeb, :controller

  alias Glamm.Master.Lookup
  alias Glamm.Master.Lookup.ItemStatus

  def index(conn, _params) do
    mst_item_status = Lookup.list_mst_item_status()
    render(conn, :index, mst_item_status: mst_item_status)
  end

  def new(conn, _params) do
    changeset = Lookup.change_item_status(%ItemStatus{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"item_status" => item_status_params}) do
    case Lookup.create_item_status(item_status_params) do
      {:ok, item_status} ->
        conn
        |> put_flash(:info, "Item status created successfully.")
        |> redirect(to: ~p"/manage/mst_item_status/#{item_status}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    item_status = Lookup.get_item_status!(id)
    render(conn, :show, item_status: item_status)
  end

  def edit(conn, %{"id" => id}) do
    item_status = Lookup.get_item_status!(id)
    changeset = Lookup.change_item_status(item_status)
    render(conn, :edit, item_status: item_status, changeset: changeset)
  end

  def update(conn, %{"id" => id, "item_status" => item_status_params}) do
    item_status = Lookup.get_item_status!(id)

    case Lookup.update_item_status(item_status, item_status_params) do
      {:ok, item_status} ->
        conn
        |> put_flash(:info, "Item status updated successfully.")
        |> redirect(to: ~p"/manage/mst_item_status/#{item_status}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, item_status: item_status, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    item_status = Lookup.get_item_status!(id)
    {:ok, _item_status} = Lookup.delete_item_status(item_status)

    conn
    |> put_flash(:info, "Item status deleted successfully.")
    |> redirect(to: ~p"/manage/mst_item_status")
  end
end
