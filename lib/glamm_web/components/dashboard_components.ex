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
        name: "Settings",
        url: "/users/settings"
      },
      %{
        name: "Metadata",
        url: "/manage/metadata"
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
      
      <div class="w-full max-w-36">
        <.link href="/" class="default-menu bg-red-400 hover:bg-red-500 text-white">Exit</.link>
        <.link
          href="/users/log_out"
          method="delete"
          class="default-menu bg-red-400 hover:bg-red-500 text-white"
        >
          Log out
        </.link>
      </div>
    </div>
    """
  end

  @doc """
  Component for Side Bar Menu
  """
  attr :active_side, :string, default: "no value"

  slot :inner_block

  def side_bar_dashboard(assigns) do
    ~H"""
    <section class="bg-white rounded-xl p-5 max-w-64 w-full h-full">
      <div class="flex flex-col gap-2">
        <h5>Master Files</h5>
         <%= render_slot(@inner_block) %>
      </div>
    </section>
    """
  end
end
