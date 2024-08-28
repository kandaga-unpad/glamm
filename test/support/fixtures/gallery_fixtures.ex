defmodule Glamm.GalleryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Glamm.Gallery` context.
  """

  @doc """
  Generate a collection_type.
  """
  def collection_type_fixture(attrs \\ %{}) do
    {:ok, collection_type} =
      attrs
      |> Enum.into(%{
        collection_name: "some collection_name",
        description: "some description"
      })
      |> Glamm.Gallery.create_collection_type()

    collection_type
  end

  @doc """
  Generate a assets.
  """
  def assets_fixture(attrs \\ %{}) do
    {:ok, assets} =
      attrs
      |> Enum.into(%{
        description: "some description",
        file_name: "some file_name",
        id: "7488a646-e31f-11e4-aace-600308960662"
      })
      |> Glamm.Gallery.create_assets()

    assets
  end

  @doc """
  Generate a files.
  """
  def files_fixture(attrs \\ %{}) do
    {:ok, files} =
      attrs
      |> Enum.into(%{
        file_directory: "some file_directory",
        file_title: "some file_title",
        file_type: "some file_type",
        file_url: "some file_url",
        id: "7488a646-e31f-11e4-aace-600308960662",
        mime_type: "some mime_type"
      })
      |> Glamm.Gallery.create_files()

    files
  end
end
