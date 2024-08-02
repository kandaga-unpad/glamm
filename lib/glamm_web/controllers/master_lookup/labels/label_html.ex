defmodule GlammWeb.LabelHTML do
  use GlammWeb, :html

  embed_templates "label_html/*"

  @doc """
  Renders a label form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def label_form(assigns)
end
