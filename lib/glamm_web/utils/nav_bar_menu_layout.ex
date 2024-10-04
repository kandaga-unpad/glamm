defmodule GlammWeb.Utils.NavBarMenuLayout do
  use Phoenix.Component

  def on_mount(:load_gallery_menu, _params, _session, socket) do
    gallery_menu = [
      %{
        id: 1,
        name: "Gallery Home",
        url: "/manage/gallery/home"
      },
      %{
        id: 2,
        name: "Collection",
        url: "/manage/gallery/collections"
      },
      %{
        id: 3,
        name: "Metadata",
        url: "/manage/gallery/metadata/collection_type"
      },
      %{
        id: 4,
        name: "Requisition",
        url: "/manage/gallery/metadata/requisitions"
      }
    ]

    socket = socket |> assign(:gallery_menu, gallery_menu)

    {:cont, socket}
  end
end
