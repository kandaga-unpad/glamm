defmodule GlammWeb.ItemLiveTest do
  use GlammWeb.ConnCase

  import Phoenix.LiveViewTest
  import Glamm.GalleryFixtures

  @create_attrs %{item_code: "some item_code", inventory_code: "some inventory_code", order_date: "2024-09-11T04:04:00Z", received_date: "2024-09-11T04:04:00Z", invoice: "some invoice", invoice_date: "2024-09-11"}
  @update_attrs %{item_code: "some updated item_code", inventory_code: "some updated inventory_code", order_date: "2024-09-12T04:04:00Z", received_date: "2024-09-12T04:04:00Z", invoice: "some updated invoice", invoice_date: "2024-09-12"}
  @invalid_attrs %{item_code: nil, inventory_code: nil, order_date: nil, received_date: nil, invoice: nil, invoice_date: nil}

  defp create_item(_) do
    item = item_fixture()
    %{item: item}
  end

  describe "Index" do
    setup [:create_item]

    test "lists all gal_items", %{conn: conn, item: item} do
      {:ok, _index_live, html} = live(conn, ~p"/gal_items")

      assert html =~ "Listing Gal items"
      assert html =~ item.item_code
    end

    test "saves new item", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/gal_items")

      assert index_live |> element("a", "New Item") |> render_click() =~
               "New Item"

      assert_patch(index_live, ~p"/gal_items/new")

      assert index_live
             |> form("#item-form", item: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#item-form", item: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/gal_items")

      html = render(index_live)
      assert html =~ "Item created successfully"
      assert html =~ "some item_code"
    end

    test "updates item in listing", %{conn: conn, item: item} do
      {:ok, index_live, _html} = live(conn, ~p"/gal_items")

      assert index_live |> element("#gal_items-#{item.id} a", "Edit") |> render_click() =~
               "Edit Item"

      assert_patch(index_live, ~p"/gal_items/#{item}/edit")

      assert index_live
             |> form("#item-form", item: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#item-form", item: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/gal_items")

      html = render(index_live)
      assert html =~ "Item updated successfully"
      assert html =~ "some updated item_code"
    end

    test "deletes item in listing", %{conn: conn, item: item} do
      {:ok, index_live, _html} = live(conn, ~p"/gal_items")

      assert index_live |> element("#gal_items-#{item.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#gal_items-#{item.id}")
    end
  end

  describe "Show" do
    setup [:create_item]

    test "displays item", %{conn: conn, item: item} do
      {:ok, _show_live, html} = live(conn, ~p"/gal_items/#{item}")

      assert html =~ "Show Item"
      assert html =~ item.item_code
    end

    test "updates item within modal", %{conn: conn, item: item} do
      {:ok, show_live, _html} = live(conn, ~p"/gal_items/#{item}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Item"

      assert_patch(show_live, ~p"/gal_items/#{item}/show/edit")

      assert show_live
             |> form("#item-form", item: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#item-form", item: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/gal_items/#{item}")

      html = render(show_live)
      assert html =~ "Item updated successfully"
      assert html =~ "some updated item_code"
    end
  end
end
