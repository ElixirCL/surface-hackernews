defmodule HackerNews.Infra.HackerNews.BestStories.API do
  @base_url if Mix.env() == :test,
              do: "http://localhost:4002/mocks/hackernews",
              else: "https://hacker-news.firebaseio.com/v0/"

  def all() do
    Req.new(
      base_url: @base_url,
      url: "beststories.json"
    )
    |> Req.get()
  end

  def get(story: id) do
    Req.new(
      base_url: @base_url,
      url: "item/#{id}.json"
    )
    |> Req.get()
  end
end
