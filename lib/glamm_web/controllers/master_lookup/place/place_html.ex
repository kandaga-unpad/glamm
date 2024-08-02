defmodule GlammWeb.PlaceHTML do
  use GlammWeb, :html

  embed_templates "place_html/*"

  @doc """
  Renders a place form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def place_form(assigns)
end
