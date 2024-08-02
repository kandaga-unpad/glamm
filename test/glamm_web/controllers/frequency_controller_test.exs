defmodule GlammWeb.FrequencyControllerTest do
  use GlammWeb.ConnCase

  import Glamm.Master.LookupFixtures

  @create_attrs %{time_unit: "some time_unit", frequency: "some frequency", language_prefix: "some language_prefix", time_increment: 42}
  @update_attrs %{time_unit: "some updated time_unit", frequency: "some updated frequency", language_prefix: "some updated language_prefix", time_increment: 43}
  @invalid_attrs %{time_unit: nil, frequency: nil, language_prefix: nil, time_increment: nil}

  describe "index" do
    test "lists all mst_frequency", %{conn: conn} do
      conn = get(conn, ~p"/mst_frequency")
      assert html_response(conn, 200) =~ "Listing Mst frequency"
    end
  end

  describe "new frequency" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/mst_frequency/new")
      assert html_response(conn, 200) =~ "New Frequency"
    end
  end

  describe "create frequency" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/mst_frequency", frequency: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/mst_frequency/#{id}"

      conn = get(conn, ~p"/mst_frequency/#{id}")
      assert html_response(conn, 200) =~ "Frequency #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/mst_frequency", frequency: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Frequency"
    end
  end

  describe "edit frequency" do
    setup [:create_frequency]

    test "renders form for editing chosen frequency", %{conn: conn, frequency: frequency} do
      conn = get(conn, ~p"/mst_frequency/#{frequency}/edit")
      assert html_response(conn, 200) =~ "Edit Frequency"
    end
  end

  describe "update frequency" do
    setup [:create_frequency]

    test "redirects when data is valid", %{conn: conn, frequency: frequency} do
      conn = put(conn, ~p"/mst_frequency/#{frequency}", frequency: @update_attrs)
      assert redirected_to(conn) == ~p"/mst_frequency/#{frequency}"

      conn = get(conn, ~p"/mst_frequency/#{frequency}")
      assert html_response(conn, 200) =~ "some updated time_unit"
    end

    test "renders errors when data is invalid", %{conn: conn, frequency: frequency} do
      conn = put(conn, ~p"/mst_frequency/#{frequency}", frequency: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Frequency"
    end
  end

  describe "delete frequency" do
    setup [:create_frequency]

    test "deletes chosen frequency", %{conn: conn, frequency: frequency} do
      conn = delete(conn, ~p"/mst_frequency/#{frequency}")
      assert redirected_to(conn) == ~p"/mst_frequency"

      assert_error_sent 404, fn ->
        get(conn, ~p"/mst_frequency/#{frequency}")
      end
    end
  end

  defp create_frequency(_) do
    frequency = frequency_fixture()
    %{frequency: frequency}
  end
end
