defmodule Identicon do
  def main(input) do
    input
    |> hash_input
    |> pick_colour
    |> build_grid
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
    hex
    |> Enum.chunk_every(3, 3, :discard)
    |> Enum.map(&mirror_row/1)
  end

  # My attempt at mirror_row before watching the video
  # def mirror_row([a, b, c]) do
  #   [a, b, c, b, a]
  # end

  def mirror_row(row) do
    [first, second | _] = row
    row ++ [second, first]
  end
end
