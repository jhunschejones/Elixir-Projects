defmodule MultiDictTest do
  use ExUnit.Case
  doctest MultiDict

  describe "new/0" do
    test "returns an empty map" do
      assert MultiDict.new() == %{}
    end
  end

  describe "add/3" do
    test "adds a new value when none exists" do
      list = MultiDict.new()
      result = MultiDict.add(list, "favorite_day", "saturday")
      assert result == %{"favorite_day" => "saturday"}
    end

    test "adds an additional value when one already exists" do
      list = MultiDict.new()
      list = MultiDict.add(list, "favorite_day", "saturday")
      result = MultiDict.add(list, "favorite_day", "friday")
      assert result == %{"favorite_day" => ["friday" | "saturday"]}
    end
  end

  describe "get/2" do
    setup do
      list = MultiDict.new() |> MultiDict.add("favorite_day", "saturday")
      {:ok, list: list}
    end

    test "returns the value stored at a given key", %{list: list} do
      result = MultiDict.get(list, "favorite_day")
      assert result == "saturday"
    end

    test "returns an empty list when no value is found at a given key", %{list: list}  do
      result = MultiDict.get(list, "second_favorite_day")
      assert result == []
    end
  end
end
