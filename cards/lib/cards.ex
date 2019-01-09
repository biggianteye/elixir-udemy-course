defmodule Cards do
  @moduledoc """
  Methods for creating and handling a deck of cards.
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

  @doc """
  Check if the deck contains the given card.

  ## Examples

    iex> deck = Cards.create_deck
    iex> Cards.contains?(deck, "9 of ♦")
    true
    iex> Cards.contains?(deck, "foo")
    false
  """
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
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _} -> "That file does not exist"
    end
  end

  # @doc """
  # Create a hand containing `hand_size` cards.

  # ## Examples

  #     iex> {hand, deck} = Cards.create_hand(1)
  #     iex> hand
  #     ["9 of ♠"]
  # """
  def create_hand(hand_size) do
    create_deck()
    |> shuffle()
    |> deal(hand_size)
  end
end
