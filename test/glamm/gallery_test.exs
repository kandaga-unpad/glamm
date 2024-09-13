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

  describe "gal_requisitions" do
    alias Glamm.Gallery.Requisition

    import Glamm.GalleryFixtures

    @invalid_attrs %{owner: nil, description: nil, title: nil, identifier: nil, member_name: nil, creator: nil, year_created: nil, price_currency: nil, price: nil, information: nil, req_state: nil}

    test "list_gal_requisitions/0 returns all gal_requisitions" do
      requisition = requisition_fixture()
      assert Gallery.list_gal_requisitions() == [requisition]
    end

    test "get_requisition!/1 returns the requisition with given id" do
      requisition = requisition_fixture()
      assert Gallery.get_requisition!(requisition.id) == requisition
    end

    test "create_requisition/1 with valid data creates a requisition" do
      valid_attrs = %{owner: "some owner", description: "some description", title: "some title", identifier: "some identifier", member_name: "some member_name", creator: "some creator", year_created: 42, price_currency: "some price_currency", price: 42, information: "some information", req_state: "some req_state"}

      assert {:ok, %Requisition{} = requisition} = Gallery.create_requisition(valid_attrs)
      assert requisition.owner == "some owner"
      assert requisition.description == "some description"
      assert requisition.title == "some title"
      assert requisition.identifier == "some identifier"
      assert requisition.member_name == "some member_name"
      assert requisition.creator == "some creator"
      assert requisition.year_created == 42
      assert requisition.price_currency == "some price_currency"
      assert requisition.price == 42
      assert requisition.information == "some information"
      assert requisition.req_state == "some req_state"
    end

    test "create_requisition/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Gallery.create_requisition(@invalid_attrs)
    end

    test "update_requisition/2 with valid data updates the requisition" do
      requisition = requisition_fixture()
      update_attrs = %{owner: "some updated owner", description: "some updated description", title: "some updated title", identifier: "some updated identifier", member_name: "some updated member_name", creator: "some updated creator", year_created: 43, price_currency: "some updated price_currency", price: 43, information: "some updated information", req_state: "some updated req_state"}

      assert {:ok, %Requisition{} = requisition} = Gallery.update_requisition(requisition, update_attrs)
      assert requisition.owner == "some updated owner"
      assert requisition.description == "some updated description"
      assert requisition.title == "some updated title"
      assert requisition.identifier == "some updated identifier"
      assert requisition.member_name == "some updated member_name"
      assert requisition.creator == "some updated creator"
      assert requisition.year_created == 43
      assert requisition.price_currency == "some updated price_currency"
      assert requisition.price == 43
      assert requisition.information == "some updated information"
      assert requisition.req_state == "some updated req_state"
    end

    test "update_requisition/2 with invalid data returns error changeset" do
      requisition = requisition_fixture()
      assert {:error, %Ecto.Changeset{}} = Gallery.update_requisition(requisition, @invalid_attrs)
      assert requisition == Gallery.get_requisition!(requisition.id)
    end

    test "delete_requisition/1 deletes the requisition" do
      requisition = requisition_fixture()
      assert {:ok, %Requisition{}} = Gallery.delete_requisition(requisition)
      assert_raise Ecto.NoResultsError, fn -> Gallery.get_requisition!(requisition.id) end
    end

    test "change_requisition/1 returns a requisition changeset" do
      requisition = requisition_fixture()
      assert %Ecto.Changeset{} = Gallery.change_requisition(requisition)
    end
  end

  describe "gal_collections" do
    alias Glamm.Gallery.Collection

    import Glamm.GalleryFixtures

    @invalid_attrs %{title: nil, is_public: nil, view_scope: nil}

    test "list_gal_collections/0 returns all gal_collections" do
      collection = collection_fixture()
      assert Gallery.list_gal_collections() == [collection]
    end

    test "get_collection!/1 returns the collection with given id" do
      collection = collection_fixture()
      assert Gallery.get_collection!(collection.id) == collection
    end

    test "create_collection/1 with valid data creates a collection" do
      valid_attrs = %{title: "some title", is_public: true, view_scope: "some view_scope"}

      assert {:ok, %Collection{} = collection} = Gallery.create_collection(valid_attrs)
      assert collection.title == "some title"
      assert collection.is_public == true
      assert collection.view_scope == "some view_scope"
    end

    test "create_collection/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Gallery.create_collection(@invalid_attrs)
    end

    test "update_collection/2 with valid data updates the collection" do
      collection = collection_fixture()
      update_attrs = %{title: "some updated title", is_public: false, view_scope: "some updated view_scope"}

      assert {:ok, %Collection{} = collection} = Gallery.update_collection(collection, update_attrs)
      assert collection.title == "some updated title"
      assert collection.is_public == false
      assert collection.view_scope == "some updated view_scope"
    end

    test "update_collection/2 with invalid data returns error changeset" do
      collection = collection_fixture()
      assert {:error, %Ecto.Changeset{}} = Gallery.update_collection(collection, @invalid_attrs)
      assert collection == Gallery.get_collection!(collection.id)
    end

    test "delete_collection/1 deletes the collection" do
      collection = collection_fixture()
      assert {:ok, %Collection{}} = Gallery.delete_collection(collection)
      assert_raise Ecto.NoResultsError, fn -> Gallery.get_collection!(collection.id) end
    end

    test "change_collection/1 returns a collection changeset" do
      collection = collection_fixture()
      assert %Ecto.Changeset{} = Gallery.change_collection(collection)
    end
  end

  describe "gal_items" do
    alias Glamm.Gallery.Item

    import Glamm.GalleryFixtures

    @invalid_attrs %{item_code: nil, inventory_code: nil, order_date: nil, received_date: nil, invoice: nil, invoice_date: nil}

    test "list_gal_items/0 returns all gal_items" do
      item = item_fixture()
      assert Gallery.list_gal_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Gallery.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      valid_attrs = %{item_code: "some item_code", inventory_code: "some inventory_code", order_date: ~U[2024-09-11 04:04:00Z], received_date: ~U[2024-09-11 04:04:00Z], invoice: "some invoice", invoice_date: ~D[2024-09-11]}

      assert {:ok, %Item{} = item} = Gallery.create_item(valid_attrs)
      assert item.item_code == "some item_code"
      assert item.inventory_code == "some inventory_code"
      assert item.order_date == ~U[2024-09-11 04:04:00Z]
      assert item.received_date == ~U[2024-09-11 04:04:00Z]
      assert item.invoice == "some invoice"
      assert item.invoice_date == ~D[2024-09-11]
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Gallery.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      update_attrs = %{item_code: "some updated item_code", inventory_code: "some updated inventory_code", order_date: ~U[2024-09-12 04:04:00Z], received_date: ~U[2024-09-12 04:04:00Z], invoice: "some updated invoice", invoice_date: ~D[2024-09-12]}

      assert {:ok, %Item{} = item} = Gallery.update_item(item, update_attrs)
      assert item.item_code == "some updated item_code"
      assert item.inventory_code == "some updated inventory_code"
      assert item.order_date == ~U[2024-09-12 04:04:00Z]
      assert item.received_date == ~U[2024-09-12 04:04:00Z]
      assert item.invoice == "some updated invoice"
      assert item.invoice_date == ~D[2024-09-12]
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Gallery.update_item(item, @invalid_attrs)
      assert item == Gallery.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Gallery.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Gallery.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Gallery.change_item(item)
    end
  end

  describe "gal_item_value" do
    alias Glamm.Gallery.ItemValue

    import Glamm.GalleryFixtures

    @invalid_attrs %{type: nil, value: nil, url: nil, lang: nil, scope_view: nil}

    test "list_gal_item_value/0 returns all gal_item_value" do
      item_value = item_value_fixture()
      assert Gallery.list_gal_item_value() == [item_value]
    end

    test "get_item_value!/1 returns the item_value with given id" do
      item_value = item_value_fixture()
      assert Gallery.get_item_value!(item_value.id) == item_value
    end

    test "create_item_value/1 with valid data creates a item_value" do
      valid_attrs = %{type: "some type", value: "some value", url: "some url", lang: "some lang", scope_view: "some scope_view"}

      assert {:ok, %ItemValue{} = item_value} = Gallery.create_item_value(valid_attrs)
      assert item_value.type == "some type"
      assert item_value.value == "some value"
      assert item_value.url == "some url"
      assert item_value.lang == "some lang"
      assert item_value.scope_view == "some scope_view"
    end

    test "create_item_value/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Gallery.create_item_value(@invalid_attrs)
    end

    test "update_item_value/2 with valid data updates the item_value" do
      item_value = item_value_fixture()
      update_attrs = %{type: "some updated type", value: "some updated value", url: "some updated url", lang: "some updated lang", scope_view: "some updated scope_view"}

      assert {:ok, %ItemValue{} = item_value} = Gallery.update_item_value(item_value, update_attrs)
      assert item_value.type == "some updated type"
      assert item_value.value == "some updated value"
      assert item_value.url == "some updated url"
      assert item_value.lang == "some updated lang"
      assert item_value.scope_view == "some updated scope_view"
    end

    test "update_item_value/2 with invalid data returns error changeset" do
      item_value = item_value_fixture()
      assert {:error, %Ecto.Changeset{}} = Gallery.update_item_value(item_value, @invalid_attrs)
      assert item_value == Gallery.get_item_value!(item_value.id)
    end

    test "delete_item_value/1 deletes the item_value" do
      item_value = item_value_fixture()
      assert {:ok, %ItemValue{}} = Gallery.delete_item_value(item_value)
      assert_raise Ecto.NoResultsError, fn -> Gallery.get_item_value!(item_value.id) end
    end

    test "change_item_value/1 returns a item_value changeset" do
      item_value = item_value_fixture()
      assert %Ecto.Changeset{} = Gallery.change_item_value(item_value)
    end
  end
end
