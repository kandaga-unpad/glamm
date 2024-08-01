defmodule Glamm.MasterTest do
  use Glamm.DataCase

  alias Glamm.Master

  describe "mst_creator" do
    alias Glamm.Master.Creator

    import Glamm.MasterFixtures

    @invalid_attrs %{creator_name: nil, creator_contact: nil, affiliation: nil, creator_type: nil}

    test "list_mst_creator/0 returns all mst_creator" do
      creator = creator_fixture()
      assert Master.list_mst_creator() == [creator]
    end

    test "get_creator!/1 returns the creator with given id" do
      creator = creator_fixture()
      assert Master.get_creator!(creator.id) == creator
    end

    test "create_creator/1 with valid data creates a creator" do
      valid_attrs = %{creator_name: "some creator_name", creator_contact: "some creator_contact", affiliation: "some affiliation", creator_type: :people}

      assert {:ok, %Creator{} = creator} = Master.create_creator(valid_attrs)
      assert creator.creator_name == "some creator_name"
      assert creator.creator_contact == "some creator_contact"
      assert creator.affiliation == "some affiliation"
      assert creator.creator_type == :people
    end

    test "create_creator/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Master.create_creator(@invalid_attrs)
    end

    test "update_creator/2 with valid data updates the creator" do
      creator = creator_fixture()
      update_attrs = %{creator_name: "some updated creator_name", creator_contact: "some updated creator_contact", affiliation: "some updated affiliation", creator_type: :organization}

      assert {:ok, %Creator{} = creator} = Master.update_creator(creator, update_attrs)
      assert creator.creator_name == "some updated creator_name"
      assert creator.creator_contact == "some updated creator_contact"
      assert creator.affiliation == "some updated affiliation"
      assert creator.creator_type == :organization
    end

    test "update_creator/2 with invalid data returns error changeset" do
      creator = creator_fixture()
      assert {:error, %Ecto.Changeset{}} = Master.update_creator(creator, @invalid_attrs)
      assert creator == Master.get_creator!(creator.id)
    end

    test "delete_creator/1 deletes the creator" do
      creator = creator_fixture()
      assert {:ok, %Creator{}} = Master.delete_creator(creator)
      assert_raise Ecto.NoResultsError, fn -> Master.get_creator!(creator.id) end
    end

    test "change_creator/1 returns a creator changeset" do
      creator = creator_fixture()
      assert %Ecto.Changeset{} = Master.change_creator(creator)
    end
  end

  describe "mst_gmd" do
    alias Glamm.Master.GMD

    import Glamm.MasterFixtures

    @invalid_attrs %{gmd_code: nil, gmd_name: nil, icon_image: nil}

    test "list_mst_gmd/0 returns all mst_gmd" do
      gmd = gmd_fixture()
      assert Master.list_mst_gmd() == [gmd]
    end

    test "get_gmd!/1 returns the gmd with given id" do
      gmd = gmd_fixture()
      assert Master.get_gmd!(gmd.id) == gmd
    end

    test "create_gmd/1 with valid data creates a gmd" do
      valid_attrs = %{gmd_code: "some gmd_code", gmd_name: "some gmd_name", icon_image: "some icon_image"}

      assert {:ok, %GMD{} = gmd} = Master.create_gmd(valid_attrs)
      assert gmd.gmd_code == "some gmd_code"
      assert gmd.gmd_name == "some gmd_name"
      assert gmd.icon_image == "some icon_image"
    end

    test "create_gmd/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Master.create_gmd(@invalid_attrs)
    end

    test "update_gmd/2 with valid data updates the gmd" do
      gmd = gmd_fixture()
      update_attrs = %{gmd_code: "some updated gmd_code", gmd_name: "some updated gmd_name", icon_image: "some updated icon_image"}

      assert {:ok, %GMD{} = gmd} = Master.update_gmd(gmd, update_attrs)
      assert gmd.gmd_code == "some updated gmd_code"
      assert gmd.gmd_name == "some updated gmd_name"
      assert gmd.icon_image == "some updated icon_image"
    end

    test "update_gmd/2 with invalid data returns error changeset" do
      gmd = gmd_fixture()
      assert {:error, %Ecto.Changeset{}} = Master.update_gmd(gmd, @invalid_attrs)
      assert gmd == Master.get_gmd!(gmd.id)
    end

    test "delete_gmd/1 deletes the gmd" do
      gmd = gmd_fixture()
      assert {:ok, %GMD{}} = Master.delete_gmd(gmd)
      assert_raise Ecto.NoResultsError, fn -> Master.get_gmd!(gmd.id) end
    end

    test "change_gmd/1 returns a gmd changeset" do
      gmd = gmd_fixture()
      assert %Ecto.Changeset{} = Master.change_gmd(gmd)
    end
  end

  describe "mst_publishers" do
    alias Glamm.Master.Publisher

    import Glamm.MasterFixtures

    @invalid_attrs %{place_name: nil}

    test "list_mst_publishers/0 returns all mst_publishers" do
      publisher = publisher_fixture()
      assert Master.list_mst_publishers() == [publisher]
    end

    test "get_publisher!/1 returns the publisher with given id" do
      publisher = publisher_fixture()
      assert Master.get_publisher!(publisher.id) == publisher
    end

    test "create_publisher/1 with valid data creates a publisher" do
      valid_attrs = %{place_name: "some place_name"}

      assert {:ok, %Publisher{} = publisher} = Master.create_publisher(valid_attrs)
      assert publisher.place_name == "some place_name"
    end

    test "create_publisher/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Master.create_publisher(@invalid_attrs)
    end

    test "update_publisher/2 with valid data updates the publisher" do
      publisher = publisher_fixture()
      update_attrs = %{place_name: "some updated place_name"}

      assert {:ok, %Publisher{} = publisher} = Master.update_publisher(publisher, update_attrs)
      assert publisher.place_name == "some updated place_name"
    end

    test "update_publisher/2 with invalid data returns error changeset" do
      publisher = publisher_fixture()
      assert {:error, %Ecto.Changeset{}} = Master.update_publisher(publisher, @invalid_attrs)
      assert publisher == Master.get_publisher!(publisher.id)
    end

    test "delete_publisher/1 deletes the publisher" do
      publisher = publisher_fixture()
      assert {:ok, %Publisher{}} = Master.delete_publisher(publisher)
      assert_raise Ecto.NoResultsError, fn -> Master.get_publisher!(publisher.id) end
    end

    test "change_publisher/1 returns a publisher changeset" do
      publisher = publisher_fixture()
      assert %Ecto.Changeset{} = Master.change_publisher(publisher)
    end
  end

  describe "mst_content_types" do
    alias Glamm.Master.ContentTypes

    import Glamm.MasterFixtures

    @invalid_attrs %{code: nil, content_type: nil, mar_code: nil}

    test "list_mst_content_types/0 returns all mst_content_types" do
      content_types = content_types_fixture()
      assert Master.list_mst_content_types() == [content_types]
    end

    test "get_content_types!/1 returns the content_types with given id" do
      content_types = content_types_fixture()
      assert Master.get_content_types!(content_types.id) == content_types
    end

    test "create_content_types/1 with valid data creates a content_types" do
      valid_attrs = %{code: "some code", content_type: "some content_type", mar_code: "some mar_code"}

      assert {:ok, %ContentTypes{} = content_types} = Master.create_content_types(valid_attrs)
      assert content_types.code == "some code"
      assert content_types.content_type == "some content_type"
      assert content_types.mar_code == "some mar_code"
    end

    test "create_content_types/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Master.create_content_types(@invalid_attrs)
    end

    test "update_content_types/2 with valid data updates the content_types" do
      content_types = content_types_fixture()
      update_attrs = %{code: "some updated code", content_type: "some updated content_type", mar_code: "some updated mar_code"}

      assert {:ok, %ContentTypes{} = content_types} = Master.update_content_types(content_types, update_attrs)
      assert content_types.code == "some updated code"
      assert content_types.content_type == "some updated content_type"
      assert content_types.mar_code == "some updated mar_code"
    end

    test "update_content_types/2 with invalid data returns error changeset" do
      content_types = content_types_fixture()
      assert {:error, %Ecto.Changeset{}} = Master.update_content_types(content_types, @invalid_attrs)
      assert content_types == Master.get_content_types!(content_types.id)
    end

    test "delete_content_types/1 deletes the content_types" do
      content_types = content_types_fixture()
      assert {:ok, %ContentTypes{}} = Master.delete_content_types(content_types)
      assert_raise Ecto.NoResultsError, fn -> Master.get_content_types!(content_types.id) end
    end

    test "change_content_types/1 returns a content_types changeset" do
      content_types = content_types_fixture()
      assert %Ecto.Changeset{} = Master.change_content_types(content_types)
    end
  end

  describe "mst_carrier_types" do
    alias Glamm.Master.CarrierTypes

    import Glamm.MasterFixtures

    @invalid_attrs %{code: nil, carrier_type: nil, marc_code: nil}

    test "list_mst_carrier_types/0 returns all mst_carrier_types" do
      carrier_types = carrier_types_fixture()
      assert Master.list_mst_carrier_types() == [carrier_types]
    end

    test "get_carrier_types!/1 returns the carrier_types with given id" do
      carrier_types = carrier_types_fixture()
      assert Master.get_carrier_types!(carrier_types.id) == carrier_types
    end

    test "create_carrier_types/1 with valid data creates a carrier_types" do
      valid_attrs = %{code: "some code", carrier_type: "some carrier_type", marc_code: "some marc_code"}

      assert {:ok, %CarrierTypes{} = carrier_types} = Master.create_carrier_types(valid_attrs)
      assert carrier_types.code == "some code"
      assert carrier_types.carrier_type == "some carrier_type"
      assert carrier_types.marc_code == "some marc_code"
    end

    test "create_carrier_types/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Master.create_carrier_types(@invalid_attrs)
    end

    test "update_carrier_types/2 with valid data updates the carrier_types" do
      carrier_types = carrier_types_fixture()
      update_attrs = %{code: "some updated code", carrier_type: "some updated carrier_type", marc_code: "some updated marc_code"}

      assert {:ok, %CarrierTypes{} = carrier_types} = Master.update_carrier_types(carrier_types, update_attrs)
      assert carrier_types.code == "some updated code"
      assert carrier_types.carrier_type == "some updated carrier_type"
      assert carrier_types.marc_code == "some updated marc_code"
    end

    test "update_carrier_types/2 with invalid data returns error changeset" do
      carrier_types = carrier_types_fixture()
      assert {:error, %Ecto.Changeset{}} = Master.update_carrier_types(carrier_types, @invalid_attrs)
      assert carrier_types == Master.get_carrier_types!(carrier_types.id)
    end

    test "delete_carrier_types/1 deletes the carrier_types" do
      carrier_types = carrier_types_fixture()
      assert {:ok, %CarrierTypes{}} = Master.delete_carrier_types(carrier_types)
      assert_raise Ecto.NoResultsError, fn -> Master.get_carrier_types!(carrier_types.id) end
    end

    test "change_carrier_types/1 returns a carrier_types changeset" do
      carrier_types = carrier_types_fixture()
      assert %Ecto.Changeset{} = Master.change_carrier_types(carrier_types)
    end
  end

  describe "mst_media_types" do
    alias Glamm.Master.MediaTypes

    import Glamm.MasterFixtures

    @invalid_attrs %{code: nil, media_type: nil, marc_code: nil}

    test "list_mst_media_types/0 returns all mst_media_types" do
      media_types = media_types_fixture()
      assert Master.list_mst_media_types() == [media_types]
    end

    test "get_media_types!/1 returns the media_types with given id" do
      media_types = media_types_fixture()
      assert Master.get_media_types!(media_types.id) == media_types
    end

    test "create_media_types/1 with valid data creates a media_types" do
      valid_attrs = %{code: "some code", media_type: "some media_type", marc_code: "some marc_code"}

      assert {:ok, %MediaTypes{} = media_types} = Master.create_media_types(valid_attrs)
      assert media_types.code == "some code"
      assert media_types.media_type == "some media_type"
      assert media_types.marc_code == "some marc_code"
    end

    test "create_media_types/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Master.create_media_types(@invalid_attrs)
    end

    test "update_media_types/2 with valid data updates the media_types" do
      media_types = media_types_fixture()
      update_attrs = %{code: "some updated code", media_type: "some updated media_type", marc_code: "some updated marc_code"}

      assert {:ok, %MediaTypes{} = media_types} = Master.update_media_types(media_types, update_attrs)
      assert media_types.code == "some updated code"
      assert media_types.media_type == "some updated media_type"
      assert media_types.marc_code == "some updated marc_code"
    end

    test "update_media_types/2 with invalid data returns error changeset" do
      media_types = media_types_fixture()
      assert {:error, %Ecto.Changeset{}} = Master.update_media_types(media_types, @invalid_attrs)
      assert media_types == Master.get_media_types!(media_types.id)
    end

    test "delete_media_types/1 deletes the media_types" do
      media_types = media_types_fixture()
      assert {:ok, %MediaTypes{}} = Master.delete_media_types(media_types)
      assert_raise Ecto.NoResultsError, fn -> Master.get_media_types!(media_types.id) end
    end

    test "change_media_types/1 returns a media_types changeset" do
      media_types = media_types_fixture()
      assert %Ecto.Changeset{} = Master.change_media_types(media_types)
    end
  end

  describe "mst_suppliers" do
    alias Glamm.Master.Supplier

    import Glamm.MasterFixtures

    @invalid_attrs %{address: nil, supplier_name: nil, postal_code: nil, phone: nil, contact: nil, fax: nil, account: nil, email: nil}

    test "list_mst_suppliers/0 returns all mst_suppliers" do
      supplier = supplier_fixture()
      assert Master.list_mst_suppliers() == [supplier]
    end

    test "get_supplier!/1 returns the supplier with given id" do
      supplier = supplier_fixture()
      assert Master.get_supplier!(supplier.id) == supplier
    end

    test "create_supplier/1 with valid data creates a supplier" do
      valid_attrs = %{address: "some address", supplier_name: "some supplier_name", postal_code: 42, phone: "some phone", contact: "some contact", fax: "some fax", account: "some account", email: "some email"}

      assert {:ok, %Supplier{} = supplier} = Master.create_supplier(valid_attrs)
      assert supplier.address == "some address"
      assert supplier.supplier_name == "some supplier_name"
      assert supplier.postal_code == 42
      assert supplier.phone == "some phone"
      assert supplier.contact == "some contact"
      assert supplier.fax == "some fax"
      assert supplier.account == "some account"
      assert supplier.email == "some email"
    end

    test "create_supplier/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Master.create_supplier(@invalid_attrs)
    end

    test "update_supplier/2 with valid data updates the supplier" do
      supplier = supplier_fixture()
      update_attrs = %{address: "some updated address", supplier_name: "some updated supplier_name", postal_code: 43, phone: "some updated phone", contact: "some updated contact", fax: "some updated fax", account: "some updated account", email: "some updated email"}

      assert {:ok, %Supplier{} = supplier} = Master.update_supplier(supplier, update_attrs)
      assert supplier.address == "some updated address"
      assert supplier.supplier_name == "some updated supplier_name"
      assert supplier.postal_code == 43
      assert supplier.phone == "some updated phone"
      assert supplier.contact == "some updated contact"
      assert supplier.fax == "some updated fax"
      assert supplier.account == "some updated account"
      assert supplier.email == "some updated email"
    end

    test "update_supplier/2 with invalid data returns error changeset" do
      supplier = supplier_fixture()
      assert {:error, %Ecto.Changeset{}} = Master.update_supplier(supplier, @invalid_attrs)
      assert supplier == Master.get_supplier!(supplier.id)
    end

    test "delete_supplier/1 deletes the supplier" do
      supplier = supplier_fixture()
      assert {:ok, %Supplier{}} = Master.delete_supplier(supplier)
      assert_raise Ecto.NoResultsError, fn -> Master.get_supplier!(supplier.id) end
    end

    test "change_supplier/1 returns a supplier changeset" do
      supplier = supplier_fixture()
      assert %Ecto.Changeset{} = Master.change_supplier(supplier)
    end
  end

  describe "mst_topics" do
    alias Glamm.Master.Topic

    import Glamm.MasterFixtures

    @invalid_attrs %{topic: nil, topic_type: nil, auth_list: nil, classification: nil}

    test "list_mst_topics/0 returns all mst_topics" do
      topic = topic_fixture()
      assert Master.list_mst_topics() == [topic]
    end

    test "get_topic!/1 returns the topic with given id" do
      topic = topic_fixture()
      assert Master.get_topic!(topic.id) == topic
    end

    test "create_topic/1 with valid data creates a topic" do
      valid_attrs = %{topic: "some topic", topic_type: :topic, auth_list: "some auth_list", classification: "some classification"}

      assert {:ok, %Topic{} = topic} = Master.create_topic(valid_attrs)
      assert topic.topic == "some topic"
      assert topic.topic_type == :topic
      assert topic.auth_list == "some auth_list"
      assert topic.classification == "some classification"
    end

    test "create_topic/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Master.create_topic(@invalid_attrs)
    end

    test "update_topic/2 with valid data updates the topic" do
      topic = topic_fixture()
      update_attrs = %{topic: "some updated topic", topic_type: :geographic, auth_list: "some updated auth_list", classification: "some updated classification"}

      assert {:ok, %Topic{} = topic} = Master.update_topic(topic, update_attrs)
      assert topic.topic == "some updated topic"
      assert topic.topic_type == :geographic
      assert topic.auth_list == "some updated auth_list"
      assert topic.classification == "some updated classification"
    end

    test "update_topic/2 with invalid data returns error changeset" do
      topic = topic_fixture()
      assert {:error, %Ecto.Changeset{}} = Master.update_topic(topic, @invalid_attrs)
      assert topic == Master.get_topic!(topic.id)
    end

    test "delete_topic/1 deletes the topic" do
      topic = topic_fixture()
      assert {:ok, %Topic{}} = Master.delete_topic(topic)
      assert_raise Ecto.NoResultsError, fn -> Master.get_topic!(topic.id) end
    end

    test "change_topic/1 returns a topic changeset" do
      topic = topic_fixture()
      assert %Ecto.Changeset{} = Master.change_topic(topic)
    end
  end
end
