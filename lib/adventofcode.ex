defmodule AOC do
  @spec run(integer, integer, integer) :: term | {:error, String.t()}
  def run(year, problem, part \\ 0) do
    method =
      case part do
        2 -> :solve2
        _ -> :solve
      end

    with {:ok, inputs} <- download_inputs(year, problem) do
      String.to_atom("Elixir.AOC.Solve#{year}P#{problem}")
      |> apply(method, [inputs])
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
