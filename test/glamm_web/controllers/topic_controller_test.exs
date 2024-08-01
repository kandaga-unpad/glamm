defmodule GlammWeb.TopicControllerTest do
  use GlammWeb.ConnCase

  import Glamm.MasterFixtures

  @create_attrs %{topic: "some topic", topic_type: :topic, auth_list: "some auth_list", classification: "some classification"}
  @update_attrs %{topic: "some updated topic", topic_type: :geographic, auth_list: "some updated auth_list", classification: "some updated classification"}
  @invalid_attrs %{topic: nil, topic_type: nil, auth_list: nil, classification: nil}

  describe "index" do
    test "lists all mst_topics", %{conn: conn} do
      conn = get(conn, ~p"/mst_topics")
      assert html_response(conn, 200) =~ "Listing Mst topics"
    end
  end

  describe "new topic" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/mst_topics/new")
      assert html_response(conn, 200) =~ "New Topic"
    end
  end

  describe "create topic" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/mst_topics", topic: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/mst_topics/#{id}"

      conn = get(conn, ~p"/mst_topics/#{id}")
      assert html_response(conn, 200) =~ "Topic #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/mst_topics", topic: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Topic"
    end
  end

  describe "edit topic" do
    setup [:create_topic]

    test "renders form for editing chosen topic", %{conn: conn, topic: topic} do
      conn = get(conn, ~p"/mst_topics/#{topic}/edit")
      assert html_response(conn, 200) =~ "Edit Topic"
    end
  end

  describe "update topic" do
    setup [:create_topic]

    test "redirects when data is valid", %{conn: conn, topic: topic} do
      conn = put(conn, ~p"/mst_topics/#{topic}", topic: @update_attrs)
      assert redirected_to(conn) == ~p"/mst_topics/#{topic}"

      conn = get(conn, ~p"/mst_topics/#{topic}")
      assert html_response(conn, 200) =~ "some updated topic"
    end

    test "renders errors when data is invalid", %{conn: conn, topic: topic} do
      conn = put(conn, ~p"/mst_topics/#{topic}", topic: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Topic"
    end
  end

  describe "delete topic" do
    setup [:create_topic]

    test "deletes chosen topic", %{conn: conn, topic: topic} do
      conn = delete(conn, ~p"/mst_topics/#{topic}")
      assert redirected_to(conn) == ~p"/mst_topics"

      assert_error_sent 404, fn ->
        get(conn, ~p"/mst_topics/#{topic}")
      end
    end
  end

  defp create_topic(_) do
    topic = topic_fixture()
    %{topic: topic}
  end
end
