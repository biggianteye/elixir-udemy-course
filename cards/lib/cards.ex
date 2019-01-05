defmodule Cards do
  @moduledoc """
  Documentation for Cards.
  """

  def create_deck do
    values = [
      "A", "2", "3", "4", "5", "6", "7",
      "8", "9", "10", "J", "Q", "K"
    ]

    suits = ["♣", "♦", "♥", "♠"]

    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    {status, binary} = File.read(filename)

    case status do
      :ok -> :erlang.binary_to_term(binary)
      :error -> "That file does not exist"
    end
  end
end
