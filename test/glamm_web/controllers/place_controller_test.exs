defmodule GlammWeb.PlaceControllerTest do
  use GlammWeb.ConnCase

  import Glamm.Master.LookupFixtures

  @create_attrs %{place_name: "some place_name"}
  @update_attrs %{place_name: "some updated place_name"}
  @invalid_attrs %{place_name: nil}

  describe "index" do
    test "lists all mst_places", %{conn: conn} do
      conn = get(conn, ~p"/mst_places")
      assert html_response(conn, 200) =~ "Listing Mst places"
    end
  end

  describe "new place" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/mst_places/new")
      assert html_response(conn, 200) =~ "New Place"
    end
  end

  describe "create place" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/mst_places", place: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/mst_places/#{id}"

      conn = get(conn, ~p"/mst_places/#{id}")
      assert html_response(conn, 200) =~ "Place #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/mst_places", place: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Place"
    end
  end

  describe "edit place" do
    setup [:create_place]

    test "renders form for editing chosen place", %{conn: conn, place: place} do
      conn = get(conn, ~p"/mst_places/#{place}/edit")
      assert html_response(conn, 200) =~ "Edit Place"
    end
  end

  describe "update place" do
    setup [:create_place]

    test "redirects when data is valid", %{conn: conn, place: place} do
      conn = put(conn, ~p"/mst_places/#{place}", place: @update_attrs)
      assert redirected_to(conn) == ~p"/mst_places/#{place}"

      conn = get(conn, ~p"/mst_places/#{place}")
      assert html_response(conn, 200) =~ "some updated place_name"
    end

    test "renders errors when data is invalid", %{conn: conn, place: place} do
      conn = put(conn, ~p"/mst_places/#{place}", place: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Place"
    end
  end

  describe "delete place" do
    setup [:create_place]

    test "deletes chosen place", %{conn: conn, place: place} do
      conn = delete(conn, ~p"/mst_places/#{place}")
      assert redirected_to(conn) == ~p"/mst_places"

      assert_error_sent 404, fn ->
        get(conn, ~p"/mst_places/#{place}")
      end
    end
  end

  defp create_place(_) do
    place = place_fixture()
    %{place: place}
  end
end
