defmodule KitchenCalculator do
  @moduledoc """
  Functions to help work with differents measurements in a kitchen
  """

  @milliliter_per_volume %{
    cup: 240,
    teaspoon: 5,
    milliliter: 1,
    tablespoon: 15,
    fluid_ounce: 30
  }

  def get_volume({_, volume}), do: volume

  def to_milliliter({unit, volume}),
    do: {:milliliter, volume * @milliliter_per_volume[unit]}

  def from_milliliter(volume_pair, unit),
    do: {unit, get_volume(volume_pair) / @milliliter_per_volume[unit]}

  def convert(volume_pair, unit) do
    volume_pair
    |> to_milliliter()
    |> from_milliliter(unit)
  end
end
