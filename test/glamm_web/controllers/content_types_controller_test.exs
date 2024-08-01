defmodule GlammWeb.ContentTypesControllerTest do
  use GlammWeb.ConnCase

  import Glamm.MasterFixtures

  @create_attrs %{code: "some code", content_type: "some content_type", mar_code: "some mar_code"}
  @update_attrs %{code: "some updated code", content_type: "some updated content_type", mar_code: "some updated mar_code"}
  @invalid_attrs %{code: nil, content_type: nil, mar_code: nil}

  describe "index" do
    test "lists all mst_content_types", %{conn: conn} do
      conn = get(conn, ~p"/mst_content_types")
      assert html_response(conn, 200) =~ "Listing Mst content types"
    end
  end

  describe "new content_types" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/mst_content_types/new")
      assert html_response(conn, 200) =~ "New Content types"
    end
  end

  describe "create content_types" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/mst_content_types", content_types: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/mst_content_types/#{id}"

      conn = get(conn, ~p"/mst_content_types/#{id}")
      assert html_response(conn, 200) =~ "Content types #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/mst_content_types", content_types: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Content types"
    end
  end

  describe "edit content_types" do
    setup [:create_content_types]

    test "renders form for editing chosen content_types", %{conn: conn, content_types: content_types} do
      conn = get(conn, ~p"/mst_content_types/#{content_types}/edit")
      assert html_response(conn, 200) =~ "Edit Content types"
    end
  end

  describe "update content_types" do
    setup [:create_content_types]

    test "redirects when data is valid", %{conn: conn, content_types: content_types} do
      conn = put(conn, ~p"/mst_content_types/#{content_types}", content_types: @update_attrs)
      assert redirected_to(conn) == ~p"/mst_content_types/#{content_types}"

      conn = get(conn, ~p"/mst_content_types/#{content_types}")
      assert html_response(conn, 200) =~ "some updated code"
    end

    test "renders errors when data is invalid", %{conn: conn, content_types: content_types} do
      conn = put(conn, ~p"/mst_content_types/#{content_types}", content_types: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Content types"
    end
  end

  describe "delete content_types" do
    setup [:create_content_types]

    test "deletes chosen content_types", %{conn: conn, content_types: content_types} do
      conn = delete(conn, ~p"/mst_content_types/#{content_types}")
      assert redirected_to(conn) == ~p"/mst_content_types"

      assert_error_sent 404, fn ->
        get(conn, ~p"/mst_content_types/#{content_types}")
      end
    end
  end

  defp create_content_types(_) do
    content_types = content_types_fixture()
    %{content_types: content_types}
  end
end
