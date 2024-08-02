defmodule GlammWeb.LabelControllerTest do
  use GlammWeb.ConnCase

  import Glamm.Master.LookupFixtures

  @create_attrs %{label_name: "some label_name", label_description: "some label_description", label_icon: "some label_icon"}
  @update_attrs %{label_name: "some updated label_name", label_description: "some updated label_description", label_icon: "some updated label_icon"}
  @invalid_attrs %{label_name: nil, label_description: nil, label_icon: nil}

  describe "index" do
    test "lists all mst_labels", %{conn: conn} do
      conn = get(conn, ~p"/mst_labels")
      assert html_response(conn, 200) =~ "Listing Mst labels"
    end
  end

  describe "new label" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/mst_labels/new")
      assert html_response(conn, 200) =~ "New Label"
    end
  end

  describe "create label" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/mst_labels", label: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/mst_labels/#{id}"

      conn = get(conn, ~p"/mst_labels/#{id}")
      assert html_response(conn, 200) =~ "Label #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/mst_labels", label: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Label"
    end
  end

  describe "edit label" do
    setup [:create_label]

    test "renders form for editing chosen label", %{conn: conn, label: label} do
      conn = get(conn, ~p"/mst_labels/#{label}/edit")
      assert html_response(conn, 200) =~ "Edit Label"
    end
  end

  describe "update label" do
    setup [:create_label]

    test "redirects when data is valid", %{conn: conn, label: label} do
      conn = put(conn, ~p"/mst_labels/#{label}", label: @update_attrs)
      assert redirected_to(conn) == ~p"/mst_labels/#{label}"

      conn = get(conn, ~p"/mst_labels/#{label}")
      assert html_response(conn, 200) =~ "some updated label_name"
    end

    test "renders errors when data is invalid", %{conn: conn, label: label} do
      conn = put(conn, ~p"/mst_labels/#{label}", label: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Label"
    end
  end

  describe "delete label" do
    setup [:create_label]

    test "deletes chosen label", %{conn: conn, label: label} do
      conn = delete(conn, ~p"/mst_labels/#{label}")
      assert redirected_to(conn) == ~p"/mst_labels"

      assert_error_sent 404, fn ->
        get(conn, ~p"/mst_labels/#{label}")
      end
    end
  end

  defp create_label(_) do
    label = label_fixture()
    %{label: label}
  end
end
