defmodule GlammWeb.GlamComponents do
  use Phoenix.Component
  use Phoenix.LiveComponent

  alias Phoenix.LiveView.JS
  # import KandaGLAMWeb.Gettext

  @doc """
  Maiin Search Component for GLAM (Gallery, Library, Archive, Museum)

  ## Examples

    <.main_search />

  The components doesn't need custom props, it will use the default props.
  """
  attr :state, :string, default: "quick"

  def main_search(assigns) do
    ~H"""
    <div>
      <div class="search-tab">
        <button
          id="tab1"
          tabindex="1"
          class="search-tab-item active-tab-item"
          phx-click={set_active_tab("#tab1") |> show_active_content("#quick-search")}
        >
          Search
        </button>
        
        <button
          id="tab2"
          tabindex="2"
          class="search-tab-item"
          phx-click={set_active_tab("#tab2") |> show_active_content("#gallery-search")}
        >
          Gallery
        </button>
        
        <button
          id="tab3"
          tabindex="3"
          class="search-tab-item"
          phx-click={set_active_tab("#tab3") |> show_active_content("#library-search")}
        >
          Library
        </button>
        
        <button
          id="tab4"
          tabindex="4"
          class="search-tab-item"
          phx-click={set_active_tab("#tab4") |> show_active_content("#archive-search")}
        >
          Archive
        </button>
        
        <button
          id="tab5"
          tabindex="5"
          class="search-tab-item"
          phx-click={set_active_tab("#tab5") |> show_active_content("#museum-search")}
        >
          Museum
        </button>
      </div>
      
      <div class="tab-blocks">
        <div id="quick-search" class="tab-content">
          <input
            type="text"
            placeholder="Search what you need here..."
            name="quick-search"
            class="input-main-search"
          />
        </div>
        
        <div id="gallery-search" class="tab-content hidden">
          <input
            type="text"
            placeholder="Feeling blue ? find something interesting on our Gallery..."
            name="gallery-search"
            class="input-main-search"
          />
        </div>
        
        <div id="library-search" class="tab-content hidden">
          <input
            type="text"
            placeholder="Search more and read more from our books..."
            name="library-search"
            class="input-main-search"
          />
        </div>
        
        <div id="archive-search" class="tab-content hidden">
          <input
            type="text"
            placeholder="Checkout our historical archive document..."
            name="archive-search"
            class="input-main-search"
          />
        </div>
        
        <div id="museum-search" class="tab-content hidden">
          <input
            type="text"
            placeholder="Bringing memories comeback, search in museum..."
            name="museum-search"
            class="input-main-search"
          />
        </div>
        
        <button class="default-btn">
          Search
        </button>
      </div>
    </div>
    """
  end

  ## JS Commands
  def show_active_content(js \\ %JS{}, to) do
    js
    |> JS.add_class("hidden",
      to: "div.tab-content",
      transition: {"ease-out", "opacity-0", "opacity-100"},
      time: 100
    )
    |> JS.remove_class(
      "hidden",
      to: to,
      transition: {"ease-out", "opacity-0", "opacity-100"},
      time: 100
    )
  end

  def set_active_tab(js \\ %JS{}, tab) do
    js
    |> JS.remove_class("active-tab-item", to: "button.active-tab-item")
    |> JS.add_class("active-tab-item", to: tab)
  end
end
