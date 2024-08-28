defmodule GlammWeb.FilesLiveTest do
  use GlammWeb.ConnCase

  import Phoenix.LiveViewTest
  import Glamm.GalleryFixtures

  @create_attrs %{id: "7488a646-e31f-11e4-aace-600308960662", file_title: "some file_title", file_type: "some file_type", file_url: "some file_url", file_directory: "some file_directory", mime_type: "some mime_type"}
  @update_attrs %{id: "7488a646-e31f-11e4-aace-600308960668", file_title: "some updated file_title", file_type: "some updated file_type", file_url: "some updated file_url", file_directory: "some updated file_directory", mime_type: "some updated mime_type"}
  @invalid_attrs %{id: nil, file_title: nil, file_type: nil, file_url: nil, file_directory: nil, mime_type: nil}

  defp create_files(_) do
    files = files_fixture()
    %{files: files}
  end

  describe "Index" do
    setup [:create_files]

    test "lists all gal_files", %{conn: conn, files: files} do
      {:ok, _index_live, html} = live(conn, ~p"/gal_files")

      assert html =~ "Listing Gal files"
      assert html =~ files.file_title
    end

    test "saves new files", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/gal_files")

      assert index_live |> element("a", "New Files") |> render_click() =~
               "New Files"

      assert_patch(index_live, ~p"/gal_files/new")

      assert index_live
             |> form("#files-form", files: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#files-form", files: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/gal_files")

      html = render(index_live)
      assert html =~ "Files created successfully"
      assert html =~ "some file_title"
    end

    test "updates files in listing", %{conn: conn, files: files} do
      {:ok, index_live, _html} = live(conn, ~p"/gal_files")

      assert index_live |> element("#gal_files-#{files.id} a", "Edit") |> render_click() =~
               "Edit Files"

      assert_patch(index_live, ~p"/gal_files/#{files}/edit")

      assert index_live
             |> form("#files-form", files: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#files-form", files: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/gal_files")

      html = render(index_live)
      assert html =~ "Files updated successfully"
      assert html =~ "some updated file_title"
    end

    test "deletes files in listing", %{conn: conn, files: files} do
      {:ok, index_live, _html} = live(conn, ~p"/gal_files")

      assert index_live |> element("#gal_files-#{files.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#gal_files-#{files.id}")
    end
  end

  describe "Show" do
    setup [:create_files]

    test "displays files", %{conn: conn, files: files} do
      {:ok, _show_live, html} = live(conn, ~p"/gal_files/#{files}")

      assert html =~ "Show Files"
      assert html =~ files.file_title
    end

    test "updates files within modal", %{conn: conn, files: files} do
      {:ok, show_live, _html} = live(conn, ~p"/gal_files/#{files}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Files"

      assert_patch(show_live, ~p"/gal_files/#{files}/show/edit")

      assert show_live
             |> form("#files-form", files: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#files-form", files: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/gal_files/#{files}")

      html = render(show_live)
      assert html =~ "Files updated successfully"
      assert html =~ "some updated file_title"
    end
  end
end
