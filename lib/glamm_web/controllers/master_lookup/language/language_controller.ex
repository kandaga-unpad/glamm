defmodule GlammWeb.LanguageController do
  use GlammWeb, :controller

  alias Glamm.Master.Lookup
  alias Glamm.Master.Lookup.Language

  def index(conn, _params) do
    mst_language = Lookup.list_mst_language()
    render(conn, :index, mst_language: mst_language)
  end

  def new(conn, _params) do
    changeset = Lookup.change_language(%Language{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"language" => language_params}) do
    case Lookup.create_language(language_params) do
      {:ok, language} ->
        conn
        |> put_flash(:info, "Language created successfully.")
        |> redirect(to: ~p"/manage/mst_language/#{language}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    language = Lookup.get_language!(id)
    render(conn, :show, language: language)
  end

  def edit(conn, %{"id" => id}) do
    language = Lookup.get_language!(id)
    changeset = Lookup.change_language(language)
    render(conn, :edit, language: language, changeset: changeset)
  end

  def update(conn, %{"id" => id, "language" => language_params}) do
    language = Lookup.get_language!(id)

    case Lookup.update_language(language, language_params) do
      {:ok, language} ->
        conn
        |> put_flash(:info, "Language updated successfully.")
        |> redirect(to: ~p"/manage/mst_language/#{language}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, language: language, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    language = Lookup.get_language!(id)
    {:ok, _language} = Lookup.delete_language(language)

    conn
    |> put_flash(:info, "Language deleted successfully.")
    |> redirect(to: ~p"/manage/mst_language")
  end
end
