defmodule Glamm.GalleryTest do
  use Glamm.DataCase

  alias Glamm.Gallery

  describe "gal_collection_type" do
    alias Glamm.Gallery.CollectionType

    import Glamm.GalleryFixtures

    @invalid_attrs %{description: nil, collection_name: nil}

    test "list_gal_collection_type/0 returns all gal_collection_type" do
      collection_type = collection_type_fixture()
      assert Gallery.list_gal_collection_type() == [collection_type]
    end

    test "get_collection_type!/1 returns the collection_type with given id" do
      collection_type = collection_type_fixture()
      assert Gallery.get_collection_type!(collection_type.id) == collection_type
    end

    test "create_collection_type/1 with valid data creates a collection_type" do
      valid_attrs = %{description: "some description", collection_name: "some collection_name"}

      assert {:ok, %CollectionType{} = collection_type} = Gallery.create_collection_type(valid_attrs)
      assert collection_type.description == "some description"
      assert collection_type.collection_name == "some collection_name"
    end

    test "create_collection_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Gallery.create_collection_type(@invalid_attrs)
    end

    test "update_collection_type/2 with valid data updates the collection_type" do
      collection_type = collection_type_fixture()
      update_attrs = %{description: "some updated description", collection_name: "some updated collection_name"}

      assert {:ok, %CollectionType{} = collection_type} = Gallery.update_collection_type(collection_type, update_attrs)
      assert collection_type.description == "some updated description"
      assert collection_type.collection_name == "some updated collection_name"
    end

    test "update_collection_type/2 with invalid data returns error changeset" do
      collection_type = collection_type_fixture()
      assert {:error, %Ecto.Changeset{}} = Gallery.update_collection_type(collection_type, @invalid_attrs)
      assert collection_type == Gallery.get_collection_type!(collection_type.id)
    end

    test "delete_collection_type/1 deletes the collection_type" do
      collection_type = collection_type_fixture()
      assert {:ok, %CollectionType{}} = Gallery.delete_collection_type(collection_type)
      assert_raise Ecto.NoResultsError, fn -> Gallery.get_collection_type!(collection_type.id) end
    end

    test "change_collection_type/1 returns a collection_type changeset" do
      collection_type = collection_type_fixture()
      assert %Ecto.Changeset{} = Gallery.change_collection_type(collection_type)
    end
  end

  describe "gal_assets" do
    alias Glamm.Gallery.Assets

    import Glamm.GalleryFixtures

    @invalid_attrs %{id: nil, description: nil, file_name: nil}

    test "list_gal_assets/0 returns all gal_assets" do
      assets = assets_fixture()
      assert Gallery.list_gal_assets() == [assets]
    end

    test "get_assets!/1 returns the assets with given id" do
      assets = assets_fixture()
      assert Gallery.get_assets!(assets.id) == assets
    end

    test "create_assets/1 with valid data creates a assets" do
      valid_attrs = %{id: "7488a646-e31f-11e4-aace-600308960662", description: "some description", file_name: "some file_name"}

      assert {:ok, %Assets{} = assets} = Gallery.create_assets(valid_attrs)
      assert assets.id == "7488a646-e31f-11e4-aace-600308960662"
      assert assets.description == "some description"
      assert assets.file_name == "some file_name"
    end

    test "create_assets/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Gallery.create_assets(@invalid_attrs)
    end

    test "update_assets/2 with valid data updates the assets" do
      assets = assets_fixture()
      update_attrs = %{id: "7488a646-e31f-11e4-aace-600308960668", description: "some updated description", file_name: "some updated file_name"}

      assert {:ok, %Assets{} = assets} = Gallery.update_assets(assets, update_attrs)
      assert assets.id == "7488a646-e31f-11e4-aace-600308960668"
      assert assets.description == "some updated description"
      assert assets.file_name == "some updated file_name"
    end

    test "update_assets/2 with invalid data returns error changeset" do
      assets = assets_fixture()
      assert {:error, %Ecto.Changeset{}} = Gallery.update_assets(assets, @invalid_attrs)
      assert assets == Gallery.get_assets!(assets.id)
    end

    test "delete_assets/1 deletes the assets" do
      assets = assets_fixture()
      assert {:ok, %Assets{}} = Gallery.delete_assets(assets)
      assert_raise Ecto.NoResultsError, fn -> Gallery.get_assets!(assets.id) end
    end

    test "change_assets/1 returns a assets changeset" do
      assets = assets_fixture()
      assert %Ecto.Changeset{} = Gallery.change_assets(assets)
    end
  end

  describe "gal_files" do
    alias Glamm.Gallery.Files

    import Glamm.GalleryFixtures

    @invalid_attrs %{id: nil, file_title: nil, file_type: nil, file_url: nil, file_directory: nil, mime_type: nil}

    test "list_gal_files/0 returns all gal_files" do
      files = files_fixture()
      assert Gallery.list_gal_files() == [files]
    end

    test "get_files!/1 returns the files with given id" do
      files = files_fixture()
      assert Gallery.get_files!(files.id) == files
    end

    test "create_files/1 with valid data creates a files" do
      valid_attrs = %{id: "7488a646-e31f-11e4-aace-600308960662", file_title: "some file_title", file_type: "some file_type", file_url: "some file_url", file_directory: "some file_directory", mime_type: "some mime_type"}

      assert {:ok, %Files{} = files} = Gallery.create_files(valid_attrs)
      assert files.id == "7488a646-e31f-11e4-aace-600308960662"
      assert files.file_title == "some file_title"
      assert files.file_type == "some file_type"
      assert files.file_url == "some file_url"
      assert files.file_directory == "some file_directory"
      assert files.mime_type == "some mime_type"
    end

    test "create_files/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Gallery.create_files(@invalid_attrs)
    end

    test "update_files/2 with valid data updates the files" do
      files = files_fixture()
      update_attrs = %{id: "7488a646-e31f-11e4-aace-600308960668", file_title: "some updated file_title", file_type: "some updated file_type", file_url: "some updated file_url", file_directory: "some updated file_directory", mime_type: "some updated mime_type"}

      assert {:ok, %Files{} = files} = Gallery.update_files(files, update_attrs)
      assert files.id == "7488a646-e31f-11e4-aace-600308960668"
      assert files.file_title == "some updated file_title"
      assert files.file_type == "some updated file_type"
      assert files.file_url == "some updated file_url"
      assert files.file_directory == "some updated file_directory"
      assert files.mime_type == "some updated mime_type"
    end

    test "update_files/2 with invalid data returns error changeset" do
      files = files_fixture()
      assert {:error, %Ecto.Changeset{}} = Gallery.update_files(files, @invalid_attrs)
      assert files == Gallery.get_files!(files.id)
    end

    test "delete_files/1 deletes the files" do
      files = files_fixture()
      assert {:ok, %Files{}} = Gallery.delete_files(files)
      assert_raise Ecto.NoResultsError, fn -> Gallery.get_files!(files.id) end
    end

    test "change_files/1 returns a files changeset" do
      files = files_fixture()
      assert %Ecto.Changeset{} = Gallery.change_files(files)
    end
  end
end
