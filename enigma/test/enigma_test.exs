defmodule EnigmaTest do
  use ExUnit.Case
  alias Enigma.Game
  doctest Enigma

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
end
