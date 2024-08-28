defmodule Glamm.SystemTest do
  use Glamm.DataCase

  alias Glamm.System

  describe "nodes" do
    alias Glamm.System.Node

    import Glamm.SystemFixtures

    @invalid_attrs %{name: nil, image: nil, abbr: nil, groups: nil}

    test "list_nodes/0 returns all nodes" do
      node = node_fixture()
      assert System.list_nodes() == [node]
    end

    test "get_node!/1 returns the node with given id" do
      node = node_fixture()
      assert System.get_node!(node.id) == node
    end

    test "create_node/1 with valid data creates a node" do
      valid_attrs = %{name: "some name", image: "some image", abbr: "some abbr", groups: "some groups"}

      assert {:ok, %Node{} = node} = System.create_node(valid_attrs)
      assert node.name == "some name"
      assert node.image == "some image"
      assert node.abbr == "some abbr"
      assert node.groups == "some groups"
    end

    test "create_node/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = System.create_node(@invalid_attrs)
    end

    test "update_node/2 with valid data updates the node" do
      node = node_fixture()
      update_attrs = %{name: "some updated name", image: "some updated image", abbr: "some updated abbr", groups: "some updated groups"}

      assert {:ok, %Node{} = node} = System.update_node(node, update_attrs)
      assert node.name == "some updated name"
      assert node.image == "some updated image"
      assert node.abbr == "some updated abbr"
      assert node.groups == "some updated groups"
    end

    test "update_node/2 with invalid data returns error changeset" do
      node = node_fixture()
      assert {:error, %Ecto.Changeset{}} = System.update_node(node, @invalid_attrs)
      assert node == System.get_node!(node.id)
    end

    test "delete_node/1 deletes the node" do
      node = node_fixture()
      assert {:ok, %Node{}} = System.delete_node(node)
      assert_raise Ecto.NoResultsError, fn -> System.get_node!(node.id) end
    end

    test "change_node/1 returns a node changeset" do
      node = node_fixture()
      assert %Ecto.Changeset{} = System.change_node(node)
    end
  end
end
