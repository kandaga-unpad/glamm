defmodule GlammWeb.ItemStatusHTML do
  use GlammWeb, :html

  embed_templates "item_status_html/*"

  @doc """
  Renders a item_status form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def item_status_form(assigns)
end
