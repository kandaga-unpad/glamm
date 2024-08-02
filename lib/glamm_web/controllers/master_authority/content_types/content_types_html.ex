defmodule GlammWeb.ContentTypesHTML do
  use GlammWeb, :html

  embed_templates "content_types_html/*"

  @doc """
  Renders a content_types form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def content_types_form(assigns)
end
