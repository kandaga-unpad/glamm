defmodule GlammWeb.FrequencyHTML do
  use GlammWeb, :html

  embed_templates "frequency_html/*"

  @doc """
  Renders a frequency form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def frequency_form(assigns)
end
