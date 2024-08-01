defmodule GlammWeb.GMDController do
  use GlammWeb, :controller

  alias Glamm.Master
  alias Glamm.Master.GMD

  def index(conn, _params) do
    mst_gmd = Master.list_mst_gmd()
    render(conn, :index, mst_gmd: mst_gmd)
  end

  def new(conn, _params) do
    changeset = Master.change_gmd(%GMD{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"gmd" => gmd_params}) do
    case Master.create_gmd(gmd_params) do
      {:ok, gmd} ->
        conn
        |> put_flash(:info, "Gmd created successfully.")
        |> redirect(to: ~p"/manage/mst_gmd/#{gmd}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    gmd = Master.get_gmd!(id)
    render(conn, :show, gmd: gmd)
  end

  def edit(conn, %{"id" => id}) do
    gmd = Master.get_gmd!(id)
    changeset = Master.change_gmd(gmd)
    render(conn, :edit, gmd: gmd, changeset: changeset)
  end

  def update(conn, %{"id" => id, "gmd" => gmd_params}) do
    gmd = Master.get_gmd!(id)

    case Master.update_gmd(gmd, gmd_params) do
      {:ok, gmd} ->
        conn
        |> put_flash(:info, "Gmd updated successfully.")
        |> redirect(to: ~p"/manage/mst_gmd/#{gmd}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, gmd: gmd, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    gmd = Master.get_gmd!(id)
    {:ok, _gmd} = Master.delete_gmd(gmd)

    conn
    |> put_flash(:info, "Gmd deleted successfully.")
    |> redirect(to: ~p"/manage/mst_gmd")
  end
end
