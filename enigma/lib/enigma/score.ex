defmodule Enigma.Score do

  defstruct [:red, :white]

  def new(answer, move) do
    %__MODULE__{red: reds(answer, move), white: whites(Enum.count(answer), reds(answer, move), misses(answer, move))}
  end

  defp reds(answer, move) do
    answer
    |> Enum.zip(move)
    |> Enum.count(fn {x,y} -> x == y end)
  end

  defp misses(answer, move) do
    Enum.count(move -- answer)
  end

  defp whites(answer_count, red, miss) do
    answer_count - red - miss
  end

  def print_score(%{red: red_count, white: white_count}) do
    List.duplicate("R", red_count)
    |> Kernel.++(List.duplicate("W", white_count))
    |> Enum.join(" ")
  end

end
