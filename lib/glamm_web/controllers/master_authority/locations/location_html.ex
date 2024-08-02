defmodule GlammWeb.LocationHTML do
  use GlammWeb, :html

  embed_templates "location_html/*"

  @doc """
  Renders a location form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def location_form(assigns)
end
