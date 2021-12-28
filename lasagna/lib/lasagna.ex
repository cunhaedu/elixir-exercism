defmodule Lasagna do
  @moduledoc """
  Functions to help to cook a brilliant lasagna
  """

  @minutes_in_total 40
  @minutes_per_layer 2

  def expected_minutes_in_oven, do: @minutes_in_total

  def remaining_minutes_in_oven(oven_minutes_spent) do
    expected_minutes_in_oven() - oven_minutes_spent
  end

  def preparation_time_in_minutes(layers), do: layers * @minutes_per_layer

  def total_time_in_minutes(layers, oven_minutes_spent) do
    preparation_time_in_minutes(layers) + oven_minutes_spent
  end

  def alarm(), do: "Ding!"
end
