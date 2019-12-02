defmodule AOC.Solve2019P2 do
  @behaviour AOC.Solver

  @impl AOC.Solver
  def solve(inputs) do
    AOC.Parser.parse_as_integer_array(inputs)
    |> List.replace_at(1, 12)
    |> List.replace_at(2, 2)
    |> run_program()
    |> Enum.at(0)
  end

  @impl AOC.Solver
  def solve2(inputs) do
    program = AOC.Parser.parse_as_integer_array(inputs)

    for x <- 0..100 do
      for y <- 0..100 do
        program
        |> List.replace_at(1, x)
        |> List.replace_at(2, y)
        |> run_program()
        |> case do
          [19_690_720, _] -> 100 * x + y
          _ -> nil
        end
      end
    end
    |> Enum.find(&(&1 != nil))
  end

  def run_program(program, index \\ 0) do
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
