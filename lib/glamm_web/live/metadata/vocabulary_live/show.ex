defmodule GlammWeb.VocabularyLive.Show do
  use GlammWeb, :live_view_dashboard

  alias Glamm.Metadata

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:vocabulary, Metadata.get_vocabulary!(id))}
  end

  defp page_title(:show), do: "Show Vocabulary"
  defp page_title(:edit), do: "Edit Vocabulary"
end
