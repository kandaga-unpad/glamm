defmodule GlammWeb.MediaTypesHTML do
  use GlammWeb, :html

  embed_templates "media_types_html/*"

  @doc """
  Renders a media_types form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def media_types_form(assigns)
end
