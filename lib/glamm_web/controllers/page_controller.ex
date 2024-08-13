defmodule GlammWeb.PageController do
  use GlammWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end

  def about(conn, _params) do
    render(conn, :about)
  end

  def manage(conn, _params) do
    render(conn, :manage)
  end

  def master(conn, _params) do
    render(conn, :master)
  end
end
