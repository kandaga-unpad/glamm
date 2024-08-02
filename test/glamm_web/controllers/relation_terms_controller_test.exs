defmodule GlammWeb.RelationTermsControllerTest do
  use GlammWeb.ConnCase

  import Glamm.Master.AuthorityFixtures

  @create_attrs %{rt_code: "some rt_code", rt_description: "some rt_description"}
  @update_attrs %{rt_code: "some updated rt_code", rt_description: "some updated rt_description"}
  @invalid_attrs %{rt_code: nil, rt_description: nil}

  describe "index" do
    test "lists all mst_relation_terms", %{conn: conn} do
      conn = get(conn, ~p"/mst_relation_terms")
      assert html_response(conn, 200) =~ "Listing Mst relation terms"
    end
  end

  describe "new relation_terms" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/mst_relation_terms/new")
      assert html_response(conn, 200) =~ "New Relation terms"
    end
  end

  describe "create relation_terms" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/mst_relation_terms", relation_terms: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/mst_relation_terms/#{id}"

      conn = get(conn, ~p"/mst_relation_terms/#{id}")
      assert html_response(conn, 200) =~ "Relation terms #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/mst_relation_terms", relation_terms: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Relation terms"
    end
  end

  describe "edit relation_terms" do
    setup [:create_relation_terms]

    test "renders form for editing chosen relation_terms", %{conn: conn, relation_terms: relation_terms} do
      conn = get(conn, ~p"/mst_relation_terms/#{relation_terms}/edit")
      assert html_response(conn, 200) =~ "Edit Relation terms"
    end
  end

  describe "update relation_terms" do
    setup [:create_relation_terms]

    test "redirects when data is valid", %{conn: conn, relation_terms: relation_terms} do
      conn = put(conn, ~p"/mst_relation_terms/#{relation_terms}", relation_terms: @update_attrs)
      assert redirected_to(conn) == ~p"/mst_relation_terms/#{relation_terms}"

      conn = get(conn, ~p"/mst_relation_terms/#{relation_terms}")
      assert html_response(conn, 200) =~ "some updated rt_code"
    end

    test "renders errors when data is invalid", %{conn: conn, relation_terms: relation_terms} do
      conn = put(conn, ~p"/mst_relation_terms/#{relation_terms}", relation_terms: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Relation terms"
    end
  end

  describe "delete relation_terms" do
    setup [:create_relation_terms]

    test "deletes chosen relation_terms", %{conn: conn, relation_terms: relation_terms} do
      conn = delete(conn, ~p"/mst_relation_terms/#{relation_terms}")
      assert redirected_to(conn) == ~p"/mst_relation_terms"

      assert_error_sent 404, fn ->
        get(conn, ~p"/mst_relation_terms/#{relation_terms}")
      end
    end
  end

  defp create_relation_terms(_) do
    relation_terms = relation_terms_fixture()
    %{relation_terms: relation_terms}
  end
end
