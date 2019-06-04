defmodule AuctionWeb.ItemControllerTest do
  use AuctionWeb.ConnCase

  test "GET /", %{conn: conn} do
    {:ok, _item} = Auction.insert_item(%{title: "test item"})
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "test item" # test that title of item shows on page
  end

  describe "POST /items" do
    test "with invalid params, shows the new Item form", %{conn: conn} do
      conn = post conn, "/items", %{"item" => %{"bad_param" => "Item 3"}}
      assert html_response(conn, 200) =~ "<h1>New Item</h1>"
    end
    
    test "with invalid params, does not create a new item", %{conn: conn} do
      before_count = Enum.count(Auction.list_items)
      post conn, "/items", %{"item" => %{"bad_param" => "Item 2"}}
      assert Enum.count(Auction.list_items) == before_count
    end

    test "with valid params, redirects to the new Item", %{conn: conn} do
      conn = post conn, "/items", %{"item" => %{"title" => "Item 1"}}
      assert redirected_to(conn) =~ ~r|/items/\d+| # redirect url matches expected
    end

    test "with valid params, creates a new Item", %{conn: conn} do
      before_count = Enum.count(Auction.list_items)
      post conn, "/items", %{"item" => %{"title" => "Awesome Test Item"}}
      assert Enum.count(Auction.list_items) == before_count + 1
    end
  end
end
