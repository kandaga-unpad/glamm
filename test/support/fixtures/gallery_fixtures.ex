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

  @doc """
  Generate a requisition.
  """
  def requisition_fixture(attrs \\ %{}) do
    {:ok, requisition} =
      attrs
      |> Enum.into(%{
        creator: "some creator",
        description: "some description",
        identifier: "some identifier",
        information: "some information",
        member_name: "some member_name",
        owner: "some owner",
        price: 42,
        price_currency: "some price_currency",
        req_state: "some req_state",
        title: "some title",
        year_created: 42
      })
      |> Glamm.Gallery.create_requisition()

    requisition
  end

  @doc """
  Generate a collection.
  """
  def collection_fixture(attrs \\ %{}) do
    {:ok, collection} =
      attrs
      |> Enum.into(%{
        is_public: true,
        title: "some title",
        view_scope: "some view_scope"
      })
      |> Glamm.Gallery.create_collection()

    collection
  end

  @doc """
  Generate a item.
  """
  def item_fixture(attrs \\ %{}) do
    {:ok, item} =
      attrs
      |> Enum.into(%{
        inventory_code: "some inventory_code",
        invoice: "some invoice",
        invoice_date: ~D[2024-09-11],
        item_code: "some item_code",
        order_date: ~U[2024-09-11 04:04:00Z],
        received_date: ~U[2024-09-11 04:04:00Z]
      })
      |> Glamm.Gallery.create_item()

    item
  end

  @doc """
  Generate a item_value.
  """
  def item_value_fixture(attrs \\ %{}) do
    {:ok, item_value} =
      attrs
      |> Enum.into(%{
        lang: "some lang",
        scope_view: "some scope_view",
        type: "some type",
        url: "some url",
        value: "some value"
      })
      |> Glamm.Gallery.create_item_value()

    item_value
  end
end
