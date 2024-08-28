defmodule GlammWeb.ResourceTemplatePropertyLiveTest do
  use GlammWeb.ConnCase

  import Phoenix.LiveViewTest
  import Glamm.MetadataFixtures

  @create_attrs %{position: 42, data_type: ["option1", "option2"], alternate_label: "some alternate_label", alternate_information: "some alternate_information", is_required: true, is_public: true}
  @update_attrs %{position: 43, data_type: ["option1"], alternate_label: "some updated alternate_label", alternate_information: "some updated alternate_information", is_required: false, is_public: false}
  @invalid_attrs %{position: nil, data_type: [], alternate_label: nil, alternate_information: nil, is_required: false, is_public: false}

  defp create_resource_template_property(_) do
    resource_template_property = resource_template_property_fixture()
    %{resource_template_property: resource_template_property}
  end

  describe "Index" do
    setup [:create_resource_template_property]

    test "lists all resource_template_property", %{conn: conn, resource_template_property: resource_template_property} do
      {:ok, _index_live, html} = live(conn, ~p"/resource_template_property")

      assert html =~ "Listing Resource template property"
      assert html =~ resource_template_property.alternate_label
    end

    test "saves new resource_template_property", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/resource_template_property")

      assert index_live |> element("a", "New Resource template property") |> render_click() =~
               "New Resource template property"

      assert_patch(index_live, ~p"/resource_template_property/new")

      assert index_live
             |> form("#resource_template_property-form", resource_template_property: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#resource_template_property-form", resource_template_property: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/resource_template_property")

      html = render(index_live)
      assert html =~ "Resource template property created successfully"
      assert html =~ "some alternate_label"
    end

    test "updates resource_template_property in listing", %{conn: conn, resource_template_property: resource_template_property} do
      {:ok, index_live, _html} = live(conn, ~p"/resource_template_property")

      assert index_live |> element("#resource_template_property-#{resource_template_property.id} a", "Edit") |> render_click() =~
               "Edit Resource template property"

      assert_patch(index_live, ~p"/resource_template_property/#{resource_template_property}/edit")

      assert index_live
             |> form("#resource_template_property-form", resource_template_property: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#resource_template_property-form", resource_template_property: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/resource_template_property")

      html = render(index_live)
      assert html =~ "Resource template property updated successfully"
      assert html =~ "some updated alternate_label"
    end

    test "deletes resource_template_property in listing", %{conn: conn, resource_template_property: resource_template_property} do
      {:ok, index_live, _html} = live(conn, ~p"/resource_template_property")

      assert index_live |> element("#resource_template_property-#{resource_template_property.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#resource_template_property-#{resource_template_property.id}")
    end
  end

  describe "Show" do
    setup [:create_resource_template_property]

    test "displays resource_template_property", %{conn: conn, resource_template_property: resource_template_property} do
      {:ok, _show_live, html} = live(conn, ~p"/resource_template_property/#{resource_template_property}")

      assert html =~ "Show Resource template property"
      assert html =~ resource_template_property.alternate_label
    end

    test "updates resource_template_property within modal", %{conn: conn, resource_template_property: resource_template_property} do
      {:ok, show_live, _html} = live(conn, ~p"/resource_template_property/#{resource_template_property}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Resource template property"

      assert_patch(show_live, ~p"/resource_template_property/#{resource_template_property}/show/edit")

      assert show_live
             |> form("#resource_template_property-form", resource_template_property: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#resource_template_property-form", resource_template_property: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/resource_template_property/#{resource_template_property}")

      html = render(show_live)
      assert html =~ "Resource template property updated successfully"
      assert html =~ "some updated alternate_label"
    end
  end
end
