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
end
