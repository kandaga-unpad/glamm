defmodule GlammWeb.RequisitionLiveTest do
  use GlammWeb.ConnCase

  import Phoenix.LiveViewTest
  import Glamm.GalleryFixtures

  @create_attrs %{owner: "some owner", description: "some description", title: "some title", identifier: "some identifier", member_name: "some member_name", creator: "some creator", year_created: 42, price_currency: "some price_currency", price: 42, information: "some information", req_state: "some req_state"}
  @update_attrs %{owner: "some updated owner", description: "some updated description", title: "some updated title", identifier: "some updated identifier", member_name: "some updated member_name", creator: "some updated creator", year_created: 43, price_currency: "some updated price_currency", price: 43, information: "some updated information", req_state: "some updated req_state"}
  @invalid_attrs %{owner: nil, description: nil, title: nil, identifier: nil, member_name: nil, creator: nil, year_created: nil, price_currency: nil, price: nil, information: nil, req_state: nil}

  defp create_requisition(_) do
    requisition = requisition_fixture()
    %{requisition: requisition}
  end

  describe "Index" do
    setup [:create_requisition]

    test "lists all gal_requisitions", %{conn: conn, requisition: requisition} do
      {:ok, _index_live, html} = live(conn, ~p"/gal_requisitions")

      assert html =~ "Listing Gal requisitions"
      assert html =~ requisition.owner
    end

    test "saves new requisition", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/gal_requisitions")

      assert index_live |> element("a", "New Requisition") |> render_click() =~
               "New Requisition"

      assert_patch(index_live, ~p"/gal_requisitions/new")

      assert index_live
             |> form("#requisition-form", requisition: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#requisition-form", requisition: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/gal_requisitions")

      html = render(index_live)
      assert html =~ "Requisition created successfully"
      assert html =~ "some owner"
    end

    test "updates requisition in listing", %{conn: conn, requisition: requisition} do
      {:ok, index_live, _html} = live(conn, ~p"/gal_requisitions")

      assert index_live |> element("#gal_requisitions-#{requisition.id} a", "Edit") |> render_click() =~
               "Edit Requisition"

      assert_patch(index_live, ~p"/gal_requisitions/#{requisition}/edit")

      assert index_live
             |> form("#requisition-form", requisition: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#requisition-form", requisition: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/gal_requisitions")

      html = render(index_live)
      assert html =~ "Requisition updated successfully"
      assert html =~ "some updated owner"
    end

    test "deletes requisition in listing", %{conn: conn, requisition: requisition} do
      {:ok, index_live, _html} = live(conn, ~p"/gal_requisitions")

      assert index_live |> element("#gal_requisitions-#{requisition.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#gal_requisitions-#{requisition.id}")
    end
  end

  describe "Show" do
    setup [:create_requisition]

    test "displays requisition", %{conn: conn, requisition: requisition} do
      {:ok, _show_live, html} = live(conn, ~p"/gal_requisitions/#{requisition}")

      assert html =~ "Show Requisition"
      assert html =~ requisition.owner
    end

    test "updates requisition within modal", %{conn: conn, requisition: requisition} do
      {:ok, show_live, _html} = live(conn, ~p"/gal_requisitions/#{requisition}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Requisition"

      assert_patch(show_live, ~p"/gal_requisitions/#{requisition}/show/edit")

      assert show_live
             |> form("#requisition-form", requisition: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#requisition-form", requisition: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/gal_requisitions/#{requisition}")

      html = render(show_live)
      assert html =~ "Requisition updated successfully"
      assert html =~ "some updated owner"
    end
  end
end
