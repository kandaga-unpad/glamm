defmodule GlammWeb.VocabularyLiveTest do
  use GlammWeb.ConnCase

  import Phoenix.LiveViewTest
  import Glamm.MetadataFixtures

  @create_attrs %{label: "some label", prefix: "some prefix", namespace_url: "some namespace_url", information: "some information"}
  @update_attrs %{label: "some updated label", prefix: "some updated prefix", namespace_url: "some updated namespace_url", information: "some updated information"}
  @invalid_attrs %{label: nil, prefix: nil, namespace_url: nil, information: nil}

  defp create_vocabulary(_) do
    vocabulary = vocabulary_fixture()
    %{vocabulary: vocabulary}
  end

  describe "Index" do
    setup [:create_vocabulary]

    test "lists all metadata_vocabularies", %{conn: conn, vocabulary: vocabulary} do
      {:ok, _index_live, html} = live(conn, ~p"/metadata_vocabularies")

      assert html =~ "Listing Metadata vocabularies"
      assert html =~ vocabulary.label
    end

    test "saves new vocabulary", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/metadata_vocabularies")

      assert index_live |> element("a", "New Vocabulary") |> render_click() =~
               "New Vocabulary"

      assert_patch(index_live, ~p"/metadata_vocabularies/new")

      assert index_live
             |> form("#vocabulary-form", vocabulary: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#vocabulary-form", vocabulary: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/metadata_vocabularies")

      html = render(index_live)
      assert html =~ "Vocabulary created successfully"
      assert html =~ "some label"
    end

    test "updates vocabulary in listing", %{conn: conn, vocabulary: vocabulary} do
      {:ok, index_live, _html} = live(conn, ~p"/metadata_vocabularies")

      assert index_live |> element("#metadata_vocabularies-#{vocabulary.id} a", "Edit") |> render_click() =~
               "Edit Vocabulary"

      assert_patch(index_live, ~p"/metadata_vocabularies/#{vocabulary}/edit")

      assert index_live
             |> form("#vocabulary-form", vocabulary: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#vocabulary-form", vocabulary: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/metadata_vocabularies")

      html = render(index_live)
      assert html =~ "Vocabulary updated successfully"
      assert html =~ "some updated label"
    end

    test "deletes vocabulary in listing", %{conn: conn, vocabulary: vocabulary} do
      {:ok, index_live, _html} = live(conn, ~p"/metadata_vocabularies")

      assert index_live |> element("#metadata_vocabularies-#{vocabulary.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#metadata_vocabularies-#{vocabulary.id}")
    end
  end

  describe "Show" do
    setup [:create_vocabulary]

    test "displays vocabulary", %{conn: conn, vocabulary: vocabulary} do
      {:ok, _show_live, html} = live(conn, ~p"/metadata_vocabularies/#{vocabulary}")

      assert html =~ "Show Vocabulary"
      assert html =~ vocabulary.label
    end

    test "updates vocabulary within modal", %{conn: conn, vocabulary: vocabulary} do
      {:ok, show_live, _html} = live(conn, ~p"/metadata_vocabularies/#{vocabulary}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Vocabulary"

      assert_patch(show_live, ~p"/metadata_vocabularies/#{vocabulary}/show/edit")

      assert show_live
             |> form("#vocabulary-form", vocabulary: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#vocabulary-form", vocabulary: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/metadata_vocabularies/#{vocabulary}")

      html = render(show_live)
      assert html =~ "Vocabulary updated successfully"
      assert html =~ "some updated label"
    end
  end
end
