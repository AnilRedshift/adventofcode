 defmodule Problem1 do
  def run(inputs) do
    Enum.map(inputs, fn(input) -> String.to_integer(input) |> div(3) |> floor() |> Kernel.-(2);
  end
 end
 get_fuel = fn(mass) -> floor(13/3) - 2
