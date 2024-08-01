defmodule GlammWeb.GMDControllerTest do
  use GlammWeb.ConnCase

  import Glamm.MasterFixtures

  @create_attrs %{gmd_code: "some gmd_code", gmd_name: "some gmd_name", icon_image: "some icon_image"}
  @update_attrs %{gmd_code: "some updated gmd_code", gmd_name: "some updated gmd_name", icon_image: "some updated icon_image"}
  @invalid_attrs %{gmd_code: nil, gmd_name: nil, icon_image: nil}

  describe "index" do
    test "lists all mst_gmd", %{conn: conn} do
      conn = get(conn, ~p"/mst_gmd")
      assert html_response(conn, 200) =~ "Listing Mst gmd"
    end
  end

  describe "new gmd" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/mst_gmd/new")
      assert html_response(conn, 200) =~ "New Gmd"
    end
  end

  describe "create gmd" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/mst_gmd", gmd: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/mst_gmd/#{id}"

      conn = get(conn, ~p"/mst_gmd/#{id}")
      assert html_response(conn, 200) =~ "Gmd #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/mst_gmd", gmd: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Gmd"
    end
  end

  describe "edit gmd" do
    setup [:create_gmd]

    test "renders form for editing chosen gmd", %{conn: conn, gmd: gmd} do
      conn = get(conn, ~p"/mst_gmd/#{gmd}/edit")
      assert html_response(conn, 200) =~ "Edit Gmd"
    end
  end

  describe "update gmd" do
    setup [:create_gmd]

    test "redirects when data is valid", %{conn: conn, gmd: gmd} do
      conn = put(conn, ~p"/mst_gmd/#{gmd}", gmd: @update_attrs)
      assert redirected_to(conn) == ~p"/mst_gmd/#{gmd}"

      conn = get(conn, ~p"/mst_gmd/#{gmd}")
      assert html_response(conn, 200) =~ "some updated gmd_code"
    end

    test "renders errors when data is invalid", %{conn: conn, gmd: gmd} do
      conn = put(conn, ~p"/mst_gmd/#{gmd}", gmd: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Gmd"
    end
  end

  describe "delete gmd" do
    setup [:create_gmd]

    test "deletes chosen gmd", %{conn: conn, gmd: gmd} do
      conn = delete(conn, ~p"/mst_gmd/#{gmd}")
      assert redirected_to(conn) == ~p"/mst_gmd"

      assert_error_sent 404, fn ->
        get(conn, ~p"/mst_gmd/#{gmd}")
      end
    end
  end

  defp create_gmd(_) do
    gmd = gmd_fixture()
    %{gmd: gmd}
  end
end
