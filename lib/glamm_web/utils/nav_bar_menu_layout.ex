defmodule GlammWeb.Utils.NavBarMenuLayout do
  use Phoenix.Component

  def on_mount(:load_gallery_menu, _params, _session, socket) do
    gallery_menu = [
      %{
        id: 1,
        name: "Collection Type",
        url: "/manage/gallery/gal_collection_type"
      },
      %{
        id: 2,
        name: "Assets",
        url: "/manage/gallery/gal_assets"
      },
      %{
        id: 3,
        name: "Files",
        url: "/manage/gallery/gal_files"
      }
    ]

    socket = socket |> assign(:gallery_menu, gallery_menu)

    {:cont, socket}
  end
end
