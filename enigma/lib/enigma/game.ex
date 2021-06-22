defmodule Enigma.Game do
  defstruct [:moves, :answer]

  def move(game, guess) do
    %{ game | moves: [guess | game.moves]}
  end

  def new(answer) do
    %__MODULE__{answer: answer, moves: []}
  end

  def status(%{moves: [winner|_moves], answer: winner}), do: :won
  def status(%{moves: moves}) do
    cond do
      Enum.count(moves) > 9 -> :lost
      true -> :playing
    end
  end
end
