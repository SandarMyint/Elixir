defmodule Cards do
  @moduledoc """
  Documentation for Cards.
  """

  @doc """
  Hello world.

  ## Examples
      
      iex> Cards.hello
      "world"
  """
  def hello do
    "world"
  end

  @doc """
  Create the deck of cards.

  ## Examples

        iex> Cards.create_deck
        ["ace of Spades", "two of Spades", "three of Spades", "four of Spades",
        "five of Spades", "ace of Clubs", "two of Clubs", "three of Clubs",
        "four of Clubs", "five of Clubs", "ace of Hearts", "two of Hearts",
        "three of Hearts", "four of Hearts", "five of Hearts", "ace of Diamonds",
        "two of Diamonds", "three of Diamonds", "four of Diamonds", "five of Diamonds"]

  """

  def create_deck do
    values = ["ace","two","three","four","five"]
    suits = ["Spades","Clubs","Hearts","Diamonds"]

    for suit <- suits,value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
  Shuffle the deck of cards using `Enum.shuffle()`.
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end 

  @doc """
  Check if the card is the member of the deck using `Enum.member?()`.

  ## Examples

        iex> deck = Cards.create_deck
        iex> Cards.contain?(deck,"ace of Spades")
        true

  """
  def contain?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Split the cards in the deck according to the hand_size using `Enum.split()`.

  ## Examples

        iex> deck = Cards.create_deck
        iex> Cards.deal(deck,1)
        {["ace of Spades"],
        ["two of Spades", "three of Spades", "four of Spades", "five of Spades",
          "ace of Clubs", "two of Clubs", "three of Clubs", "four of Clubs",
          "five of Clubs", "ace of Hearts", "two of Hearts", "three of Hearts",
          "four of Hearts", "five of Hearts", "ace of Diamonds", "two of Diamonds",
          "three of Diamonds", "four of Diamonds", "five of Diamonds"]}

  """

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
  Change the deck in binary form and save to the specific file.

  ## Examples

        iex> deck = Cards.create_deck
        iex> Cards.save(deck, 'my_deck')
        :ok    

  """

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
  Read from the file and change back from the binary form.

  ## Examples

        iex> Cards.load('my_deck')
        ["ace of Spades", "two of Spades", "three of Spades", "four of Spades",
        "five of Spades", "ace of Clubs", "two of Clubs", "three of Clubs",
        "four of Clubs", "five of Clubs", "ace of Hearts", "two of Hearts",
        "three of Hearts", "four of Hearts", "five of Hearts", "ace of Diamonds",
        "two of Diamonds", "three of Diamonds", "four of Diamonds", "five of Diamonds"]

  """

  def load(filename) do
    case File.read(filename) do
      {:ok,binary} -> :erlang.binary_to_term binary
      {:error,_reason} -> "The file doesn't exist" #use underscore in front of the variable that u dont want to use
    end
  end

  @doc """
  Create the deck of cards.
  Shuffle the deck of cards using `Enum.member?()`.
  Split the cards in the deck according to the hand_size using `Enum.split()`.
  All in the pipe operation.
  """
  def create_hand(hand_size) do
    #deck = Cards.create_deck
    #deck = Cards.shuffle
    #hand = Cards.deal(deck, hand_size)

    Cards.create_deck |> Cards.shuffle |> Cards.deal(hand_size)
  end

end
