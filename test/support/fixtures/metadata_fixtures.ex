defmodule Glamm.MetadataFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Glamm.Metadata` context.
  """

  @doc """
  Generate a vocabulary.
  """
  def vocabulary_fixture(attrs \\ %{}) do
    {:ok, vocabulary} =
      attrs
      |> Enum.into(%{
        information: "some information",
        label: "some label",
        namespace_url: "some namespace_url",
        prefix: "some prefix"
      })
      |> Glamm.Metadata.create_vocabulary()

    vocabulary
  end

  @doc """
  Generate a property.
  """
  def property_fixture(attrs \\ %{}) do
    {:ok, property} =
      attrs
      |> Enum.into(%{
        information: "some information",
        local: "some local",
        local_name: "some local_name"
      })
      |> Glamm.Metadata.create_property()

    property
  end

  @doc """
  Generate a resource_class.
  """
  def resource_class_fixture(attrs \\ %{}) do
    {:ok, resource_class} =
      attrs
      |> Enum.into(%{
        information: "some information",
        label: "some label",
        local_name: "some local_name"
      })
      |> Glamm.Metadata.create_resource_class()

    resource_class
  end
end
