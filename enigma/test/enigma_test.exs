defmodule EnigmaTest do
  use ExUnit.Case
  doctest Enigma
  alias Enigma.Score

  test "greets the world" do
    assert Enigma.hello() == :world
  end

  test "Score.new" do
    answer = [1, 2, 3, 4]
    move = [1, 3, 4, 5]
    expected = %Score{red: 1, white: 2}
    assert Score.new(answer, move) == expected
  end
end
