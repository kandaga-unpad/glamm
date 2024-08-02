defmodule GlammWeb.LanguageControllerTest do
  use GlammWeb.ConnCase

  import Glamm.Master.LookupFixtures

  @create_attrs %{language_name: "some language_name"}
  @update_attrs %{language_name: "some updated language_name"}
  @invalid_attrs %{language_name: nil}

  describe "index" do
    test "lists all mst_language", %{conn: conn} do
      conn = get(conn, ~p"/mst_language")
      assert html_response(conn, 200) =~ "Listing Mst language"
    end
  end

  describe "new language" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/mst_language/new")
      assert html_response(conn, 200) =~ "New Language"
    end
  end

  describe "create language" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/mst_language", language: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/mst_language/#{id}"

      conn = get(conn, ~p"/mst_language/#{id}")
      assert html_response(conn, 200) =~ "Language #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/mst_language", language: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Language"
    end
  end

  describe "edit language" do
    setup [:create_language]

    test "renders form for editing chosen language", %{conn: conn, language: language} do
      conn = get(conn, ~p"/mst_language/#{language}/edit")
      assert html_response(conn, 200) =~ "Edit Language"
    end
  end

  describe "update language" do
    setup [:create_language]

    test "redirects when data is valid", %{conn: conn, language: language} do
      conn = put(conn, ~p"/mst_language/#{language}", language: @update_attrs)
      assert redirected_to(conn) == ~p"/mst_language/#{language}"

      conn = get(conn, ~p"/mst_language/#{language}")
      assert html_response(conn, 200) =~ "some updated language_name"
    end

    test "renders errors when data is invalid", %{conn: conn, language: language} do
      conn = put(conn, ~p"/mst_language/#{language}", language: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Language"
    end
  end

  describe "delete language" do
    setup [:create_language]

    test "deletes chosen language", %{conn: conn, language: language} do
      conn = delete(conn, ~p"/mst_language/#{language}")
      assert redirected_to(conn) == ~p"/mst_language"

      assert_error_sent 404, fn ->
        get(conn, ~p"/mst_language/#{language}")
      end
    end
  end

  defp create_language(_) do
    language = language_fixture()
    %{language: language}
  end
end
