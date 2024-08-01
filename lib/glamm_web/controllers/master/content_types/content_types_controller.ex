defmodule GlammWeb.ContentTypesController do
  use GlammWeb, :controller

  alias Glamm.Master
  alias Glamm.Master.ContentTypes

  def index(conn, _params) do
    mst_content_types = Master.list_mst_content_types()
    render(conn, :index, mst_content_types: mst_content_types)
  end

  def new(conn, _params) do
    changeset = Master.change_content_types(%ContentTypes{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"content_types" => content_types_params}) do
    case Master.create_content_types(content_types_params) do
      {:ok, content_types} ->
        conn
        |> put_flash(:info, "Content types created successfully.")
        |> redirect(to: ~p"/manage/mst_content_types/#{content_types}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    content_types = Master.get_content_types!(id)
    render(conn, :show, content_types: content_types)
  end

  def edit(conn, %{"id" => id}) do
    content_types = Master.get_content_types!(id)
    changeset = Master.change_content_types(content_types)
    render(conn, :edit, content_types: content_types, changeset: changeset)
  end

  def update(conn, %{"id" => id, "content_types" => content_types_params}) do
    content_types = Master.get_content_types!(id)

    case Master.update_content_types(content_types, content_types_params) do
      {:ok, content_types} ->
        conn
        |> put_flash(:info, "Content types updated successfully.")
        |> redirect(to: ~p"/manage/mst_content_types/#{content_types}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, content_types: content_types, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    content_types = Master.get_content_types!(id)
    {:ok, _content_types} = Master.delete_content_types(content_types)

    conn
    |> put_flash(:info, "Content types deleted successfully.")
    |> redirect(to: ~p"/manage/mst_content_types")
  end
end
