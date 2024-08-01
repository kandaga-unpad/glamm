defmodule GlammWeb.MediaTypesControllerTest do
  use GlammWeb.ConnCase

  import Glamm.MasterFixtures

  @create_attrs %{code: "some code", media_type: "some media_type", marc_code: "some marc_code"}
  @update_attrs %{code: "some updated code", media_type: "some updated media_type", marc_code: "some updated marc_code"}
  @invalid_attrs %{code: nil, media_type: nil, marc_code: nil}

  describe "index" do
    test "lists all mst_media_types", %{conn: conn} do
      conn = get(conn, ~p"/mst_media_types")
      assert html_response(conn, 200) =~ "Listing Mst media types"
    end
  end

  describe "new media_types" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/mst_media_types/new")
      assert html_response(conn, 200) =~ "New Media types"
    end
  end

  describe "create media_types" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/mst_media_types", media_types: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/mst_media_types/#{id}"

      conn = get(conn, ~p"/mst_media_types/#{id}")
      assert html_response(conn, 200) =~ "Media types #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/mst_media_types", media_types: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Media types"
    end
  end

  describe "edit media_types" do
    setup [:create_media_types]

    test "renders form for editing chosen media_types", %{conn: conn, media_types: media_types} do
      conn = get(conn, ~p"/mst_media_types/#{media_types}/edit")
      assert html_response(conn, 200) =~ "Edit Media types"
    end
  end

  describe "update media_types" do
    setup [:create_media_types]

    test "redirects when data is valid", %{conn: conn, media_types: media_types} do
      conn = put(conn, ~p"/mst_media_types/#{media_types}", media_types: @update_attrs)
      assert redirected_to(conn) == ~p"/mst_media_types/#{media_types}"

      conn = get(conn, ~p"/mst_media_types/#{media_types}")
      assert html_response(conn, 200) =~ "some updated code"
    end

    test "renders errors when data is invalid", %{conn: conn, media_types: media_types} do
      conn = put(conn, ~p"/mst_media_types/#{media_types}", media_types: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Media types"
    end
  end

  describe "delete media_types" do
    setup [:create_media_types]

    test "deletes chosen media_types", %{conn: conn, media_types: media_types} do
      conn = delete(conn, ~p"/mst_media_types/#{media_types}")
      assert redirected_to(conn) == ~p"/mst_media_types"

      assert_error_sent 404, fn ->
        get(conn, ~p"/mst_media_types/#{media_types}")
      end
    end
  end

  defp create_media_types(_) do
    media_types = media_types_fixture()
    %{media_types: media_types}
  end
end
