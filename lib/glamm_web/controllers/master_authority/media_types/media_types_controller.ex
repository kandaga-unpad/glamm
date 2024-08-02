defmodule GlammWeb.MediaTypesController do
  use GlammWeb, :controller

  alias Glamm.Master.Authority
  alias Glamm.Master.Authority.MediaTypes

  def index(conn, _params) do
    mst_media_types = Authority.list_mst_media_types()
    render(conn, :index, mst_media_types: mst_media_types)
  end

  def new(conn, _params) do
    changeset = Authority.change_media_types(%MediaTypes{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"media_types" => media_types_params}) do
    case Authority.create_media_types(media_types_params) do
      {:ok, media_types} ->
        conn
        |> put_flash(:info, "Media types created successfully.")
        |> redirect(to: ~p"/manage/mst_media_types/#{media_types}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    media_types = Authority.get_media_types!(id)
    render(conn, :show, media_types: media_types)
  end

  def edit(conn, %{"id" => id}) do
    media_types = Authority.get_media_types!(id)
    changeset = Authority.change_media_types(media_types)
    render(conn, :edit, media_types: media_types, changeset: changeset)
  end

  def update(conn, %{"id" => id, "media_types" => media_types_params}) do
    media_types = Authority.get_media_types!(id)

    case Authority.update_media_types(media_types, media_types_params) do
      {:ok, media_types} ->
        conn
        |> put_flash(:info, "Media types updated successfully.")
        |> redirect(to: ~p"/manage/mst_media_types/#{media_types}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, media_types: media_types, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    media_types = Authority.get_media_types!(id)
    {:ok, _media_types} = Authority.delete_media_types(media_types)

    conn
    |> put_flash(:info, "Media types deleted successfully.")
    |> redirect(to: ~p"/manage/mst_media_types")
  end
end
