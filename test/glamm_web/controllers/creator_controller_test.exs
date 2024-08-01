defmodule GlammWeb.CreatorControllerTest do
  use GlammWeb.ConnCase

  import Glamm.MasterFixtures

  @create_attrs %{creator_name: "some creator_name", creator_contact: "some creator_contact", affiliation: "some affiliation", creator_type: :people}
  @update_attrs %{creator_name: "some updated creator_name", creator_contact: "some updated creator_contact", affiliation: "some updated affiliation", creator_type: :organization}
  @invalid_attrs %{creator_name: nil, creator_contact: nil, affiliation: nil, creator_type: nil}

  describe "index" do
    test "lists all mst_creator", %{conn: conn} do
      conn = get(conn, ~p"/mst_creator")
      assert html_response(conn, 200) =~ "Listing Mst creator"
    end
  end

  describe "new creator" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/mst_creator/new")
      assert html_response(conn, 200) =~ "New Creator"
    end
  end

  describe "create creator" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/mst_creator", creator: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/mst_creator/#{id}"

      conn = get(conn, ~p"/mst_creator/#{id}")
      assert html_response(conn, 200) =~ "Creator #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/mst_creator", creator: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Creator"
    end
  end

  describe "edit creator" do
    setup [:create_creator]

    test "renders form for editing chosen creator", %{conn: conn, creator: creator} do
      conn = get(conn, ~p"/mst_creator/#{creator}/edit")
      assert html_response(conn, 200) =~ "Edit Creator"
    end
  end

  describe "update creator" do
    setup [:create_creator]

    test "redirects when data is valid", %{conn: conn, creator: creator} do
      conn = put(conn, ~p"/mst_creator/#{creator}", creator: @update_attrs)
      assert redirected_to(conn) == ~p"/mst_creator/#{creator}"

      conn = get(conn, ~p"/mst_creator/#{creator}")
      assert html_response(conn, 200) =~ "some updated creator_name"
    end

    test "renders errors when data is invalid", %{conn: conn, creator: creator} do
      conn = put(conn, ~p"/mst_creator/#{creator}", creator: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Creator"
    end
  end

  describe "delete creator" do
    setup [:create_creator]

    test "deletes chosen creator", %{conn: conn, creator: creator} do
      conn = delete(conn, ~p"/mst_creator/#{creator}")
      assert redirected_to(conn) == ~p"/mst_creator"

      assert_error_sent 404, fn ->
        get(conn, ~p"/mst_creator/#{creator}")
      end
    end
  end

  defp create_creator(_) do
    creator = creator_fixture()
    %{creator: creator}
  end
end
