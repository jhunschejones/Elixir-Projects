defmodule IdenticonTest do
  use ExUnit.Case
  doctest Identicon

  test "it returns first three elements in list" do
    image = %Identicon.Image{hex: [225, 39, 30, 89, 78, 165, 51, 54, 194, 18, 242, 254, 188, 44, 205, 214]}
    assert Identicon.pick_color(image).color == {225, 39, 30}
  end

  test "it removes even numbers from grid list" do
    image = %Identicon.Image{grid: [ {225, 0}, {39, 1}, {30, 2}, {39, 3}, {225, 4}, {89, 5}, {78, 6}, {165, 7}, {78, 8}, {89, 9}, {51, 10}, {54, 11}, {194, 12}, {54, 13}, {51, 14}, {18, 15}, {242, 16}, {254, 17}, {242, 18}, {18, 19}, {188, 20}, {44, 21}, {205, 22}, {44, 23}, {188, 24}]}
    assert Identicon.filter_odd_squares(image).grid == [{30, 2}, {78, 6}, {78, 8}, {54, 11}, {194, 12}, {54, 13}, {18, 15}, {242, 16}, {254, 17}, {242, 18}, {18, 19}, {188, 20}, {44, 21}, {44, 23}, {188, 24}]
  end
end
