defmodule Identicon do
  @moduledoc """
    Provides functions for creating an identicon image from an input string.
  """

  def main(input) do
    input
    |> generate_hash
    |> pick_color
    |> build_grid
    |> filter_odd_squares
    |> build_pixel_map
    |> draw_image
    |> save_image(input)
  end

  @doc """
    Returns a list of hex values generated from the hash of the
    user's input string.

  ## Examples

      iex> Identicon.generate_hash("Boop!").hex
      [51, 59, 101, 60, 153, 110, 243, 6, 196, 87, 159, 105, 109, 207, 250, 205] 

  """
  def generate_hash(input) do
    %Identicon.Image{ 
      :hex => :crypto.hash(:md5, input) |> :binary.bin_to_list 
    }
  end

  @doc """
    Retrieves the first three hex values in a list to use to select an RGB color.
  """
  def pick_color(%Identicon.Image{hex: [r, g, b | _tail]} = image) do 
    # create new struct with contents of old struct plus new property
    %Identicon.Image{image | color: {r, g, b}}
  end

  @doc """
    Takes a list of 16 elements off of a struct and returns a struct with a list 
    that uses the first 15 values passed in to create a 25 value list with 
    indices that will correspond to the indices of our grid.

  ## Examples

      iex> my_hex = [225, 39, 30, 89, 78, 165, 51, 54, 194, 18, 242, 254, 188, 44, 205, 214]
      iex> Identicon.build_grid(%Identicon.Image{hex: my_hex}).grid
      [ {225, 0}, {39, 1}, {30, 2}, {39, 3}, {225, 4},
        {89, 5}, {78, 6}, {165, 7}, {78, 8}, {89, 9},
        {51, 10}, {54, 11}, {194, 12}, {54, 13},  {51, 14},
        {18, 15}, {242, 16}, {254, 17}, {242, 18}, {18, 19},
        {188, 20}, {44, 21}, {205, 22}, {44, 23}, {188, 24}
      ]

  """
  def build_grid(%Identicon.Image{hex: hex} = image) do
    %Identicon.Image{image | grid: 
      hex
      |> Enum.chunk_every(3, 3, :discard)
      |> Enum.map(&mirror_row/1)
      |> List.flatten
      |> Enum.with_index
    }
  end

  @doc """
    Takes a list of values and returns the same list with the first and second
    values reflected over the end of the list.

  ## Examples

      iex> Identicon.mirror_row([146, 45, 200])
      [146, 45, 200, 45, 146] 

  """
  def mirror_row(row) do
    [first, second | _tail] = row

    row ++ [second, first]
  end

  def filter_odd_squares(%Identicon.Image{grid: full_grid} = image) do
    even_grid = Enum.filter full_grid, fn({code, _index} = _square) -> 
      rem(code, 2) == 0 
    end
    
    %Identicon.Image{image | grid: even_grid}
  end

  def build_pixel_map(%Identicon.Image{grid: grid} = image) do
    pixel_map = Enum.map grid, fn({_code, index}) -> 
      horizontal = rem(index, 5) * 50
      vertical = div(index, 5) * 50
      top_left = {horizontal, vertical}
      bottom_right = {horizontal + 50, vertical + 50}

      {top_left, bottom_right}
    end

    %Identicon.Image{image | pixel_map: pixel_map}
  end

  @doc """
    Create an image in memory from input specifications using :egd library
  """
  def draw_image(%Identicon.Image{pixel_map: pixel_map, color: color}) do
    image = :egd.create(250, 250) # create canvas
    fill = :egd.color(color)

    Enum.each pixel_map, fn({start, stop}) ->
      :egd.filledRectangle(image, start, stop, fill)
    end

    :egd.render(image)
  end

  def save_image(image, input) do
    File.mkdir("./generated_identicons")
    File.write("./generated_identicons/#{input}.png", image)
  end
end
