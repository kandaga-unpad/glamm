defmodule GlammWeb.SupplierHTML do
  use GlammWeb, :html

  embed_templates "supplier_html/*"

  @doc """
  Renders a supplier form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def supplier_form(assigns)
end
