defmodule GlammWeb.Plugs.GetCurrentPath do
  import Plug.Conn

  def init(default), do: default

  def call(conn, _default) do
    assign(conn, :current_uri, conn.request_path)
  end
end
