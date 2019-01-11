defmodule Identicon do
  def main(input) do
    input
    |> hash_input
    |> pick_colour
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
end
