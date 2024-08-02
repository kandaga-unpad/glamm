defmodule GlammWeb.FrequencyController do
  use GlammWeb, :controller

  alias Glamm.Master.Lookup
  alias Glamm.Master.Lookup.Frequency

  def index(conn, _params) do
    mst_frequency = Lookup.list_mst_frequency()
    render(conn, :index, mst_frequency: mst_frequency)
  end

  def new(conn, _params) do
    changeset = Lookup.change_frequency(%Frequency{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"frequency" => frequency_params}) do
    case Lookup.create_frequency(frequency_params) do
      {:ok, frequency} ->
        conn
        |> put_flash(:info, "Frequency created successfully.")
        |> redirect(to: ~p"/manage/mst_frequency/#{frequency}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    frequency = Lookup.get_frequency!(id)
    render(conn, :show, frequency: frequency)
  end

  def edit(conn, %{"id" => id}) do
    frequency = Lookup.get_frequency!(id)
    changeset = Lookup.change_frequency(frequency)
    render(conn, :edit, frequency: frequency, changeset: changeset)
  end

  def update(conn, %{"id" => id, "frequency" => frequency_params}) do
    frequency = Lookup.get_frequency!(id)

    case Lookup.update_frequency(frequency, frequency_params) do
      {:ok, frequency} ->
        conn
        |> put_flash(:info, "Frequency updated successfully.")
        |> redirect(to: ~p"/manage/mst_frequency/#{frequency}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, frequency: frequency, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    frequency = Lookup.get_frequency!(id)
    {:ok, _frequency} = Lookup.delete_frequency(frequency)

    conn
    |> put_flash(:info, "Frequency deleted successfully.")
    |> redirect(to: ~p"/manage/mst_frequency")
  end
end
