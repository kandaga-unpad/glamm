defmodule Glamm.MetadataTest do
  use Glamm.DataCase

  alias Glamm.Metadata

  describe "metadata_vocabularies" do
    alias Glamm.Metadata.Vocabulary

    import Glamm.MetadataFixtures

    @invalid_attrs %{label: nil, prefix: nil, namespace_url: nil, information: nil}

    test "list_metadata_vocabularies/0 returns all metadata_vocabularies" do
      vocabulary = vocabulary_fixture()
      assert Metadata.list_metadata_vocabularies() == [vocabulary]
    end

    test "get_vocabulary!/1 returns the vocabulary with given id" do
      vocabulary = vocabulary_fixture()
      assert Metadata.get_vocabulary!(vocabulary.id) == vocabulary
    end

    test "create_vocabulary/1 with valid data creates a vocabulary" do
      valid_attrs = %{label: "some label", prefix: "some prefix", namespace_url: "some namespace_url", information: "some information"}

      assert {:ok, %Vocabulary{} = vocabulary} = Metadata.create_vocabulary(valid_attrs)
      assert vocabulary.label == "some label"
      assert vocabulary.prefix == "some prefix"
      assert vocabulary.namespace_url == "some namespace_url"
      assert vocabulary.information == "some information"
    end

    test "create_vocabulary/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Metadata.create_vocabulary(@invalid_attrs)
    end

    test "update_vocabulary/2 with valid data updates the vocabulary" do
      vocabulary = vocabulary_fixture()
      update_attrs = %{label: "some updated label", prefix: "some updated prefix", namespace_url: "some updated namespace_url", information: "some updated information"}

      assert {:ok, %Vocabulary{} = vocabulary} = Metadata.update_vocabulary(vocabulary, update_attrs)
      assert vocabulary.label == "some updated label"
      assert vocabulary.prefix == "some updated prefix"
      assert vocabulary.namespace_url == "some updated namespace_url"
      assert vocabulary.information == "some updated information"
    end

    test "update_vocabulary/2 with invalid data returns error changeset" do
      vocabulary = vocabulary_fixture()
      assert {:error, %Ecto.Changeset{}} = Metadata.update_vocabulary(vocabulary, @invalid_attrs)
      assert vocabulary == Metadata.get_vocabulary!(vocabulary.id)
    end

    test "delete_vocabulary/1 deletes the vocabulary" do
      vocabulary = vocabulary_fixture()
      assert {:ok, %Vocabulary{}} = Metadata.delete_vocabulary(vocabulary)
      assert_raise Ecto.NoResultsError, fn -> Metadata.get_vocabulary!(vocabulary.id) end
    end

    test "change_vocabulary/1 returns a vocabulary changeset" do
      vocabulary = vocabulary_fixture()
      assert %Ecto.Changeset{} = Metadata.change_vocabulary(vocabulary)
    end
  end

  describe "metadata_properties" do
    alias Glamm.Metadata.Property

    import Glamm.MetadataFixtures

    @invalid_attrs %{local: nil, local_name: nil, information: nil}

    test "list_metadata_properties/0 returns all metadata_properties" do
      property = property_fixture()
      assert Metadata.list_metadata_properties() == [property]
    end

    test "get_property!/1 returns the property with given id" do
      property = property_fixture()
      assert Metadata.get_property!(property.id) == property
    end

    test "create_property/1 with valid data creates a property" do
      valid_attrs = %{local: "some local", local_name: "some local_name", information: "some information"}

      assert {:ok, %Property{} = property} = Metadata.create_property(valid_attrs)
      assert property.local == "some local"
      assert property.local_name == "some local_name"
      assert property.information == "some information"
    end

    test "create_property/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Metadata.create_property(@invalid_attrs)
    end

    test "update_property/2 with valid data updates the property" do
      property = property_fixture()
      update_attrs = %{local: "some updated local", local_name: "some updated local_name", information: "some updated information"}

      assert {:ok, %Property{} = property} = Metadata.update_property(property, update_attrs)
      assert property.local == "some updated local"
      assert property.local_name == "some updated local_name"
      assert property.information == "some updated information"
    end

    test "update_property/2 with invalid data returns error changeset" do
      property = property_fixture()
      assert {:error, %Ecto.Changeset{}} = Metadata.update_property(property, @invalid_attrs)
      assert property == Metadata.get_property!(property.id)
    end

    test "delete_property/1 deletes the property" do
      property = property_fixture()
      assert {:ok, %Property{}} = Metadata.delete_property(property)
      assert_raise Ecto.NoResultsError, fn -> Metadata.get_property!(property.id) end
    end

    test "change_property/1 returns a property changeset" do
      property = property_fixture()
      assert %Ecto.Changeset{} = Metadata.change_property(property)
    end
  end

  describe "resource_class" do
    alias Glamm.Metadata.ResourceClass

    import Glamm.MetadataFixtures

    @invalid_attrs %{label: nil, local_name: nil, information: nil}

    test "list_resource_class/0 returns all resource_class" do
      resource_class = resource_class_fixture()
      assert Metadata.list_resource_class() == [resource_class]
    end

    test "get_resource_class!/1 returns the resource_class with given id" do
      resource_class = resource_class_fixture()
      assert Metadata.get_resource_class!(resource_class.id) == resource_class
    end

    test "create_resource_class/1 with valid data creates a resource_class" do
      valid_attrs = %{label: "some label", local_name: "some local_name", information: "some information"}

      assert {:ok, %ResourceClass{} = resource_class} = Metadata.create_resource_class(valid_attrs)
      assert resource_class.label == "some label"
      assert resource_class.local_name == "some local_name"
      assert resource_class.information == "some information"
    end

    test "create_resource_class/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Metadata.create_resource_class(@invalid_attrs)
    end

    test "update_resource_class/2 with valid data updates the resource_class" do
      resource_class = resource_class_fixture()
      update_attrs = %{label: "some updated label", local_name: "some updated local_name", information: "some updated information"}

      assert {:ok, %ResourceClass{} = resource_class} = Metadata.update_resource_class(resource_class, update_attrs)
      assert resource_class.label == "some updated label"
      assert resource_class.local_name == "some updated local_name"
      assert resource_class.information == "some updated information"
    end

    test "update_resource_class/2 with invalid data returns error changeset" do
      resource_class = resource_class_fixture()
      assert {:error, %Ecto.Changeset{}} = Metadata.update_resource_class(resource_class, @invalid_attrs)
      assert resource_class == Metadata.get_resource_class!(resource_class.id)
    end

    test "delete_resource_class/1 deletes the resource_class" do
      resource_class = resource_class_fixture()
      assert {:ok, %ResourceClass{}} = Metadata.delete_resource_class(resource_class)
      assert_raise Ecto.NoResultsError, fn -> Metadata.get_resource_class!(resource_class.id) end
    end

    test "change_resource_class/1 returns a resource_class changeset" do
      resource_class = resource_class_fixture()
      assert %Ecto.Changeset{} = Metadata.change_resource_class(resource_class)
    end
  end
end
