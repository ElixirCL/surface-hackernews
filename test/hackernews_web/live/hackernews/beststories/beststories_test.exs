defmodule HackerNewsWeb.HackerNews.Live.BestStoriesTest do
  @moduledoc false
  use HackerNewsWeb.ConnCase, async: true
  use Surface.LiveViewTest
  import Phoenix.LiveViewTest

  alias HackerNews.Infra.Mocks.HackerNews.BestStories.API, as: Mock

  @route "/"

  describe "Best Stories" do
    test "that displays the 10 best stories", %{conn: conn} do
      {:ok, liveview, html} = live(conn, @route)

      # first check if we have the container element
      assert liveview
             |> element("#beststories")
             |> has_element?() == true

      # then we use Floki to parse the html
      {:ok, document} = Floki.parse_document(html)

      entries =
        Floki.find(document, ".entry")

      assert Enum.count(entries) == 10

      titles = Floki.find(document, ".entry-title")
      |> Enum.map(fn {_htag, _hattrs, [{_atag, _aattrs, [title]}]} -> title end)

      assert titles == Enum.map(Mock.data, fn {_k, v} -> v["title"] end)
    end
  end
end
