defmodule AOC.SolveY2019P1 do
  @behaviour AOC.Solver

  @impl AOC.Solver
  def solve(inputs) do
    parse_inputs(inputs)
    |> Enum.map(&(floor(&1 / 3) - 2))
    |> Enum.sum()
  end

  defp parse_inputs(inputs) do
    trimmed_inputs = Enum.map(inputs, &String.trim/1)
    is_valid_fn = fn input -> Integer.parse(input) != :error end
    for input <- trimmed_inputs, is_valid_fn.(input), do: String.to_integer(input)
  end
end
