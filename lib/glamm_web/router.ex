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
    plug GlammWeb.Utils.DateUtils
  end

  pipeline :dashboard do
    plug :browser
    plug :put_layout, html: {GlammWeb.Layouts, :dashboard}
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
        {GlammWeb.Utils.SaveRequestUri, :save_request_uri},
        {GlammWeb.Utils.SideBarMenuMaster, :get_metadata_menu},
        {GlammWeb.Utils.NavBarMenuLayout, :load_gallery_menu}
      ] do
      live "/gallery", GlamDashboardLive.Gallery, :index
      live "/library", GlamDashboardLive.Library, :index
      live "/archive", GlamDashboardLive.Archive, :index
      live "/museum", GlamDashboardLive.Museum, :index

      live "/metadata", MetadataDashboardLive.Index, :index
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

      live "/resource_template", ResourceTemplateLive.Index, :index
      live "/resource_template/new", ResourceTemplateLive.Index, :new
      live "/resource_template/:id/edit", ResourceTemplateLive.Index, :edit
      live "/resource_template/:id", ResourceTemplateLive.Show, :show
      live "/resource_template/:id/show/edit", ResourceTemplateLive.Show, :edit

      live "/resource_template_property", ResourceTemplatePropertyLive.Index, :index
      live "/resource_template_property/new", ResourceTemplatePropertyLive.Index, :new
      live "/resource_template_property/:id/edit", ResourceTemplatePropertyLive.Index, :edit
      live "/resource_template_property/:id", ResourceTemplatePropertyLive.Show, :show
      live "/resource_template_property/:id/show/edit", ResourceTemplatePropertyLive.Show, :edit
    end
  end

  scope "/manage/gallery", GlammWeb do
    pipe_through [:dashboard, :require_authenticated_user]

    live_session :gallery,
      on_mount: [
        {GlammWeb.UserAuth, :ensure_authenticated},
        {GlammWeb.Utils.SaveRequestUri, :save_request_uri},
        {GlammWeb.Utils.NavBarMenuLayout, :load_gallery_menu}
      ] do
      # Gallery Home
      live "/collections", Gallery.CollectionsHomeLive.Index, :index
      live "/metadata", Gallery.MetadataLive.Index, :index

      # Gallery Collection related
      live "/collections/list", Gallery.CollectionLive.Index, :index
      live "/collections/list/new", Gallery.CollectionLive.New, :new
      live "/collections/list/:id/edit", Gallery.CollectionLive.Index, :edit
      live "/collections/list/:id", Gallery.CollectionLive.Show, :show
      live "/collections/list/:id/show/edit", Gallery.CollectionLive.Show, :edit

      live "/collections/items", Gallery.ItemLive.Index, :index
      live "/collections/items/new", Gallery.ItemLive.New, :new
      live "/collections/items/:id/edit", Gallery.ItemLive.Index, :edit
      live "/collections/items/:id", Gallery.ItemLive.Show, :show
      live "/collections/items/:id/show/edit", Gallery.ItemLive.Show, :edit

      live "/collections/requisitions", Gallery.RequisitionLive.Index, :index
      live "/collections/requisitions/new", Gallery.RequisitionLive.Index, :new
      live "/collections/requisitions/:id/edit", Gallery.RequisitionLive.Index, :edit
      live "/collections/requisitions/:id", Gallery.RequisitionLive.Show, :show
      live "/collections/requisitions/:id/show/edit", Gallery.RequisitionLive.Show, :edit

      # Gallery Metadata related
      live "/metadata/assets", Gallery.AssetsLive.Index, :index
      live "/metadata/assets/new", Gallery.AssetsLive.Index, :new
      live "/metadata/assets/:id/edit", Gallery.AssetsLive.Index, :edit
      live "/metadata/assets/:id", Gallery.AssetsLive.Show, :show
      live "/metadata/assets/:id/show/edit", Gallery.AssetsLive.Show, :edit

      live "/metadata/collection_type", Gallery.CollectionTypeLive.Index, :index
      live "/metadata/collection_type/new", Gallery.CollectionTypeLive.Index, :new
      live "/metadata/collection_type/:id/edit", Gallery.CollectionTypeLive.Index, :edit
      live "/metadata/collection_type/:id", Gallery.CollectionTypeLive.Show, :show
      live "/metadata/collection_type/:id/show/edit", Gallery.CollectionTypeLive.Show, :edit

      live "/metadata/files", Gallery.FilesLive.Index, :index
      live "/metadata/files/new", Gallery.FilesLive.Index, :new
      live "/metadata/files/:id/edit", Gallery.FilesLive.Index, :edit
      live "/metadata/files/:id", Gallery.FilesLive.Show, :show
      live "/metadata/files/:id/show/edit", Gallery.FilesLive.Show, :edit

      live "/metadata/items/value", Gallery.ItemValueLive.Index, :index
      live "/metadata/items/value/new", Gallery.ItemValueLive.Index, :new
      live "/metadata/items/value/:id/edit", Gallery.ItemValueLive.Index, :edit
      live "/metadata/items/value/:id", Gallery.ItemValueLive.Show, :show
      live "/metadata/items/value/:id/show/edit", Gallery.ItemValueLive.Show, :edit
    end
  end

  scope "/manage/system", GlammWeb do
    pipe_through [:dashboard, :require_authenticated_user]

    live_session :system,
      on_mount: [
        {GlammWeb.UserAuth, :ensure_authenticated},
        {GlammWeb.Utils.SaveRequestUri, :save_request_uri}
      ] do
      live "/nodes", NodeLive.Index, :index
      live "/nodes/new", NodeLive.Index, :new
      live "/nodes/:id/edit", NodeLive.Index, :edit

      live "/nodes/:id", NodeLive.Show, :show
      live "/nodes/:id/show/edit", NodeLive.Show, :edit
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
