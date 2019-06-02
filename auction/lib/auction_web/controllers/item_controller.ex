defmodule AuctionWeb.ItemController do
  use AuctionWeb, :controller

  def index(conn, _params) do
    items = Auction.list_items
    render(conn, "index.html", items: items)
  end

  def show(conn, %{"id" => item_id}) do
    item = Auction.get_item(item_id)
    render(conn, "show.html", item: item)
  end

  def new(conn, _parms) do
    item = Auction.new_item
    render(conn, "new.html", item: item)
  end

  def create(conn, %{"item" => item_params}) do
    case Auction.insert_item(item_params) do
      {:ok, item} -> redirect(conn, to: Routes.item_path(conn, :show, item))
      {:error, item} -> render(conn, "new.html", item: item)
    end
  end

  def edit(conn, %{"id" => item_id}) do
    item = Auction.edit_item(item_id)
    render(conn, "edit.html", item: item)
  end

  def update(conn, %{"id" => item_id, "item" => item_params}) do
    item = Auction.get_item(id)
    case Auction.update_item(item, item_params) do
      {:ok, item} -> redirect(conn, to: Routes.item_path(conn, :show, item))
      {:error, item} -> render(conn, "edit.html", item: item)
    end
  end
end
