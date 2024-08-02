defmodule GlammWeb.LocationControllerTest do
  use GlammWeb.ConnCase

  import Glamm.MasterFixtures

  @create_attrs %{location_code: "some location_code", location_name: "some location_name", location_place: "some location_place"}
  @update_attrs %{location_code: "some updated location_code", location_name: "some updated location_name", location_place: "some updated location_place"}
  @invalid_attrs %{location_code: nil, location_name: nil, location_place: nil}

  describe "index" do
    test "lists all mst_locations", %{conn: conn} do
      conn = get(conn, ~p"/mst_locations")
      assert html_response(conn, 200) =~ "Listing Mst locations"
    end
  end

  describe "new location" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/mst_locations/new")
      assert html_response(conn, 200) =~ "New Location"
    end
  end

  describe "create location" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/mst_locations", location: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/mst_locations/#{id}"

      conn = get(conn, ~p"/mst_locations/#{id}")
      assert html_response(conn, 200) =~ "Location #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/mst_locations", location: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Location"
    end
  end

  describe "edit location" do
    setup [:create_location]

    test "renders form for editing chosen location", %{conn: conn, location: location} do
      conn = get(conn, ~p"/mst_locations/#{location}/edit")
      assert html_response(conn, 200) =~ "Edit Location"
    end
  end

  describe "update location" do
    setup [:create_location]

    test "redirects when data is valid", %{conn: conn, location: location} do
      conn = put(conn, ~p"/mst_locations/#{location}", location: @update_attrs)
      assert redirected_to(conn) == ~p"/mst_locations/#{location}"

      conn = get(conn, ~p"/mst_locations/#{location}")
      assert html_response(conn, 200) =~ "some updated location_code"
    end

    test "renders errors when data is invalid", %{conn: conn, location: location} do
      conn = put(conn, ~p"/mst_locations/#{location}", location: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Location"
    end
  end

  describe "delete location" do
    setup [:create_location]

    test "deletes chosen location", %{conn: conn, location: location} do
      conn = delete(conn, ~p"/mst_locations/#{location}")
      assert redirected_to(conn) == ~p"/mst_locations"

      assert_error_sent 404, fn ->
        get(conn, ~p"/mst_locations/#{location}")
      end
    end
  end

  defp create_location(_) do
    location = location_fixture()
    %{location: location}
  end
end
