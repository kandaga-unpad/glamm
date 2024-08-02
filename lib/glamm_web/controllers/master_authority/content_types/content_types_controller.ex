defmodule GlammWeb.ContentTypesController do
  use GlammWeb, :controller

  alias Glamm.Master.Authority
  alias Glamm.Master.Authority.ContentTypes

  def index(conn, _params) do
    mst_content_types = Authority.list_mst_content_types()
    render(conn, :index, mst_content_types: mst_content_types)
  end

  def new(conn, _params) do
    changeset = Authority.change_content_types(%ContentTypes{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"content_types" => content_types_params}) do
    case Authority.create_content_types(content_types_params) do
      {:ok, content_types} ->
        conn
        |> put_flash(:info, "Content types created successfully.")
        |> redirect(to: ~p"/manage/mst_content_types/#{content_types}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    content_types = Authority.get_content_types!(id)
    render(conn, :show, content_types: content_types)
  end

  def edit(conn, %{"id" => id}) do
    content_types = Authority.get_content_types!(id)
    changeset = Authority.change_content_types(content_types)
    render(conn, :edit, content_types: content_types, changeset: changeset)
  end

  def update(conn, %{"id" => id, "content_types" => content_types_params}) do
    content_types = Authority.get_content_types!(id)

    case Authority.update_content_types(content_types, content_types_params) do
      {:ok, content_types} ->
        conn
        |> put_flash(:info, "Content types updated successfully.")
        |> redirect(to: ~p"/manage/mst_content_types/#{content_types}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, content_types: content_types, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    content_types = Authority.get_content_types!(id)
    {:ok, _content_types} = Authority.delete_content_types(content_types)

    conn
    |> put_flash(:info, "Content types deleted successfully.")
    |> redirect(to: ~p"/manage/mst_content_types")
  end
end
