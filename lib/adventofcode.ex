defmodule AOC do
  @spec run(integer, integer) :: {:ok, [String.t()]} | {:error, String.t()}
  def run(year, problem) do
    with {:ok, inputs} <- download_inputs(year, problem) do
      output =
        String.to_atom("Elixir.AOC.SolveY#{year}P#{problem}")
        |> apply(:solve, [inputs])

      {:ok, output}
    end
  end

  defp download_inputs(year, problem) do
    session = System.get_env("SESSION")

    with {:ok, %Mojito.Response{body: body}} <-
           Mojito.get("https://adventofcode.com/#{year}/day/#{problem}/input", [
             {"Cookie", "session=#{session}"}
           ]) do
      inputs = Floki.text(body) |> String.split("\n")
      {:ok, inputs}
    end
  end
end
