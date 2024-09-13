defmodule GlammWeb.ItemValueLiveTest do
  use GlammWeb.ConnCase

  import Phoenix.LiveViewTest
  import Glamm.GalleryFixtures

  @create_attrs %{type: "some type", value: "some value", url: "some url", lang: "some lang", scope_view: "some scope_view"}
  @update_attrs %{type: "some updated type", value: "some updated value", url: "some updated url", lang: "some updated lang", scope_view: "some updated scope_view"}
  @invalid_attrs %{type: nil, value: nil, url: nil, lang: nil, scope_view: nil}

  defp create_item_value(_) do
    item_value = item_value_fixture()
    %{item_value: item_value}
  end

  describe "Index" do
    setup [:create_item_value]

    test "lists all gal_item_value", %{conn: conn, item_value: item_value} do
      {:ok, _index_live, html} = live(conn, ~p"/gal_item_value")

      assert html =~ "Listing Gal item value"
      assert html =~ item_value.type
    end

    test "saves new item_value", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/gal_item_value")

      assert index_live |> element("a", "New Item value") |> render_click() =~
               "New Item value"

      assert_patch(index_live, ~p"/gal_item_value/new")

      assert index_live
             |> form("#item_value-form", item_value: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#item_value-form", item_value: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/gal_item_value")

      html = render(index_live)
      assert html =~ "Item value created successfully"
      assert html =~ "some type"
    end

    test "updates item_value in listing", %{conn: conn, item_value: item_value} do
      {:ok, index_live, _html} = live(conn, ~p"/gal_item_value")

      assert index_live |> element("#gal_item_value-#{item_value.id} a", "Edit") |> render_click() =~
               "Edit Item value"

      assert_patch(index_live, ~p"/gal_item_value/#{item_value}/edit")

      assert index_live
             |> form("#item_value-form", item_value: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#item_value-form", item_value: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/gal_item_value")

      html = render(index_live)
      assert html =~ "Item value updated successfully"
      assert html =~ "some updated type"
    end

    test "deletes item_value in listing", %{conn: conn, item_value: item_value} do
      {:ok, index_live, _html} = live(conn, ~p"/gal_item_value")

      assert index_live |> element("#gal_item_value-#{item_value.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#gal_item_value-#{item_value.id}")
    end
  end

  describe "Show" do
    setup [:create_item_value]

    test "displays item_value", %{conn: conn, item_value: item_value} do
      {:ok, _show_live, html} = live(conn, ~p"/gal_item_value/#{item_value}")

      assert html =~ "Show Item value"
      assert html =~ item_value.type
    end

    test "updates item_value within modal", %{conn: conn, item_value: item_value} do
      {:ok, show_live, _html} = live(conn, ~p"/gal_item_value/#{item_value}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Item value"

      assert_patch(show_live, ~p"/gal_item_value/#{item_value}/show/edit")

      assert show_live
             |> form("#item_value-form", item_value: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#item_value-form", item_value: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/gal_item_value/#{item_value}")

      html = render(show_live)
      assert html =~ "Item value updated successfully"
      assert html =~ "some updated type"
    end
  end
end
