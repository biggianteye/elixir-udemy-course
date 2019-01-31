defmodule Identicon do
  def main(input) do
    input
    |> hash_input
    |> pick_colour
    |> build_grid
    |> filter_odd_squares
    |> build_pixel_map
    |> draw_image
    |> save_image(input)
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end

  # Pattern matching in the parameter list.
  # This is receiving a param called "image" but also immediately doing pattern
  # matching on it to grab the r/g/b values.
  def pick_colour(%Identicon.Image{hex: [r, g, b | _]} = image) do
    %Identicon.Image{image | colour: {r, g, b}}
  end

  def build_grid(%Identicon.Image{hex: hex} = image) do
    grid =
      hex
      |> Enum.chunk_every(3, 3, :discard)
      |> Enum.map(&mirror_row/1)
      |> List.flatten
      |> Enum.with_index

    %Identicon.Image{image | grid: grid}
  end

  # My attempt at mirror_row before watching the video
  # def mirror_row([a, b, c]) do
  #   [a, b, c, b, a]
  # end

  def mirror_row(row) do
    [first, second | _] = row
    row ++ [second, first]
  end

  def filter_odd_squares(%Identicon.Image{grid: grid} = image) do
    # My attempt, before watching the video
    # Enum.filter(grid, fn {x, _} -> rem(x, 2) == 0 end)

    grid = Enum.filter grid, fn({code, _index}) ->
      rem(code, 2) == 0
    end

    %Identicon.Image{image | grid: grid}
  end

  @doc """
  Convert grid positions on a 5x5 grid into absolute grid co-ordinates on a 250x250 pixel canvas.

  Grid:

  ```
   0  1  2  3  4
   5  6  7  8  9
  10 11 12 13 14
  15 16 17 18 19
  20 21 22 23 24
  ```

  ## Examples

      iex> Identicon.build_pixel_map(%Identicon.Image{ grid: [{0, 1}, {0, 8}]})
      %Identicon.Image{
        colour: nil,
        grid: [{0, 1}, {0, 8}],
        hex: nil,
        pixel_map: [{{50, 0}, {100, 50}}, {{150, 50}, {200, 100}}]
      }
  """
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
  Generate raw identicon image data using the egd library.

  Note that the `:egd.filledRectangle` function is one of the few examples of library code that modifies the input.
  """
  def draw_image(%Identicon.Image{colour: colour, pixel_map: pixel_map}) do
    image = :egd.create(250, 250)
    fill = :egd.color(colour)

    Enum.each pixel_map, fn({start, stop}) ->
      :egd.filledRectangle(image, start, stop, fill)
    end

    :egd.render(image)
  end

  def save_image(image, input) do
    File.write("#{input}.png", image)
  end
end
