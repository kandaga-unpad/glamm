defmodule GlammWeb.Router do
  use GlammWeb, :router

  import GlammWeb.UserAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {GlammWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_user
    plug GlammWeb.Plugs.GetCurrentPath
    plug GlammWeb.Utils.SideBarMenuMaster
  end

  pipeline :dashboard do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {GlammWeb.Layouts, :root}
    plug :put_layout, html: {GlammWeb.Layouts, :dashboard}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_user
    plug GlammWeb.Plugs.GetCurrentPath
    plug GlammWeb.Utils.SideBarMenuMaster
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
    pipe_through [:dashboard, :require_authenticated_user]

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

    # Metadata Custom
    live_session :metadata_schema,
      on_mount: [
        {GlammWeb.UserAuth, :ensure_authenticated},
        {GlammWeb.Utils.SaveRequestUri, :save_request_uri}
      ] do
      # live "/metadata", MetadataDashboardLive.Index, :index
      live "/metadata_vocabularies", VocabularyLive.Index, :index
      live "/metadata_vocabularies/new", VocabularyLive.Index, :new
      live "/metadata_vocabularies/:id/edit", VocabularyLive.Index, :edit
      live "/metadata_vocabularies/:id", VocabularyLive.Show, :show
      live "/metadata_vocabularies/:id/show/edit", VocabularyLive.Show, :edit

      live "/metadata_properties", PropertyLive.Index, :index
      live "/metadata_properties/new", PropertyLive.Index, :new
      live "/metadata_properties/:id/edit", PropertyLive.Index, :edit
      live "/metadata_properties/:id", PropertyLive.Show, :show
      live "/metadata_properties/:id/show/edit", PropertyLive.Show, :edit

      live "/resource_class", ResourceClassLive.Index, :index
      live "/resource_class/new", ResourceClassLive.Index, :new
      live "/resource_class/:id/edit", ResourceClassLive.Index, :edit
      live "/resource_class/:id", ResourceClassLive.Show, :show
      live "/resource_class/:id/show/edit", ResourceClassLive.Show, :edit
    end
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

  ## Authentication routes

  scope "/", GlammWeb do
    pipe_through [:browser, :redirect_if_user_is_authenticated]

    live_session :redirect_if_user_is_authenticated,
      on_mount: [{GlammWeb.UserAuth, :redirect_if_user_is_authenticated}] do
      live "/users/register", UserRegistrationLive, :new
      live "/users/log_in", UserLoginLive, :new
      live "/users/reset_password", UserForgotPasswordLive, :new
      live "/users/reset_password/:token", UserResetPasswordLive, :edit
    end

    post "/users/log_in", UserSessionController, :create
  end

  scope "/", GlammWeb do
    pipe_through [:browser, :require_authenticated_user]

    live_session :require_authenticated_user,
      on_mount: [
        {GlammWeb.UserAuth, :ensure_authenticated},
        {GlammWeb.Utils.SaveRequestUri, :save_request_uri}
      ] do
      live "/users/settings", UserSettingsLive, :edit
      live "/users/settings/confirm_email/:token", UserSettingsLive, :confirm_email
    end
  end

  scope "/", GlammWeb do
    pipe_through [:browser]

    delete "/users/log_out", UserSessionController, :delete

    live_session :current_user,
      on_mount: [{GlammWeb.UserAuth, :mount_current_user}] do
      live "/users/confirm/:token", UserConfirmationLive, :edit
      live "/users/confirm", UserConfirmationInstructionsLive, :new
    end
  end
end
