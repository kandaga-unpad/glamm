defmodule GlammWeb.ResourceTemplateLiveTest do
  use GlammWeb.ConnCase

  import Phoenix.LiveViewTest
  import Glamm.MetadataFixtures

  @create_attrs %{label: "some label"}
  @update_attrs %{label: "some updated label"}
  @invalid_attrs %{label: nil}

  defp create_resource_template(_) do
    resource_template = resource_template_fixture()
    %{resource_template: resource_template}
  end

  describe "Index" do
    setup [:create_resource_template]

    test "lists all resource_template", %{conn: conn, resource_template: resource_template} do
      {:ok, _index_live, html} = live(conn, ~p"/resource_template")

      assert html =~ "Listing Resource template"
      assert html =~ resource_template.label
    end

    test "saves new resource_template", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/resource_template")

      assert index_live |> element("a", "New Resource template") |> render_click() =~
               "New Resource template"

      assert_patch(index_live, ~p"/resource_template/new")

      assert index_live
             |> form("#resource_template-form", resource_template: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#resource_template-form", resource_template: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/resource_template")

      html = render(index_live)
      assert html =~ "Resource template created successfully"
      assert html =~ "some label"
    end

    test "updates resource_template in listing", %{conn: conn, resource_template: resource_template} do
      {:ok, index_live, _html} = live(conn, ~p"/resource_template")

      assert index_live |> element("#resource_template-#{resource_template.id} a", "Edit") |> render_click() =~
               "Edit Resource template"

      assert_patch(index_live, ~p"/resource_template/#{resource_template}/edit")

      assert index_live
             |> form("#resource_template-form", resource_template: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#resource_template-form", resource_template: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/resource_template")

      html = render(index_live)
      assert html =~ "Resource template updated successfully"
      assert html =~ "some updated label"
    end

    test "deletes resource_template in listing", %{conn: conn, resource_template: resource_template} do
      {:ok, index_live, _html} = live(conn, ~p"/resource_template")

      assert index_live |> element("#resource_template-#{resource_template.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#resource_template-#{resource_template.id}")
    end
  end

  describe "Show" do
    setup [:create_resource_template]

    test "displays resource_template", %{conn: conn, resource_template: resource_template} do
      {:ok, _show_live, html} = live(conn, ~p"/resource_template/#{resource_template}")

      assert html =~ "Show Resource template"
      assert html =~ resource_template.label
    end

    test "updates resource_template within modal", %{conn: conn, resource_template: resource_template} do
      {:ok, show_live, _html} = live(conn, ~p"/resource_template/#{resource_template}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Resource template"

      assert_patch(show_live, ~p"/resource_template/#{resource_template}/show/edit")

      assert show_live
             |> form("#resource_template-form", resource_template: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#resource_template-form", resource_template: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/resource_template/#{resource_template}")

      html = render(show_live)
      assert html =~ "Resource template updated successfully"
      assert html =~ "some updated label"
    end
  end
end
