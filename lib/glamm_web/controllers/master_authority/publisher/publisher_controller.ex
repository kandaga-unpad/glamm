defmodule GlammWeb.PublisherController do
  use GlammWeb, :controller

  alias Glamm.Master.Authority
  alias Glamm.Master.Authority.Publisher

  def index(conn, _params) do
    mst_publishers = Authority.list_mst_publishers()
    render(conn, :index, mst_publishers: mst_publishers)
  end

  def new(conn, _params) do
    changeset = Authority.change_publisher(%Publisher{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"publisher" => publisher_params}) do
    case Authority.create_publisher(publisher_params) do
      {:ok, publisher} ->
        conn
        |> put_flash(:info, "Publisher created successfully.")
        |> redirect(to: ~p"/manage/mst_publishers/#{publisher}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    publisher = Authority.get_publisher!(id)
    render(conn, :show, publisher: publisher)
  end

  def edit(conn, %{"id" => id}) do
    publisher = Authority.get_publisher!(id)
    changeset = Authority.change_publisher(publisher)
    render(conn, :edit, publisher: publisher, changeset: changeset)
  end

  def update(conn, %{"id" => id, "publisher" => publisher_params}) do
    publisher = Authority.get_publisher!(id)

    case Authority.update_publisher(publisher, publisher_params) do
      {:ok, publisher} ->
        conn
        |> put_flash(:info, "Publisher updated successfully.")
        |> redirect(to: ~p"/manage/mst_publishers/#{publisher}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, publisher: publisher, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    publisher = Authority.get_publisher!(id)
    {:ok, _publisher} = Authority.delete_publisher(publisher)

    conn
    |> put_flash(:info, "Publisher deleted successfully.")
    |> redirect(to: ~p"/manage/mst_publishers")
  end
end
