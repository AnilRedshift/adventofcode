defmodule AOC.Solve2019P1 do
  @behaviour AOC.Solver

  @impl AOC.Solver
  def solve(inputs) do
    AOC.Parser.parse_as_integers(inputs)
    |> Enum.map(&get_fuel_requirements/1)
    |> Enum.sum()
  end

  @impl AOC.Solver
  def solve2(inputs) do
    AOC.Parser.parse_as_integers(inputs)
    |> Enum.map(&get_fuel_requirements/1)
    |> Enum.map(&add_fuel_for_fuel/1)
    |> Enum.sum()
  end

  defp get_fuel_requirements(mass) when mass < 6, do: 0
  defp get_fuel_requirements(mass), do: floor(mass / 3) - 2

  defp add_fuel_for_fuel(mass), do: mass + get_fuel_for_fuel(mass)

  defp get_fuel_for_fuel(fuel) when fuel < 3, do: 0

  defp get_fuel_for_fuel(fuel) do
    new_fuel = get_fuel_requirements(fuel)
    new_fuel + get_fuel_for_fuel(new_fuel)
  end
end
