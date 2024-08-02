defmodule GlammWeb.LabelController do
  use GlammWeb, :controller

  alias Glamm.Master.Lookup
  alias Glamm.Master.Lookup.Label

  def index(conn, _params) do
    mst_labels = Lookup.list_mst_labels()
    render(conn, :index, mst_labels: mst_labels)
  end

  def new(conn, _params) do
    changeset = Lookup.change_label(%Label{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"label" => label_params}) do
    case Lookup.create_label(label_params) do
      {:ok, label} ->
        conn
        |> put_flash(:info, "Label created successfully.")
        |> redirect(to: ~p"/manage/mst_labels/#{label}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    label = Lookup.get_label!(id)
    render(conn, :show, label: label)
  end

  def edit(conn, %{"id" => id}) do
    label = Lookup.get_label!(id)
    changeset = Lookup.change_label(label)
    render(conn, :edit, label: label, changeset: changeset)
  end

  def update(conn, %{"id" => id, "label" => label_params}) do
    label = Lookup.get_label!(id)

    case Lookup.update_label(label, label_params) do
      {:ok, label} ->
        conn
        |> put_flash(:info, "Label updated successfully.")
        |> redirect(to: ~p"/manage/mst_labels/#{label}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, label: label, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    label = Lookup.get_label!(id)
    {:ok, _label} = Lookup.delete_label(label)

    conn
    |> put_flash(:info, "Label deleted successfully.")
    |> redirect(to: ~p"/manage/mst_labels")
  end
end
