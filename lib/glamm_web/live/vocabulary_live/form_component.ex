defmodule GlammWeb.VocabularyLive.FormComponent do
  use GlammWeb, :live_component

  alias Glamm.Metadata

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage vocabulary records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="vocabulary-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:namespace_url]} type="text" label="Namespace url" />
        <.input field={@form[:prefix]} type="text" label="Prefix" />
        <.input field={@form[:label]} type="text" label="Label" />
        <.input field={@form[:information]} type="text" label="Information" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Vocabulary</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{vocabulary: vocabulary} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Metadata.change_vocabulary(vocabulary))
     end)}
  end

  @impl true
  def handle_event("validate", %{"vocabulary" => vocabulary_params}, socket) do
    changeset = Metadata.change_vocabulary(socket.assigns.vocabulary, vocabulary_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"vocabulary" => vocabulary_params}, socket) do
    save_vocabulary(socket, socket.assigns.action, vocabulary_params)
  end

  defp save_vocabulary(socket, :edit, vocabulary_params) do
    case Metadata.update_vocabulary(socket.assigns.vocabulary, vocabulary_params) do
      {:ok, vocabulary} ->
        notify_parent({:saved, vocabulary})

        {:noreply,
         socket
         |> put_flash(:info, "Vocabulary updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_vocabulary(socket, :new, vocabulary_params) do
    case Metadata.create_vocabulary(vocabulary_params) do
      {:ok, vocabulary} ->
        notify_parent({:saved, vocabulary})

        {:noreply,
         socket
         |> put_flash(:info, "Vocabulary created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
