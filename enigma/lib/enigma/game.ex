defmodule Enigma.Game do
  alias Enigma.Score
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

  def to_map(game) do
    rows =
      game.moves
      |> Enum.map(fn move -> row(move, game.answer) end)
      %{rows: rows, status: status(game)}
  end

  def row(move, answer) do
    %{move: move, score: Score.new(answer, move) |> Score.render_score}
  end
end
