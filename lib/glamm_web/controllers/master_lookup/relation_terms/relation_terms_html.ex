defmodule GlammWeb.RelationTermsHTML do
  use GlammWeb, :html

  embed_templates "relation_terms_html/*"

  @doc """
  Renders a relation_terms form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def relation_terms_form(assigns)
end
