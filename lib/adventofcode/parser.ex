defmodule AOC.Parser do
  @spec parse_as_integers([String.t()]) :: [integer]
  def parse_as_integers(inputs) do
    trimmed_inputs = Enum.map(inputs, &String.trim/1)
    is_valid_fn = fn input -> Integer.parse(input) != :error end
    for input <- trimmed_inputs, is_valid_fn.(input), do: String.to_integer(input)
  end

  def parse_as_integer_array([input | _tail]) do
    String.split(input, ",") |> Enum.map(&String.trim/1) |> parse_as_integers
  end
end
