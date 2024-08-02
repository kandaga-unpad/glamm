defmodule GlammWeb.ItemStatusControllerTest do
  use GlammWeb.ConnCase

  import Glamm.Master.LookupFixtures

  @create_attrs %{item_status_id: "some item_status_id", status_name: "some status_name", rules: "some rules", skip_stock_take: true}
  @update_attrs %{item_status_id: "some updated item_status_id", status_name: "some updated status_name", rules: "some updated rules", skip_stock_take: false}
  @invalid_attrs %{item_status_id: nil, status_name: nil, rules: nil, skip_stock_take: nil}

  describe "index" do
    test "lists all mst_item_status", %{conn: conn} do
      conn = get(conn, ~p"/mst_item_status")
      assert html_response(conn, 200) =~ "Listing Mst item status"
    end
  end

  describe "new item_status" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/mst_item_status/new")
      assert html_response(conn, 200) =~ "New Item status"
    end
  end

  describe "create item_status" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/mst_item_status", item_status: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/mst_item_status/#{id}"

      conn = get(conn, ~p"/mst_item_status/#{id}")
      assert html_response(conn, 200) =~ "Item status #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/mst_item_status", item_status: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Item status"
    end
  end

  describe "edit item_status" do
    setup [:create_item_status]

    test "renders form for editing chosen item_status", %{conn: conn, item_status: item_status} do
      conn = get(conn, ~p"/mst_item_status/#{item_status}/edit")
      assert html_response(conn, 200) =~ "Edit Item status"
    end
  end

  describe "update item_status" do
    setup [:create_item_status]

    test "redirects when data is valid", %{conn: conn, item_status: item_status} do
      conn = put(conn, ~p"/mst_item_status/#{item_status}", item_status: @update_attrs)
      assert redirected_to(conn) == ~p"/mst_item_status/#{item_status}"

      conn = get(conn, ~p"/mst_item_status/#{item_status}")
      assert html_response(conn, 200) =~ "some updated item_status_id"
    end

    test "renders errors when data is invalid", %{conn: conn, item_status: item_status} do
      conn = put(conn, ~p"/mst_item_status/#{item_status}", item_status: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Item status"
    end
  end

  describe "delete item_status" do
    setup [:create_item_status]

    test "deletes chosen item_status", %{conn: conn, item_status: item_status} do
      conn = delete(conn, ~p"/mst_item_status/#{item_status}")
      assert redirected_to(conn) == ~p"/mst_item_status"

      assert_error_sent 404, fn ->
        get(conn, ~p"/mst_item_status/#{item_status}")
      end
    end
  end

  defp create_item_status(_) do
    item_status = item_status_fixture()
    %{item_status: item_status}
  end
end
