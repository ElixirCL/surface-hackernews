defmodule HackerNews.Infra.Mocks.HackerNews.BestStories.API do
  use HackerNewsWeb, :controller

  @mocks %{
    1 => %{
      "by" => "author1",
      "descendants" => 214,
      "id" => 1,
      "kids" => [100, 200, 300],
      "score" => 508,
      "time" => 1706564398,
      "title" => "Title 1",
      "type" => "story",
      "url" => "//mocks/hackernews/item/1.json"
    },
    2 => %{
      "by" => "author2",
      "descendants" => 314,
      "id" => 2,
      "kids" => [400, 500, 600],
      "score" => 51,
      "time" => 1706564391,
      "title" => "Title 2",
      "type" => "story",
      "url" => "//mocks/hackernews/item/2.json"
    },
    3 => %{
      "by" => "author3",
      "descendants" => 114,
      "id" => 3,
      "kids" => [400, 500, 600],
      "score" => 55,
      "time" => 1706563254,
      "title" => "Title 3",
      "type" => "story",
      "url" => "//mocks/hackernews/item/3.json"
    },
    4 => %{
      "by" => "author4",
      "descendants" => 34,
      "id" => 4,
      "kids" => [400, 500, 600],
      "score" => 8,
      "time" => 1703064398,
      "title" => "Title 4",
      "type" => "story",
      "url" => "//mocks/hackernews/item/4.json"
    },
    5 => %{
      "by" => "author5",
      "descendants" => 14,
      "id" => 5,
      "kids" => [400, 500, 600],
      "score" => 50,
      "time" => 1702064398,
      "title" => "Title 5",
      "type" => "story",
      "url" => "//mocks/hackernews/item/5.json"
    },
    6 => %{
      "by" => "author6",
      "descendants" => 410,
      "id" => 6,
      "kids" => [400, 500, 600],
      "score" => 218,
      "time" => 1706264398,
      "title" => "Title 6",
      "type" => "story",
      "url" => "//mocks/hackernews/item/6.json"
    },
    7 => %{
      "by" => "author7",
      "descendants" => 34,
      "id" => 7,
      "kids" => [400, 500, 600],
      "score" => 553,
      "time" => 1206564398,
      "title" => "Title 7",
      "type" => "story",
      "url" => "//mocks/hackernews/item/7.json"
    },
    8 => %{
      "by" => "author8",
      "descendants" => 314,
      "id" => 8,
      "kids" => [400, 500, 600],
      "score" => 558,
      "time" => 1406564398,
      "title" => "Title 8",
      "type" => "story",
      "url" => "//mocks/hackernews/item/8.json"
    },
    9 => %{
      "by" => "author9",
      "descendants" => 31,
      "id" => 9,
      "kids" => [400, 500, 600],
      "score" => 428,
      "time" => 1506564398,
      "title" => "Title 9",
      "type" => "story",
      "url" => "//mocks/hackernews/item/9.json"
    },
    10 => %{
      "by" => "author10",
      "descendants" => 4,
      "id" => 10,
      "kids" => [400, 500, 600],
      "score" => 31,
      "time" => 1606564398,
      "title" => "Title 10",
      "type" => "story",
      "url" => "//mocks/hackernews/item/10.json"
    }
  }

  def data, do: @mocks

  def beststories(conn, _params) do
    json(conn, Map.keys(@mocks))
  end

  def item(conn, %{"id" => id}) do
    id = String.split(id, ".json")
      |> List.first()
      |> String.to_integer()

    item = Map.get(@mocks, id)

    json(conn, item)
  end
end
