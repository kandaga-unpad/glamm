defmodule GlammWeb.AssetsLive.FormComponent do
  use GlammWeb, :live_component

  alias Glamm.Gallery

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage assets records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="assets-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:id]} type="text" label="Id" />
        <.input field={@form[:file_name]} type="text" label="File name" />
        <.input field={@form[:description]} type="text" label="Description" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Assets</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{assets: assets} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Gallery.change_assets(assets))
     end)}
  end

  @impl true
  def handle_event("validate", %{"assets" => assets_params}, socket) do
    changeset = Gallery.change_assets(socket.assigns.assets, assets_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"assets" => assets_params}, socket) do
    save_assets(socket, socket.assigns.action, assets_params)
  end

  defp save_assets(socket, :edit, assets_params) do
    case Gallery.update_assets(socket.assigns.assets, assets_params) do
      {:ok, assets} ->
        notify_parent({:saved, assets})

        {:noreply,
         socket
         |> put_flash(:info, "Assets updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_assets(socket, :new, assets_params) do
    case Gallery.create_assets(assets_params) do
      {:ok, assets} ->
        notify_parent({:saved, assets})

        {:noreply,
         socket
         |> put_flash(:info, "Assets created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
