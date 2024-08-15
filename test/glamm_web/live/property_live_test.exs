defmodule GlammWeb.PropertyLiveTest do
  use GlammWeb.ConnCase

  import Phoenix.LiveViewTest
  import Glamm.MetadataFixtures

  @create_attrs %{local: "some local", local_name: "some local_name", information: "some information"}
  @update_attrs %{local: "some updated local", local_name: "some updated local_name", information: "some updated information"}
  @invalid_attrs %{local: nil, local_name: nil, information: nil}

  defp create_property(_) do
    property = property_fixture()
    %{property: property}
  end

  describe "Index" do
    setup [:create_property]

    test "lists all metadata_properties", %{conn: conn, property: property} do
      {:ok, _index_live, html} = live(conn, ~p"/metadata_properties")

      assert html =~ "Listing Metadata properties"
      assert html =~ property.local
    end

    test "saves new property", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/metadata_properties")

      assert index_live |> element("a", "New Property") |> render_click() =~
               "New Property"

      assert_patch(index_live, ~p"/metadata_properties/new")

      assert index_live
             |> form("#property-form", property: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#property-form", property: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/metadata_properties")

      html = render(index_live)
      assert html =~ "Property created successfully"
      assert html =~ "some local"
    end

    test "updates property in listing", %{conn: conn, property: property} do
      {:ok, index_live, _html} = live(conn, ~p"/metadata_properties")

      assert index_live |> element("#metadata_properties-#{property.id} a", "Edit") |> render_click() =~
               "Edit Property"

      assert_patch(index_live, ~p"/metadata_properties/#{property}/edit")

      assert index_live
             |> form("#property-form", property: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#property-form", property: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/metadata_properties")

      html = render(index_live)
      assert html =~ "Property updated successfully"
      assert html =~ "some updated local"
    end

    test "deletes property in listing", %{conn: conn, property: property} do
      {:ok, index_live, _html} = live(conn, ~p"/metadata_properties")

      assert index_live |> element("#metadata_properties-#{property.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#metadata_properties-#{property.id}")
    end
  end

  describe "Show" do
    setup [:create_property]

    test "displays property", %{conn: conn, property: property} do
      {:ok, _show_live, html} = live(conn, ~p"/metadata_properties/#{property}")

      assert html =~ "Show Property"
      assert html =~ property.local
    end

    test "updates property within modal", %{conn: conn, property: property} do
      {:ok, show_live, _html} = live(conn, ~p"/metadata_properties/#{property}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Property"

      assert_patch(show_live, ~p"/metadata_properties/#{property}/show/edit")

      assert show_live
             |> form("#property-form", property: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#property-form", property: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/metadata_properties/#{property}")

      html = render(show_live)
      assert html =~ "Property updated successfully"
      assert html =~ "some updated local"
    end
  end
end
