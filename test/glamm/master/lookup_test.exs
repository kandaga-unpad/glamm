defmodule Glamm.Master.LookupTest do
  use Glamm.DataCase

  alias Glamm.Master.Lookup

  describe "mst_places" do
    alias Glamm.Master.Lookup.Place

    import Glamm.Master.LookupFixtures

    @invalid_attrs %{place_name: nil}

    test "list_mst_places/0 returns all mst_places" do
      place = place_fixture()
      assert Lookup.list_mst_places() == [place]
    end

    test "get_place!/1 returns the place with given id" do
      place = place_fixture()
      assert Lookup.get_place!(place.id) == place
    end

    test "create_place/1 with valid data creates a place" do
      valid_attrs = %{place_name: "some place_name"}

      assert {:ok, %Place{} = place} = Lookup.create_place(valid_attrs)
      assert place.place_name == "some place_name"
    end

    test "create_place/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Lookup.create_place(@invalid_attrs)
    end

    test "update_place/2 with valid data updates the place" do
      place = place_fixture()
      update_attrs = %{place_name: "some updated place_name"}

      assert {:ok, %Place{} = place} = Lookup.update_place(place, update_attrs)
      assert place.place_name == "some updated place_name"
    end

    test "update_place/2 with invalid data returns error changeset" do
      place = place_fixture()
      assert {:error, %Ecto.Changeset{}} = Lookup.update_place(place, @invalid_attrs)
      assert place == Lookup.get_place!(place.id)
    end

    test "delete_place/1 deletes the place" do
      place = place_fixture()
      assert {:ok, %Place{}} = Lookup.delete_place(place)
      assert_raise Ecto.NoResultsError, fn -> Lookup.get_place!(place.id) end
    end

    test "change_place/1 returns a place changeset" do
      place = place_fixture()
      assert %Ecto.Changeset{} = Lookup.change_place(place)
    end
  end

  describe "mst_item_status" do
    alias Glamm.Master.Lookup.ItemStatus

    import Glamm.Master.LookupFixtures

    @invalid_attrs %{item_status_id: nil, status_name: nil, rules: nil, skip_stock_take: nil}

    test "list_mst_item_status/0 returns all mst_item_status" do
      item_status = item_status_fixture()
      assert Lookup.list_mst_item_status() == [item_status]
    end

    test "get_item_status!/1 returns the item_status with given id" do
      item_status = item_status_fixture()
      assert Lookup.get_item_status!(item_status.id) == item_status
    end

    test "create_item_status/1 with valid data creates a item_status" do
      valid_attrs = %{item_status_id: "some item_status_id", status_name: "some status_name", rules: "some rules", skip_stock_take: true}

      assert {:ok, %ItemStatus{} = item_status} = Lookup.create_item_status(valid_attrs)
      assert item_status.item_status_id == "some item_status_id"
      assert item_status.status_name == "some status_name"
      assert item_status.rules == "some rules"
      assert item_status.skip_stock_take == true
    end

    test "create_item_status/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Lookup.create_item_status(@invalid_attrs)
    end

    test "update_item_status/2 with valid data updates the item_status" do
      item_status = item_status_fixture()
      update_attrs = %{item_status_id: "some updated item_status_id", status_name: "some updated status_name", rules: "some updated rules", skip_stock_take: false}

      assert {:ok, %ItemStatus{} = item_status} = Lookup.update_item_status(item_status, update_attrs)
      assert item_status.item_status_id == "some updated item_status_id"
      assert item_status.status_name == "some updated status_name"
      assert item_status.rules == "some updated rules"
      assert item_status.skip_stock_take == false
    end

    test "update_item_status/2 with invalid data returns error changeset" do
      item_status = item_status_fixture()
      assert {:error, %Ecto.Changeset{}} = Lookup.update_item_status(item_status, @invalid_attrs)
      assert item_status == Lookup.get_item_status!(item_status.id)
    end

    test "delete_item_status/1 deletes the item_status" do
      item_status = item_status_fixture()
      assert {:ok, %ItemStatus{}} = Lookup.delete_item_status(item_status)
      assert_raise Ecto.NoResultsError, fn -> Lookup.get_item_status!(item_status.id) end
    end

    test "change_item_status/1 returns a item_status changeset" do
      item_status = item_status_fixture()
      assert %Ecto.Changeset{} = Lookup.change_item_status(item_status)
    end
  end

  describe "mst_language" do
    alias Glamm.Master.Lookup.Language

    import Glamm.Master.LookupFixtures

    @invalid_attrs %{language_name: nil}

    test "list_mst_language/0 returns all mst_language" do
      language = language_fixture()
      assert Lookup.list_mst_language() == [language]
    end

    test "get_language!/1 returns the language with given id" do
      language = language_fixture()
      assert Lookup.get_language!(language.id) == language
    end

    test "create_language/1 with valid data creates a language" do
      valid_attrs = %{language_name: "some language_name"}

      assert {:ok, %Language{} = language} = Lookup.create_language(valid_attrs)
      assert language.language_name == "some language_name"
    end

    test "create_language/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Lookup.create_language(@invalid_attrs)
    end

    test "update_language/2 with valid data updates the language" do
      language = language_fixture()
      update_attrs = %{language_name: "some updated language_name"}

      assert {:ok, %Language{} = language} = Lookup.update_language(language, update_attrs)
      assert language.language_name == "some updated language_name"
    end

    test "update_language/2 with invalid data returns error changeset" do
      language = language_fixture()
      assert {:error, %Ecto.Changeset{}} = Lookup.update_language(language, @invalid_attrs)
      assert language == Lookup.get_language!(language.id)
    end

    test "delete_language/1 deletes the language" do
      language = language_fixture()
      assert {:ok, %Language{}} = Lookup.delete_language(language)
      assert_raise Ecto.NoResultsError, fn -> Lookup.get_language!(language.id) end
    end

    test "change_language/1 returns a language changeset" do
      language = language_fixture()
      assert %Ecto.Changeset{} = Lookup.change_language(language)
    end
  end

  describe "mst_labels" do
    alias Glamm.Master.Lookup.Label

    import Glamm.Master.LookupFixtures

    @invalid_attrs %{label_name: nil, label_description: nil, label_icon: nil}

    test "list_mst_labels/0 returns all mst_labels" do
      label = label_fixture()
      assert Lookup.list_mst_labels() == [label]
    end

    test "get_label!/1 returns the label with given id" do
      label = label_fixture()
      assert Lookup.get_label!(label.id) == label
    end

    test "create_label/1 with valid data creates a label" do
      valid_attrs = %{label_name: "some label_name", label_description: "some label_description", label_icon: "some label_icon"}

      assert {:ok, %Label{} = label} = Lookup.create_label(valid_attrs)
      assert label.label_name == "some label_name"
      assert label.label_description == "some label_description"
      assert label.label_icon == "some label_icon"
    end

    test "create_label/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Lookup.create_label(@invalid_attrs)
    end

    test "update_label/2 with valid data updates the label" do
      label = label_fixture()
      update_attrs = %{label_name: "some updated label_name", label_description: "some updated label_description", label_icon: "some updated label_icon"}

      assert {:ok, %Label{} = label} = Lookup.update_label(label, update_attrs)
      assert label.label_name == "some updated label_name"
      assert label.label_description == "some updated label_description"
      assert label.label_icon == "some updated label_icon"
    end

    test "update_label/2 with invalid data returns error changeset" do
      label = label_fixture()
      assert {:error, %Ecto.Changeset{}} = Lookup.update_label(label, @invalid_attrs)
      assert label == Lookup.get_label!(label.id)
    end

    test "delete_label/1 deletes the label" do
      label = label_fixture()
      assert {:ok, %Label{}} = Lookup.delete_label(label)
      assert_raise Ecto.NoResultsError, fn -> Lookup.get_label!(label.id) end
    end

    test "change_label/1 returns a label changeset" do
      label = label_fixture()
      assert %Ecto.Changeset{} = Lookup.change_label(label)
    end
  end

  describe "mst_frequency" do
    alias Glamm.Master.Lookup.Frequency

    import Glamm.Master.LookupFixtures

    @invalid_attrs %{time_unit: nil, frequency: nil, language_prefix: nil, time_increment: nil}

    test "list_mst_frequency/0 returns all mst_frequency" do
      frequency = frequency_fixture()
      assert Lookup.list_mst_frequency() == [frequency]
    end

    test "get_frequency!/1 returns the frequency with given id" do
      frequency = frequency_fixture()
      assert Lookup.get_frequency!(frequency.id) == frequency
    end

    test "create_frequency/1 with valid data creates a frequency" do
      valid_attrs = %{time_unit: "some time_unit", frequency: "some frequency", language_prefix: "some language_prefix", time_increment: 42}

      assert {:ok, %Frequency{} = frequency} = Lookup.create_frequency(valid_attrs)
      assert frequency.time_unit == "some time_unit"
      assert frequency.frequency == "some frequency"
      assert frequency.language_prefix == "some language_prefix"
      assert frequency.time_increment == 42
    end

    test "create_frequency/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Lookup.create_frequency(@invalid_attrs)
    end

    test "update_frequency/2 with valid data updates the frequency" do
      frequency = frequency_fixture()
      update_attrs = %{time_unit: "some updated time_unit", frequency: "some updated frequency", language_prefix: "some updated language_prefix", time_increment: 43}

      assert {:ok, %Frequency{} = frequency} = Lookup.update_frequency(frequency, update_attrs)
      assert frequency.time_unit == "some updated time_unit"
      assert frequency.frequency == "some updated frequency"
      assert frequency.language_prefix == "some updated language_prefix"
      assert frequency.time_increment == 43
    end

    test "update_frequency/2 with invalid data returns error changeset" do
      frequency = frequency_fixture()
      assert {:error, %Ecto.Changeset{}} = Lookup.update_frequency(frequency, @invalid_attrs)
      assert frequency == Lookup.get_frequency!(frequency.id)
    end

    test "delete_frequency/1 deletes the frequency" do
      frequency = frequency_fixture()
      assert {:ok, %Frequency{}} = Lookup.delete_frequency(frequency)
      assert_raise Ecto.NoResultsError, fn -> Lookup.get_frequency!(frequency.id) end
    end

    test "change_frequency/1 returns a frequency changeset" do
      frequency = frequency_fixture()
      assert %Ecto.Changeset{} = Lookup.change_frequency(frequency)
    end
  end
end
