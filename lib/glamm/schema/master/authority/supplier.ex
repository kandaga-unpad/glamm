defmodule Glamm.Master.Authority.Supplier do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mst_suppliers" do
    field :address, :string
    field :supplier_name, :string
    field :postal_code, :integer
    field :phone, :string
    field :contact, :string
    field :fax, :string
    field :account, :string
    field :email, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(supplier, attrs) do
    supplier
    |> cast(attrs, [
      :supplier_name,
      :address,
      :postal_code,
      :phone,
      :contact,
      :fax,
      :account,
      :email
    ])
    |> validate_required([
      :supplier_name,
      :address,
      :postal_code,
      :phone,
      :contact,
      :fax,
      :account,
      :email
    ])
  end
end
