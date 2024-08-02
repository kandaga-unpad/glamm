defmodule GlammWeb.PublisherHTML do
  use GlammWeb, :html

  embed_templates "publisher_html/*"

  @doc """
  Renders a publisher form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def publisher_form(assigns)
end
