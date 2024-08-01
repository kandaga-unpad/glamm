defmodule GlammWeb.SupplierController do
  use GlammWeb, :controller

  alias Glamm.Master
  alias Glamm.Master.Supplier

  def index(conn, _params) do
    mst_suppliers = Master.list_mst_suppliers()
    render(conn, :index, mst_suppliers: mst_suppliers)
  end

  def new(conn, _params) do
    changeset = Master.change_supplier(%Supplier{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"supplier" => supplier_params}) do
    case Master.create_supplier(supplier_params) do
      {:ok, supplier} ->
        conn
        |> put_flash(:info, "Supplier created successfully.")
        |> redirect(to: ~p"/mst_suppliers/#{supplier}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    supplier = Master.get_supplier!(id)
    render(conn, :show, supplier: supplier)
  end

  def edit(conn, %{"id" => id}) do
    supplier = Master.get_supplier!(id)
    changeset = Master.change_supplier(supplier)
    render(conn, :edit, supplier: supplier, changeset: changeset)
  end

  def update(conn, %{"id" => id, "supplier" => supplier_params}) do
    supplier = Master.get_supplier!(id)

    case Master.update_supplier(supplier, supplier_params) do
      {:ok, supplier} ->
        conn
        |> put_flash(:info, "Supplier updated successfully.")
        |> redirect(to: ~p"/mst_suppliers/#{supplier}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, supplier: supplier, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    supplier = Master.get_supplier!(id)
    {:ok, _supplier} = Master.delete_supplier(supplier)

    conn
    |> put_flash(:info, "Supplier deleted successfully.")
    |> redirect(to: ~p"/mst_suppliers")
  end
end
