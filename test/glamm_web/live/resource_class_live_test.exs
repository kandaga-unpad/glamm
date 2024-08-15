defmodule GlammWeb.ResourceClassLiveTest do
  use GlammWeb.ConnCase

  import Phoenix.LiveViewTest
  import Glamm.MetadataFixtures

  @create_attrs %{label: "some label", local_name: "some local_name", information: "some information"}
  @update_attrs %{label: "some updated label", local_name: "some updated local_name", information: "some updated information"}
  @invalid_attrs %{label: nil, local_name: nil, information: nil}

  defp create_resource_class(_) do
    resource_class = resource_class_fixture()
    %{resource_class: resource_class}
  end

  describe "Index" do
    setup [:create_resource_class]

    test "lists all resource_class", %{conn: conn, resource_class: resource_class} do
      {:ok, _index_live, html} = live(conn, ~p"/resource_class")

      assert html =~ "Listing Resource class"
      assert html =~ resource_class.label
    end

    test "saves new resource_class", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/resource_class")

      assert index_live |> element("a", "New Resource class") |> render_click() =~
               "New Resource class"

      assert_patch(index_live, ~p"/resource_class/new")

      assert index_live
             |> form("#resource_class-form", resource_class: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#resource_class-form", resource_class: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/resource_class")

      html = render(index_live)
      assert html =~ "Resource class created successfully"
      assert html =~ "some label"
    end

    test "updates resource_class in listing", %{conn: conn, resource_class: resource_class} do
      {:ok, index_live, _html} = live(conn, ~p"/resource_class")

      assert index_live |> element("#resource_class-#{resource_class.id} a", "Edit") |> render_click() =~
               "Edit Resource class"

      assert_patch(index_live, ~p"/resource_class/#{resource_class}/edit")

      assert index_live
             |> form("#resource_class-form", resource_class: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#resource_class-form", resource_class: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/resource_class")

      html = render(index_live)
      assert html =~ "Resource class updated successfully"
      assert html =~ "some updated label"
    end

    test "deletes resource_class in listing", %{conn: conn, resource_class: resource_class} do
      {:ok, index_live, _html} = live(conn, ~p"/resource_class")

      assert index_live |> element("#resource_class-#{resource_class.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#resource_class-#{resource_class.id}")
    end
  end

  describe "Show" do
    setup [:create_resource_class]

    test "displays resource_class", %{conn: conn, resource_class: resource_class} do
      {:ok, _show_live, html} = live(conn, ~p"/resource_class/#{resource_class}")

      assert html =~ "Show Resource class"
      assert html =~ resource_class.label
    end

    test "updates resource_class within modal", %{conn: conn, resource_class: resource_class} do
      {:ok, show_live, _html} = live(conn, ~p"/resource_class/#{resource_class}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Resource class"

      assert_patch(show_live, ~p"/resource_class/#{resource_class}/show/edit")

      assert show_live
             |> form("#resource_class-form", resource_class: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#resource_class-form", resource_class: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/resource_class/#{resource_class}")

      html = render(show_live)
      assert html =~ "Resource class updated successfully"
      assert html =~ "some updated label"
    end
  end
end
