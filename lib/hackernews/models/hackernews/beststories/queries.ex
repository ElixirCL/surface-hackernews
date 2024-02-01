defmodule HackerNews.Models.HackerNews.BestStories.Queries do
  alias HackerNews.Infra.HackerNews.BestStories.API

  require Logger

  def get_top_story_ids(amount \\ 10) do
    with {:ok, ids} <- API.all() do
      ids.body
      |> Enum.take(amount)
    else
      err ->
        Logger.error(err)
        []
    end
  end

  def get_story(id) do
    API.get(story: id)
  end

  def get_stories(ids) do
    ids
    |> Enum.map(&get_story(&1))
  end
end
