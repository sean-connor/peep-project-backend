defmodule PeepProjectBackend.Router do
  use PeepProjectBackend.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PeepProjectBackend do
    pipe_through :api

    resources "/songs", SongController
  end

end
