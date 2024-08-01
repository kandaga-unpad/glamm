defmodule GlammWeb.CarrierTypesControllerTest do
  use GlammWeb.ConnCase

  import Glamm.MasterFixtures

  @create_attrs %{code: "some code", carrier_type: "some carrier_type", marc_code: "some marc_code"}
  @update_attrs %{code: "some updated code", carrier_type: "some updated carrier_type", marc_code: "some updated marc_code"}
  @invalid_attrs %{code: nil, carrier_type: nil, marc_code: nil}

  describe "index" do
    test "lists all mst_carrier_types", %{conn: conn} do
      conn = get(conn, ~p"/mst_carrier_types")
      assert html_response(conn, 200) =~ "Listing Mst carrier types"
    end
  end

  describe "new carrier_types" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/mst_carrier_types/new")
      assert html_response(conn, 200) =~ "New Carrier types"
    end
  end

  describe "create carrier_types" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/mst_carrier_types", carrier_types: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/mst_carrier_types/#{id}"

      conn = get(conn, ~p"/mst_carrier_types/#{id}")
      assert html_response(conn, 200) =~ "Carrier types #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/mst_carrier_types", carrier_types: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Carrier types"
    end
  end

  describe "edit carrier_types" do
    setup [:create_carrier_types]

    test "renders form for editing chosen carrier_types", %{conn: conn, carrier_types: carrier_types} do
      conn = get(conn, ~p"/mst_carrier_types/#{carrier_types}/edit")
      assert html_response(conn, 200) =~ "Edit Carrier types"
    end
  end

  describe "update carrier_types" do
    setup [:create_carrier_types]

    test "redirects when data is valid", %{conn: conn, carrier_types: carrier_types} do
      conn = put(conn, ~p"/mst_carrier_types/#{carrier_types}", carrier_types: @update_attrs)
      assert redirected_to(conn) == ~p"/mst_carrier_types/#{carrier_types}"

      conn = get(conn, ~p"/mst_carrier_types/#{carrier_types}")
      assert html_response(conn, 200) =~ "some updated code"
    end

    test "renders errors when data is invalid", %{conn: conn, carrier_types: carrier_types} do
      conn = put(conn, ~p"/mst_carrier_types/#{carrier_types}", carrier_types: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Carrier types"
    end
  end

  describe "delete carrier_types" do
    setup [:create_carrier_types]

    test "deletes chosen carrier_types", %{conn: conn, carrier_types: carrier_types} do
      conn = delete(conn, ~p"/mst_carrier_types/#{carrier_types}")
      assert redirected_to(conn) == ~p"/mst_carrier_types"

      assert_error_sent 404, fn ->
        get(conn, ~p"/mst_carrier_types/#{carrier_types}")
      end
    end
  end

  defp create_carrier_types(_) do
    carrier_types = carrier_types_fixture()
    %{carrier_types: carrier_types}
  end
end
