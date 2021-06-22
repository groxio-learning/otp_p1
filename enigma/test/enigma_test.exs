defmodule EnigmaTest do
  use ExUnit.Case
  alias Enigma.Game
  doctest Enigma
  alias Enigma.Score

  test "create new game" do
    assert Game.new([1,2,3,4]).answer == [1,2,3,4]
  end

  test "make some moves" do
    [1,2,3,4]
    |> Game.new
    |> assert_key(:answer, [1,2,3,4])
    |> Game.move([3,2,5,6])
    |> assert_key(:moves, [[3,2,5,6]])
    |> Game.move([6,5,4,3])
    |> assert_key(:moves, [[6,5,4,3], [3,2,5,6]])
  end

  test "pass empty answer" do
    []
    |> Game.new
    |> assert_key(:answer, [])
  end

  test "pass empty guess" do
    [1,2,3,4]
    |> Game.new
    |> assert_key(:answer, [1,2,3,4])
    |> Game.move([])
    |> assert_key(:moves, [[]])
  end

  def assert_key(game, key, expected) do
    assert Map.get(game, key) == expected
    game
  end

  test "Score.new" do
    answer = [1, 2, 3, 4]
    move = [1, 3, 4, 5]
    expected = %Score{red: 1, white: 2}
    assert Score.new(answer, move) == expected
  end
end
