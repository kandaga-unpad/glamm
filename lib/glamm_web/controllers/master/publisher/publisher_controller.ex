defmodule GlammWeb.PublisherController do
  use GlammWeb, :controller

  alias Glamm.Master
  alias Glamm.Master.Publisher

  def index(conn, _params) do
    mst_publishers = Master.list_mst_publishers()
    render(conn, :index, mst_publishers: mst_publishers)
  end

  def new(conn, _params) do
    changeset = Master.change_publisher(%Publisher{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"publisher" => publisher_params}) do
    case Master.create_publisher(publisher_params) do
      {:ok, publisher} ->
        conn
        |> put_flash(:info, "Publisher created successfully.")
        |> redirect(to: ~p"/manage/mst_publishers/#{publisher}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    publisher = Master.get_publisher!(id)
    render(conn, :show, publisher: publisher)
  end

  def edit(conn, %{"id" => id}) do
    publisher = Master.get_publisher!(id)
    changeset = Master.change_publisher(publisher)
    render(conn, :edit, publisher: publisher, changeset: changeset)
  end

  def update(conn, %{"id" => id, "publisher" => publisher_params}) do
    publisher = Master.get_publisher!(id)

    case Master.update_publisher(publisher, publisher_params) do
      {:ok, publisher} ->
        conn
        |> put_flash(:info, "Publisher updated successfully.")
        |> redirect(to: ~p"/manage/mst_publishers/#{publisher}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, publisher: publisher, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    publisher = Master.get_publisher!(id)
    {:ok, _publisher} = Master.delete_publisher(publisher)

    conn
    |> put_flash(:info, "Publisher deleted successfully.")
    |> redirect(to: ~p"/manage/mst_publishers")
  end
end
