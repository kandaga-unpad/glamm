defmodule GlammWeb.CollectionTypeLiveTest do
  use GlammWeb.ConnCase

  import Phoenix.LiveViewTest
  import Glamm.GalleryFixtures

  @create_attrs %{description: "some description", collection_name: "some collection_name"}
  @update_attrs %{description: "some updated description", collection_name: "some updated collection_name"}
  @invalid_attrs %{description: nil, collection_name: nil}

  defp create_collection_type(_) do
    collection_type = collection_type_fixture()
    %{collection_type: collection_type}
  end

  describe "Index" do
    setup [:create_collection_type]

    test "lists all gal_collection_type", %{conn: conn, collection_type: collection_type} do
      {:ok, _index_live, html} = live(conn, ~p"/gal_collection_type")

      assert html =~ "Listing Gal collection type"
      assert html =~ collection_type.description
    end

    test "saves new collection_type", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/gal_collection_type")

      assert index_live |> element("a", "New Collection type") |> render_click() =~
               "New Collection type"

      assert_patch(index_live, ~p"/gal_collection_type/new")

      assert index_live
             |> form("#collection_type-form", collection_type: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#collection_type-form", collection_type: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/gal_collection_type")

      html = render(index_live)
      assert html =~ "Collection type created successfully"
      assert html =~ "some description"
    end

    test "updates collection_type in listing", %{conn: conn, collection_type: collection_type} do
      {:ok, index_live, _html} = live(conn, ~p"/gal_collection_type")

      assert index_live |> element("#gal_collection_type-#{collection_type.id} a", "Edit") |> render_click() =~
               "Edit Collection type"

      assert_patch(index_live, ~p"/gal_collection_type/#{collection_type}/edit")

      assert index_live
             |> form("#collection_type-form", collection_type: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#collection_type-form", collection_type: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/gal_collection_type")

      html = render(index_live)
      assert html =~ "Collection type updated successfully"
      assert html =~ "some updated description"
    end

    test "deletes collection_type in listing", %{conn: conn, collection_type: collection_type} do
      {:ok, index_live, _html} = live(conn, ~p"/gal_collection_type")

      assert index_live |> element("#gal_collection_type-#{collection_type.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#gal_collection_type-#{collection_type.id}")
    end
  end

  describe "Show" do
    setup [:create_collection_type]

    test "displays collection_type", %{conn: conn, collection_type: collection_type} do
      {:ok, _show_live, html} = live(conn, ~p"/gal_collection_type/#{collection_type}")

      assert html =~ "Show Collection type"
      assert html =~ collection_type.description
    end

    test "updates collection_type within modal", %{conn: conn, collection_type: collection_type} do
      {:ok, show_live, _html} = live(conn, ~p"/gal_collection_type/#{collection_type}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Collection type"

      assert_patch(show_live, ~p"/gal_collection_type/#{collection_type}/show/edit")

      assert show_live
             |> form("#collection_type-form", collection_type: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#collection_type-form", collection_type: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/gal_collection_type/#{collection_type}")

      html = render(show_live)
      assert html =~ "Collection type updated successfully"
      assert html =~ "some updated description"
    end
  end
end
