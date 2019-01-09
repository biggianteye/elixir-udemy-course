defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 52 cards" do
    assert length(Cards.create_deck) == 52
  end

  # Flaky test as there is a small chance that randomising will
  # return a deck with the order unchanged
  test "shuffling a deck randomises it" do
    deck = Cards.create_deck
    refute deck == Cards.shuffle(deck)
  end
end
