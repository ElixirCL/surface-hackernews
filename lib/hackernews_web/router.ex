defmodule HackerNewsWeb.Router do
  use HackerNewsWeb, :router

  import Surface.Catalogue.Router
  @env Mix.env()

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {HackerNewsWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HackerNewsWeb do
    pipe_through :browser

    live "/", HackerNews.Live.BestStories, :home
    live "/demo", Demo
  end

  # Other scopes may use custom stacks.
  # scope "/api", HackerNewsWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:HackerNews, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: HackerNewsWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end

  if @env == :dev do
    scope "/" do
      pipe_through :browser
      surface_catalogue("/catalogue")
    end
  end

  if @env == :test do
    scope "/mocks", HackerNews.Infra.Mocks do
      pipe_through :api

      scope "/hackernews", HackerNews do
        get "/beststories.json", BestStories.API, :beststories
        get "/item/:id", BestStories.API, :item
      end
    end
  end
end
