defmodule Glamm.SystemFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Glamm.System` context.
  """

  @doc """
  Generate a node.
  """
  def node_fixture(attrs \\ %{}) do
    {:ok, node} =
      attrs
      |> Enum.into(%{
        abbr: "some abbr",
        groups: "some groups",
        image: "some image",
        name: "some name"
      })
      |> Glamm.System.create_node()

    node
  end
end
