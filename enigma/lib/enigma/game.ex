defmodule Enigma.Game do
  defstruct [:moves, :answer]

  def move(game, guess) do
    %{ game | moves: [guess | game.moves]}
  end

  def new(answer) do
    %__MODULE__{answer: answer, moves: []}
  end
end
