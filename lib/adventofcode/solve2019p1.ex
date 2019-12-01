defmodule AOC.Solve2019P1 do
  @behaviour AOC.Solver

  @impl AOC.Solver
  def solve(inputs) do
    AOC.Parser.parse_as_integers(inputs)
    |> Enum.map(&(floor(&1 / 3) - 2))
    |> Enum.sum()
  end
end
