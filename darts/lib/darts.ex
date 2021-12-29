defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position :: position) :: integer
  def score({x, y}) do
    distance = calculate_distance({x, y})

    cond do
      distance <= 1 -> 10
      distance <= 5 -> 5
      distance <= 10 -> 1
      true -> 0
    end
  end

  defp calculate_distance({x, y}) do
    (:math.pow(abs(x), 2) + :math.pow(abs(y), 2)) |> :math.sqrt()
  end
end
