defmodule GlammWeb.Utils.NavBarMenuLayout do
  use Phoenix.Component

  def on_mount(:load_gallery_menu, _params, _session, socket) do
    gallery_menu = gallery_menu()
    gallery_menu_metadata = gallery_menu_metadata()
    gallery_menu_collection = gallery_menu_collection()

    socket =
      socket
      |> assign(:gallery_menu, gallery_menu)
      |> assign(:gallery_menu_metadata, gallery_menu_metadata)
      |> assign(:gallery_menu_collection, gallery_menu_collection)

    {:cont, socket}
  end

  defp gallery_menu() do
    [
      %{
        id: 1,
        name: "Gallery Home",
        url: "/manage/gallery"
      },
      %{
        id: 2,
        name: "Collection",
        url: "/manage/gallery/collections"
      },
      %{
        id: 3,
        name: "Metadata",
        url: "/manage/gallery/metadata"
      }
    ]
  end

  defp gallery_menu_metadata() do
    [
      %{
        id: 1,
        name: "Collection Type",
        url: "/manage/gallery/metadata/collection_type"
      },
      %{
        id: 2,
        name: "Collection Item Value",
        url: "/manage/gallery/metadata/items/value"
      },
      %{
        id: 3,
        name: "Assets",
        url: "/manage/gallery/metadata/assets"
      },
      %{
        id: 4,
        name: "Files",
        url: "/manage/gallery/metadata/files"
      }
    ]
  end

  defp gallery_menu_collection() do
    [
      %{
        id: 1,
        name: "Collections List",
        url: "/manage/gallery/collections/list"
      },
      %{
        id: 2,
        name: "Collection Item",
        url: "/manage/gallery/collections/items"
      },
      %{
        id: 3,
        name: "Requisition",
        url: "/manage/gallery/collections/requisitions"
      }
    ]
  end
end
