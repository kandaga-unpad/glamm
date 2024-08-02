defmodule Glamm.Master.Authority.Topic do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mst_topics" do
    field :topic, :string

    field :topic_type, Ecto.Enum,
      values: [:topic, :geographic, :name, :temporal, :genre, :occupation]

    field :auth_list, :string
    field :classification, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(topic, attrs) do
    topic
    |> cast(attrs, [:topic, :topic_type, :auth_list, :classification])
    |> validate_required([:topic, :topic_type, :auth_list, :classification])
  end
end
