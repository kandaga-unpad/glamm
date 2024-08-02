defmodule Glamm.Master.LookupFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Glamm.Master.Lookup` context.
  """

  @doc """
  Generate a place.
  """
  def place_fixture(attrs \\ %{}) do
    {:ok, place} =
      attrs
      |> Enum.into(%{
        place_name: "some place_name"
      })
      |> Glamm.Master.Lookup.create_place()

    place
  end

  @doc """
  Generate a item_status.
  """
  def item_status_fixture(attrs \\ %{}) do
    {:ok, item_status} =
      attrs
      |> Enum.into(%{
        item_status_id: "some item_status_id",
        rules: "some rules",
        skip_stock_take: true,
        status_name: "some status_name"
      })
      |> Glamm.Master.Lookup.create_item_status()

    item_status
  end

  @doc """
  Generate a language.
  """
  def language_fixture(attrs \\ %{}) do
    {:ok, language} =
      attrs
      |> Enum.into(%{
        language_name: "some language_name"
      })
      |> Glamm.Master.Lookup.create_language()

    language
  end

  @doc """
  Generate a label.
  """
  def label_fixture(attrs \\ %{}) do
    {:ok, label} =
      attrs
      |> Enum.into(%{
        label_description: "some label_description",
        label_icon: "some label_icon",
        label_name: "some label_name"
      })
      |> Glamm.Master.Lookup.create_label()

    label
  end

  @doc """
  Generate a frequency.
  """
  def frequency_fixture(attrs \\ %{}) do
    {:ok, frequency} =
      attrs
      |> Enum.into(%{
        frequency: "some frequency",
        language_prefix: "some language_prefix",
        time_increment: 42,
        time_unit: "some time_unit"
      })
      |> Glamm.Master.Lookup.create_frequency()

    frequency
  end
end
