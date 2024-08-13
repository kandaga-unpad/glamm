defmodule GlammWeb.Router do
  use GlammWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {GlammWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :dashboard do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {GlammWeb.Layouts, :root}
    plug :put_layout, html: {GlammWeb.Layouts, :dashboard}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GlammWeb do
    pipe_through :browser

    get "/", PageController, :home
    get "/about", PageController, :about
  end

  scope "/manage", GlammWeb do
    pipe_through :dashboard

    # Master Authority Files
    get "/", PageController, :manage
    get "/master", PageController, :master
    resources "/mst_carrier_types", CarrierTypesController
    resources "/mst_creator", CreatorController
    resources "/mst_content_types", ContentTypesController
    resources "/mst_gmd", GMDController
    resources "/mst_locations", LocationController
    resources "/mst_media_types", MediaTypesController
    resources "/mst_publishers", PublisherController
    resources "/mst_suppliers", SupplierController
    resources "/mst_topics", TopicController

    # Master Lookup Files
    resources "/mst_frequency", FrequencyController
    resources "/mst_item_status", ItemStatusController
    resources "/mst_labels", LabelController
    resources "/mst_language", LanguageController
    resources "/mst_places", PlaceController
    resources "/mst_relation_terms", RelationTermsController
  end

  # Other scopes may use custom stacks.
  # scope "/api", GlammWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:glamm, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: GlammWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
