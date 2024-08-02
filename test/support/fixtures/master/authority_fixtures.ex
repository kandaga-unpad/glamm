defmodule Glamm.Master.AuthorityFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Glamm.Master.Authority` context.
  """

  @doc """
  Generate a creator.
  """
  def creator_fixture(attrs \\ %{}) do
    {:ok, creator} =
      attrs
      |> Enum.into(%{
        affiliation: "some affiliation",
        creator_contact: "some creator_contact",
        creator_name: "some creator_name",
        creator_type: :people
      })
      |> Glamm.Master.Authority.create_creator()

    creator
  end

  @doc """
  Generate a gmd.
  """
  def gmd_fixture(attrs \\ %{}) do
    {:ok, gmd} =
      attrs
      |> Enum.into(%{
        gmd_code: "some gmd_code",
        gmd_name: "some gmd_name",
        icon_image: "some icon_image"
      })
      |> Glamm.Master.Authority.create_gmd()

    gmd
  end

  @doc """
  Generate a publisher.
  """
  def publisher_fixture(attrs \\ %{}) do
    {:ok, publisher} =
      attrs
      |> Enum.into(%{
        place_name: "some place_name"
      })
      |> Glamm.Master.Authority.create_publisher()

    publisher
  end

  @doc """
  Generate a content_types.
  """
  def content_types_fixture(attrs \\ %{}) do
    {:ok, content_types} =
      attrs
      |> Enum.into(%{
        code: "some code",
        content_type: "some content_type",
        mar_code: "some mar_code"
      })
      |> Glamm.Master.Authority.create_content_types()

    content_types
  end

  @doc """
  Generate a carrier_types.
  """
  def carrier_types_fixture(attrs \\ %{}) do
    {:ok, carrier_types} =
      attrs
      |> Enum.into(%{
        carrier_type: "some carrier_type",
        code: "some code",
        marc_code: "some marc_code"
      })
      |> Glamm.Master.Authority.create_carrier_types()

    carrier_types
  end

  @doc """
  Generate a media_types.
  """
  def media_types_fixture(attrs \\ %{}) do
    {:ok, media_types} =
      attrs
      |> Enum.into(%{
        code: "some code",
        marc_code: "some marc_code",
        media_type: "some media_type"
      })
      |> Glamm.Master.Authority.create_media_types()

    media_types
  end

  @doc """
  Generate a supplier.
  """
  def supplier_fixture(attrs \\ %{}) do
    {:ok, supplier} =
      attrs
      |> Enum.into(%{
        account: "some account",
        address: "some address",
        contact: "some contact",
        email: "some email",
        fax: "some fax",
        phone: "some phone",
        postal_code: 42,
        supplier_name: "some supplier_name"
      })
      |> Glamm.Master.Authority.create_supplier()

    supplier
  end

  @doc """
  Generate a topic.
  """
  def topic_fixture(attrs \\ %{}) do
    {:ok, topic} =
      attrs
      |> Enum.into(%{
        auth_list: "some auth_list",
        classification: "some classification",
        topic: "some topic",
        topic_type: :topic
      })
      |> Glamm.Master.Authority.create_topic()

    topic
  end

  @doc """
  Generate a location.
  """
  def location_fixture(attrs \\ %{}) do
    {:ok, location} =
      attrs
      |> Enum.into(%{
        location_code: "some location_code",
        location_name: "some location_name",
        location_place: "some location_place"
      })
      |> Glamm.Master.Authority.create_location()

    location
  end

  @doc """
  Generate a relation_terms.
  """
  def relation_terms_fixture(attrs \\ %{}) do
    {:ok, relation_terms} =
      attrs
      |> Enum.into(%{
        rt_code: "some rt_code",
        rt_description: "some rt_description"
      })
      |> Glamm.Master.Authority.create_relation_terms()

    relation_terms
  end
end
