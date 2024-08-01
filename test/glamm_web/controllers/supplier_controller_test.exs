defmodule GlammWeb.SupplierControllerTest do
  use GlammWeb.ConnCase

  import Glamm.MasterFixtures

  @create_attrs %{address: "some address", supplier_name: "some supplier_name", postal_code: 42, phone: "some phone", contact: "some contact", fax: "some fax", account: "some account", email: "some email"}
  @update_attrs %{address: "some updated address", supplier_name: "some updated supplier_name", postal_code: 43, phone: "some updated phone", contact: "some updated contact", fax: "some updated fax", account: "some updated account", email: "some updated email"}
  @invalid_attrs %{address: nil, supplier_name: nil, postal_code: nil, phone: nil, contact: nil, fax: nil, account: nil, email: nil}

  describe "index" do
    test "lists all mst_suppliers", %{conn: conn} do
      conn = get(conn, ~p"/mst_suppliers")
      assert html_response(conn, 200) =~ "Listing Mst suppliers"
    end
  end

  describe "new supplier" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/mst_suppliers/new")
      assert html_response(conn, 200) =~ "New Supplier"
    end
  end

  describe "create supplier" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/mst_suppliers", supplier: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/mst_suppliers/#{id}"

      conn = get(conn, ~p"/mst_suppliers/#{id}")
      assert html_response(conn, 200) =~ "Supplier #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/mst_suppliers", supplier: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Supplier"
    end
  end

  describe "edit supplier" do
    setup [:create_supplier]

    test "renders form for editing chosen supplier", %{conn: conn, supplier: supplier} do
      conn = get(conn, ~p"/mst_suppliers/#{supplier}/edit")
      assert html_response(conn, 200) =~ "Edit Supplier"
    end
  end

  describe "update supplier" do
    setup [:create_supplier]

    test "redirects when data is valid", %{conn: conn, supplier: supplier} do
      conn = put(conn, ~p"/mst_suppliers/#{supplier}", supplier: @update_attrs)
      assert redirected_to(conn) == ~p"/mst_suppliers/#{supplier}"

      conn = get(conn, ~p"/mst_suppliers/#{supplier}")
      assert html_response(conn, 200) =~ "some updated address"
    end

    test "renders errors when data is invalid", %{conn: conn, supplier: supplier} do
      conn = put(conn, ~p"/mst_suppliers/#{supplier}", supplier: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Supplier"
    end
  end

  describe "delete supplier" do
    setup [:create_supplier]

    test "deletes chosen supplier", %{conn: conn, supplier: supplier} do
      conn = delete(conn, ~p"/mst_suppliers/#{supplier}")
      assert redirected_to(conn) == ~p"/mst_suppliers"

      assert_error_sent 404, fn ->
        get(conn, ~p"/mst_suppliers/#{supplier}")
      end
    end
  end

  defp create_supplier(_) do
    supplier = supplier_fixture()
    %{supplier: supplier}
  end
end
