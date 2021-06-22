defmodule Enigma.Score do

  defstruct [:red, :white]

  def new(answer, move) do
    %__MODULE__{red: reds(answer, move), white: whites(answer, reds(answer, move), misses(answer, move))}
  end

  defp reds(answer, move) do
    Enum.count(Enum.zip(answer, move), fn {x,y} -> x == y end)
  end

  defp misses(answer, move) do
    Enum.count(move -- answer)
  end

  defp whites(answer, red, miss) do
    Enum.count(answer) - red - miss
  end

end
