defmodule GlammWeb.VocabularyLive.Index do
  use GlammWeb, :live_view_dashboard

  alias Glamm.Metadata
  alias Glamm.Metadata.Vocabulary

  @impl true
  def mount(_params, _session, socket) do
    metadata_menu = [
      %{
        name: "Properties",
        url: "/manage/metadata_properties"
      },
      %{
        name: "Resource Class",
        url: "/manage/resource_class"
      },
      %{
        name: "Vocabularies",
        url: "/manage/metadata_vocabularies"
      }
    ]

    socket = socket |> assign(:metadata_menu, metadata_menu)
    {:ok, stream(socket, :metadata_vocabularies, Metadata.list_metadata_vocabularies())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Vocabulary")
    |> assign(:vocabulary, Metadata.get_vocabulary!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Vocabulary")
    |> assign(:vocabulary, %Vocabulary{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Metadata vocabularies")
    |> assign(:vocabulary, nil)
  end

  @impl true
  def handle_info({GlammWeb.VocabularyLive.FormComponent, {:saved, vocabulary}}, socket) do
    {:noreply, stream_insert(socket, :metadata_vocabularies, vocabulary)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    vocabulary = Metadata.get_vocabulary!(id)
    {:ok, _} = Metadata.delete_vocabulary(vocabulary)

    {:noreply, stream_delete(socket, :metadata_vocabularies, vocabulary)}
  end
end
