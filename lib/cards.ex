defmodule Cards do
  @moduledoc """
  Documentation for Cards.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Cards.hello
      :world

  """
  def hello do
    "world ! "
  end

  def create_deck do
    values = ["ace","two","three","four","five"]
    suits = ["Spades","Clubs","Hearts","Diamonds"]

    for suit <- suits,value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end 

  def contain?(deck, card) do
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
      {:ok,binary} -> :erlang.binary_to_term binary
      {:error,_reason} -> "The file doesn't exist" #use underscore in front of the variable that u dont want to use
    end
  end

  def create_hand(hand_size) do
    #deck = Cards.create_deck
    #deck = Cards.shuffle
    #hand = Cards.deal(deck, hand_size)

    Cards.create_deck |> Cards.shuffle |> Cards.deal(hand_size)
  end

end
