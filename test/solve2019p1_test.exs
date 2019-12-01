defmodule Solve2019P1Test do
  alias AOC.Solve2019P1
  use ExUnit.Case, async: true

  _old_tests = [
    {12, 2},
    {14, 2},
    {1969, 654},
    {100_756, 33583}
  ]

  tests = [
    # {14, 2},
    {1969, 966}
    # {100_756, 50346}
  ]

  for {input, expected} <- tests do
    @input input
    @expected expected
    test "solves for #{@input}" do
      assert Solve2019P1.solve(["#{@input}"]) == @expected
    end
  end
end
