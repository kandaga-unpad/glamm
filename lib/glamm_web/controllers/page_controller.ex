defmodule GlammWeb.PageController do
  use GlammWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end

  def about(conn, _params) do
    render(conn, :about)
  end

  def manage(conn, _params) do
    conn = conn |> assign(:current_uri, conn.request_path)
    render(conn, :manage)
  end

  def master(conn, _params) do
    render(conn, :master)
  end
end
