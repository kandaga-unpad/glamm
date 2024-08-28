defmodule GlammWeb.Utils.SideBarMenuMaster do
  import Plug.Conn

  def init(default), do: default

  def call(conn, _default) do
    master_authority = [
      %{name: "Carrier Types", url: "/manage/mst_carrier_types"},
      %{name: "Content Types", url: "/manage/mst_content_types"},
      %{name: "Creators", url: "/manage/mst_creator"},
      %{name: "GMD", url: "/manage/mst_gmd"},
      %{name: "Locations", url: "/manage/mst_locations"},
      %{name: "Media Types", url: "/manage/mst_media_types"},
      %{name: "Publishers", url: "/manage/mst_publishers"},
      %{name: "Suppliers", url: "/manage/mst_suppliers"},
      %{name: "Topics", url: "/manage/mst_topics"}
    ]

    master_lookup = [
      %{name: "Frequency", url: "/manage/mst_frequency"},
      %{name: "Item Status", url: "/manage/mst_item_status"},
      %{name: "Labels", url: "/manage/mst_labels"},
      %{name: "Language", url: "/manage/mst_language"},
      %{name: "Place", url: "/manage/mst_place"},
      %{name: "Relation Terms", url: "/manage/mst_relation_terms"}
    ]

    conn
    |> assign(:master_authority, master_authority)
    |> assign(:master_lookup, master_lookup)
  end

  def on_mount(:get_metadata_menu, _params, _session, socket) do
    menu_data = get_metadata_menu()

    socket = socket |> Phoenix.Component.assign(:metadata_menu, menu_data)

    {:cont, socket}
  end

  defp get_metadata_menu do
    [
      %{
        name: "Properties",
        url: "/manage/metadata_properties"
      },
      %{
        name: "Resource Class",
        url: "/manage/resource_class"
      },
      %{
        name: "Resource Template",
        url: "/manage/resource_template"
      },
      %{
        name: "Resource Template Property",
        url: "/manage/resource_template_property"
      },
      %{
        name: "Vocabularies",
        url: "/manage/metadata_vocabularies"
      }
    ]
  end
end
