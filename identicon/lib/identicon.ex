defmodule Identicon do
  def main(input) do
    input
    |> hash_input
  end

  @doc """
  Produces an MD5 hash of the given input as a list of bytes.

  ## Examples

      iex> Identicon.hash_input("Hello world!")
      [134, 251, 38, 157, 25, 13, 44, 133, 246, 224, 70, 140, 236, 164, 42, 32]
  """
  def hash_input(input) do
    :crypto.hash(:md5, input)
    |> :binary.bin_to_list
  end
end
