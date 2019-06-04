defmodule AuctionWeb.Router do
  use AuctionWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug AuctionWeb.Authenticator
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AuctionWeb do
    pipe_through :browser

    get "/", ItemController, :index

    resources "/items", ItemController, except: [:delete] do
      resources "/bids", BidController, only: [:create] # nested resource
    end

    resources "/users", UserController, only: [:show, :new, :create]
    get "/login", SessionController, :new
    post "/login", SessionController, :create
    delete "/logout", SessionController, :delete
  end

  # Other scopes may use custom stacks.
  scope "/api", AuctionWeb.API do
    pipe_through :api

    resources "/items", ItemController, only: [:index, :show]
  end
end
