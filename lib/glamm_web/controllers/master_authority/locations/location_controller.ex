defmodule GlammWeb.LocationController do
  use GlammWeb, :controller

  alias Glamm.Master.Authority
  alias Glamm.Master.Authority.Location

  def index(conn, _params) do
    mst_locations = Authority.list_mst_locations()
    render(conn, :index, mst_locations: mst_locations)
  end

  def new(conn, _params) do
    changeset = Authority.change_location(%Location{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"location" => location_params}) do
    case Authority.create_location(location_params) do
      {:ok, location} ->
        conn
        |> put_flash(:info, "Location created successfully.")
        |> redirect(to: ~p"/manage/mst_locations/#{location}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    location = Authority.get_location!(id)
    render(conn, :show, location: location)
  end

  def edit(conn, %{"id" => id}) do
    location = Authority.get_location!(id)
    changeset = Authority.change_location(location)
    render(conn, :edit, location: location, changeset: changeset)
  end

  def update(conn, %{"id" => id, "location" => location_params}) do
    location = Authority.get_location!(id)

    case Authority.update_location(location, location_params) do
      {:ok, location} ->
        conn
        |> put_flash(:info, "Location updated successfully.")
        |> redirect(to: ~p"/manage/mst_locations/#{location}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, location: location, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    location = Authority.get_location!(id)
    {:ok, _location} = Authority.delete_location(location)

    conn
    |> put_flash(:info, "Location deleted successfully.")
    |> redirect(to: ~p"/manage/mst_locations")
  end
end
