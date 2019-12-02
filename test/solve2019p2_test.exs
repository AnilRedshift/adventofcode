defmodule Solve2019P2Test do
  alias AOC.Solve2019P2
  use ExUnit.Case, async: true

  tests = [
    {[1, 0, 0, 0, 99], [2, 0, 0, 0, 99]},
    {[2, 3, 0, 3, 99], [2, 3, 0, 6, 99]},
    {[2, 4, 4, 5, 99, 0], [2, 4, 4, 5, 99, 9801]},
    {[1, 1, 1, 4, 99, 5, 6, 0, 99], [30, 1, 1, 4, 2, 5, 6, 0, 99]}
  ]

  for {input, expected} <- tests do
    @input input
    @expected expected
    test "solves for #{@input}" do
      assert Solve2019P2.run_program(@input) == @expected
    end
  end
end
