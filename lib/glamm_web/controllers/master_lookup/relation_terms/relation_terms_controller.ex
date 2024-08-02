defmodule GlammWeb.RelationTermsController do
  use GlammWeb, :controller

  alias Glamm.Master.Authority
  alias Glamm.Master.Authority.RelationTerms

  def index(conn, _params) do
    mst_relation_terms = Authority.list_mst_relation_terms()
    render(conn, :index, mst_relation_terms: mst_relation_terms)
  end

  def new(conn, _params) do
    changeset = Authority.change_relation_terms(%RelationTerms{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"relation_terms" => relation_terms_params}) do
    case Authority.create_relation_terms(relation_terms_params) do
      {:ok, relation_terms} ->
        conn
        |> put_flash(:info, "Relation terms created successfully.")
        |> redirect(to: ~p"/manage/mst_relation_terms/#{relation_terms}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    relation_terms = Authority.get_relation_terms!(id)
    render(conn, :show, relation_terms: relation_terms)
  end

  def edit(conn, %{"id" => id}) do
    relation_terms = Authority.get_relation_terms!(id)
    changeset = Authority.change_relation_terms(relation_terms)
    render(conn, :edit, relation_terms: relation_terms, changeset: changeset)
  end

  def update(conn, %{"id" => id, "relation_terms" => relation_terms_params}) do
    relation_terms = Authority.get_relation_terms!(id)

    case Authority.update_relation_terms(relation_terms, relation_terms_params) do
      {:ok, relation_terms} ->
        conn
        |> put_flash(:info, "Relation terms updated successfully.")
        |> redirect(to: ~p"/manage/mst_relation_terms/#{relation_terms}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, relation_terms: relation_terms, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    relation_terms = Authority.get_relation_terms!(id)
    {:ok, _relation_terms} = Authority.delete_relation_terms(relation_terms)

    conn
    |> put_flash(:info, "Relation terms deleted successfully.")
    |> redirect(to: ~p"/manage/mst_relation_terms")
  end
end
