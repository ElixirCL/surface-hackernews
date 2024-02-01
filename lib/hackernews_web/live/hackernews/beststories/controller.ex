defmodule HackerNewsWeb.HackerNews.Live.BestStories do
  use HackerNewsWeb, :surface_live_view

  alias __MODULE__.ViewModel

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~F"""
    <ViewModel id="beststories" />
    """
  end
end
