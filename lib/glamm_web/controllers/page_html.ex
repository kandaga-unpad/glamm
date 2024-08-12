defmodule GlammWeb.PageHTML do
  @moduledoc """
  This module contains pages rendered by PageController.

  See the `page_html` directory for all templates available.
  """
  use GlammWeb, :html
  use Phoenix.LiveView

  embed_templates "page_html/*"

  def active_class(conn, path) do
    current_path = Path.join(["?" | conn.path_info])

    if path == current_path do
      "active-menu"
    else
      "default-menu"
    end
  end
end
