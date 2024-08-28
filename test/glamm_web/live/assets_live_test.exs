defmodule GlammWeb.AssetsLiveTest do
  use GlammWeb.ConnCase

  import Phoenix.LiveViewTest
  import Glamm.GalleryFixtures

  @create_attrs %{id: "7488a646-e31f-11e4-aace-600308960662", description: "some description", file_name: "some file_name"}
  @update_attrs %{id: "7488a646-e31f-11e4-aace-600308960668", description: "some updated description", file_name: "some updated file_name"}
  @invalid_attrs %{id: nil, description: nil, file_name: nil}

  defp create_assets(_) do
    assets = assets_fixture()
    %{assets: assets}
  end

  describe "Index" do
    setup [:create_assets]

    test "lists all gal_assets", %{conn: conn, assets: assets} do
      {:ok, _index_live, html} = live(conn, ~p"/gal_assets")

      assert html =~ "Listing Gal assets"
      assert html =~ assets.description
    end

    test "saves new assets", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/gal_assets")

      assert index_live |> element("a", "New Assets") |> render_click() =~
               "New Assets"

      assert_patch(index_live, ~p"/gal_assets/new")

      assert index_live
             |> form("#assets-form", assets: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#assets-form", assets: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/gal_assets")

      html = render(index_live)
      assert html =~ "Assets created successfully"
      assert html =~ "some description"
    end

    test "updates assets in listing", %{conn: conn, assets: assets} do
      {:ok, index_live, _html} = live(conn, ~p"/gal_assets")

      assert index_live |> element("#gal_assets-#{assets.id} a", "Edit") |> render_click() =~
               "Edit Assets"

      assert_patch(index_live, ~p"/gal_assets/#{assets}/edit")

      assert index_live
             |> form("#assets-form", assets: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#assets-form", assets: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/gal_assets")

      html = render(index_live)
      assert html =~ "Assets updated successfully"
      assert html =~ "some updated description"
    end

    test "deletes assets in listing", %{conn: conn, assets: assets} do
      {:ok, index_live, _html} = live(conn, ~p"/gal_assets")

      assert index_live |> element("#gal_assets-#{assets.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#gal_assets-#{assets.id}")
    end
  end

  describe "Show" do
    setup [:create_assets]

    test "displays assets", %{conn: conn, assets: assets} do
      {:ok, _show_live, html} = live(conn, ~p"/gal_assets/#{assets}")

      assert html =~ "Show Assets"
      assert html =~ assets.description
    end

    test "updates assets within modal", %{conn: conn, assets: assets} do
      {:ok, show_live, _html} = live(conn, ~p"/gal_assets/#{assets}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Assets"

      assert_patch(show_live, ~p"/gal_assets/#{assets}/show/edit")

      assert show_live
             |> form("#assets-form", assets: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#assets-form", assets: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/gal_assets/#{assets}")

      html = render(show_live)
      assert html =~ "Assets updated successfully"
      assert html =~ "some updated description"
    end
  end
end
