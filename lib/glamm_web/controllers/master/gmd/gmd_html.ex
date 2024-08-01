defmodule GlammWeb.GMDHTML do
  use GlammWeb, :html

  embed_templates "gmd_html/*"

  @doc """
  Renders a gmd form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def gmd_form(assigns)
end
