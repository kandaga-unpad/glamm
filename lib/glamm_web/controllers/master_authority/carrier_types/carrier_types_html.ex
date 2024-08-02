defmodule GlammWeb.CarrierTypesHTML do
  use GlammWeb, :html

  embed_templates "carrier_types_html/*"

  @doc """
  Renders a carrier_types form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def carrier_types_form(assigns)
end
