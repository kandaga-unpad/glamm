defmodule GlammWeb.DashboardComponents do
  use Phoenix.Component
  use Phoenix.LiveComponent

  @doc """
  Navigation Bar Component for GLAM (Gallery, Library, Archive, Museum)

  ## Examples

    <.nav_bar />
  This component need :active menu and :list_menu props.
  """
  attr :active_nav, :string, default: "home"

  attr :list_menu, :list,
    default: [
      %{
        name: "Home",
        url: "/manage"
      },
      %{
        name: "Master",
        url: "/manage/master"
      },
      %{
        name: "Bibliography",
        url: "/manage/bibliography"
      }
    ]

  def nav_bar(assigns) do
    ~H"""
    <div class="w-full bg-white flex items-center my-5 p-5 rounded-lg gap-6">
      <div class="nav-bar-logo">
        <img src="/images/glamm_icon.svg" class="w-8 h-8" alt="GLAM Logo" />
      </div>
      
      <div class="w-full text-blue-500 flex gap-4">
        <%= for menu <- @list_menu do %>
          <.link href={menu.url} class={["default-menu", @active_nav == menu.url && "active-menu"]}>
            <%= menu.name %>
          </.link>
        <% end %>
      </div>
      
      <div>
        <.link href="/" class="default-menu bg-red-400 hover:bg-red-500 text-white">Exit</.link>
      </div>
    </div>
    """
  end

  @doc """
  Component for Side Bar Menu
  """
  attr :active_side, :string, default: "no value"

  def side_bar_dashboard(assigns) do
    ~H"""
    <section>
      <h5>Master</h5>
      
      <ul class="flex flex-col">
        <%= for _ <- 1..5 do %>
          <.link href="/manage#">Satu</.link>
        <% end %>
      </ul>
    </section>
    """
  end
end
