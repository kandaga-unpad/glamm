defmodule GlammWeb.LanguageHTML do
  use GlammWeb, :html

  embed_templates "language_html/*"

  @doc """
  Renders a language form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def language_form(assigns)
end
