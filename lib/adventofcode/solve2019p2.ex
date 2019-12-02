defmodule AOC.Solve2019P2 do
  @behaviour AOC.Solver

  @impl AOC.Solver
  def solve(inputs) do
    AOC.Parser.parse_as_integer_array(inputs)
    |> List.replace_at(1, 12)
    |> List.replace_at(2, 2)
    |> run_program(0)
  end

  def run_program(program, index) do
    next_index = index + 4

    Enum.slice(program, index..(next_index - 1))
    |> run_instruction(program, next_index)
  end

  defp run_instruction([1, index0, index1, outputIndex], program, next_index) do
    List.replace_at(program, outputIndex, Enum.at(program, index0) + Enum.at(program, index1))
    |> run_program(next_index)
  end

  defp run_instruction([2, index0, index1, outputIndex], program, next_index) do
    List.replace_at(program, outputIndex, Enum.at(program, index0) * Enum.at(program, index1))
    |> run_program(next_index)
  end

  defp run_instruction([99 | _rest], program, _next_index), do: program
end
