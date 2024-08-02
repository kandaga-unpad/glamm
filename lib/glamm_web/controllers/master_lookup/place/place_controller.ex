defmodule GlammWeb.PlaceController do
  use GlammWeb, :controller

  alias Glamm.Master.Lookup
  alias Glamm.Master.Lookup.Place

  def index(conn, _params) do
    mst_places = Lookup.list_mst_places()
    render(conn, :index, mst_places: mst_places)
  end

  def new(conn, _params) do
    changeset = Lookup.change_place(%Place{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"place" => place_params}) do
    case Lookup.create_place(place_params) do
      {:ok, place} ->
        conn
        |> put_flash(:info, "Place created successfully.")
        |> redirect(to: ~p"/manage/mst_places/#{place}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    place = Lookup.get_place!(id)
    render(conn, :show, place: place)
  end

  def edit(conn, %{"id" => id}) do
    place = Lookup.get_place!(id)
    changeset = Lookup.change_place(place)
    render(conn, :edit, place: place, changeset: changeset)
  end

  def update(conn, %{"id" => id, "place" => place_params}) do
    place = Lookup.get_place!(id)

    case Lookup.update_place(place, place_params) do
      {:ok, place} ->
        conn
        |> put_flash(:info, "Place updated successfully.")
        |> redirect(to: ~p"/manage/mst_places/#{place}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, place: place, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    place = Lookup.get_place!(id)
    {:ok, _place} = Lookup.delete_place(place)

    conn
    |> put_flash(:info, "Place deleted successfully.")
    |> redirect(to: ~p"/manage/mst_places")
  end
end
