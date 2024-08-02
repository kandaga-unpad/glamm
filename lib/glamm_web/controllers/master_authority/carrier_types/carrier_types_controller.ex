defmodule GlammWeb.CarrierTypesController do
  use GlammWeb, :controller

  alias Glamm.Master.Authority
  alias Glamm.Master.Authority.CarrierTypes

  def index(conn, _params) do
    mst_carrier_types = Authority.list_mst_carrier_types()
    render(conn, :index, mst_carrier_types: mst_carrier_types)
  end

  def new(conn, _params) do
    changeset = Authority.change_carrier_types(%CarrierTypes{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"carrier_types" => carrier_types_params}) do
    case Authority.create_carrier_types(carrier_types_params) do
      {:ok, carrier_types} ->
        conn
        |> put_flash(:info, "Carrier types created successfully.")
        |> redirect(to: ~p"/manage/mst_carrier_types/#{carrier_types}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    carrier_types = Authority.get_carrier_types!(id)
    render(conn, :show, carrier_types: carrier_types)
  end

  def edit(conn, %{"id" => id}) do
    carrier_types = Authority.get_carrier_types!(id)
    changeset = Authority.change_carrier_types(carrier_types)
    render(conn, :edit, carrier_types: carrier_types, changeset: changeset)
  end

  def update(conn, %{"id" => id, "carrier_types" => carrier_types_params}) do
    carrier_types = Authority.get_carrier_types!(id)

    case Authority.update_carrier_types(carrier_types, carrier_types_params) do
      {:ok, carrier_types} ->
        conn
        |> put_flash(:info, "Carrier types updated successfully.")
        |> redirect(to: ~p"/manage/mst_carrier_types/#{carrier_types}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, carrier_types: carrier_types, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    carrier_types = Authority.get_carrier_types!(id)
    {:ok, _carrier_types} = Authority.delete_carrier_types(carrier_types)

    conn
    |> put_flash(:info, "Carrier types deleted successfully.")
    |> redirect(to: ~p"/manage/mst_carrier_types")
  end
end
