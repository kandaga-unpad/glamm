defmodule Glamm.Master.AuthorityTest do
  use Glamm.DataCase

  alias Glamm.Master.Authority

  describe "mst_relation_terms" do
    alias Glamm.Master.Authority.RelationTerms

    import Glamm.Master.AuthorityFixtures

    @invalid_attrs %{rt_code: nil, rt_description: nil}

    test "list_mst_relation_terms/0 returns all mst_relation_terms" do
      relation_terms = relation_terms_fixture()
      assert Authority.list_mst_relation_terms() == [relation_terms]
    end

    test "get_relation_terms!/1 returns the relation_terms with given id" do
      relation_terms = relation_terms_fixture()
      assert Authority.get_relation_terms!(relation_terms.id) == relation_terms
    end

    test "create_relation_terms/1 with valid data creates a relation_terms" do
      valid_attrs = %{rt_code: "some rt_code", rt_description: "some rt_description"}

      assert {:ok, %RelationTerms{} = relation_terms} = Authority.create_relation_terms(valid_attrs)
      assert relation_terms.rt_code == "some rt_code"
      assert relation_terms.rt_description == "some rt_description"
    end

    test "create_relation_terms/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Authority.create_relation_terms(@invalid_attrs)
    end

    test "update_relation_terms/2 with valid data updates the relation_terms" do
      relation_terms = relation_terms_fixture()
      update_attrs = %{rt_code: "some updated rt_code", rt_description: "some updated rt_description"}

      assert {:ok, %RelationTerms{} = relation_terms} = Authority.update_relation_terms(relation_terms, update_attrs)
      assert relation_terms.rt_code == "some updated rt_code"
      assert relation_terms.rt_description == "some updated rt_description"
    end

    test "update_relation_terms/2 with invalid data returns error changeset" do
      relation_terms = relation_terms_fixture()
      assert {:error, %Ecto.Changeset{}} = Authority.update_relation_terms(relation_terms, @invalid_attrs)
      assert relation_terms == Authority.get_relation_terms!(relation_terms.id)
    end

    test "delete_relation_terms/1 deletes the relation_terms" do
      relation_terms = relation_terms_fixture()
      assert {:ok, %RelationTerms{}} = Authority.delete_relation_terms(relation_terms)
      assert_raise Ecto.NoResultsError, fn -> Authority.get_relation_terms!(relation_terms.id) end
    end

    test "change_relation_terms/1 returns a relation_terms changeset" do
      relation_terms = relation_terms_fixture()
      assert %Ecto.Changeset{} = Authority.change_relation_terms(relation_terms)
    end
  end
end
