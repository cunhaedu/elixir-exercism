defmodule FreelancerRates do
  @month_billable_days_quantity 22
  @daily_rate 8.0

  def daily_rate(hourly_rate) do
    hourly_rate * @daily_rate
  end

  def apply_discount(before_discount, discount) do
    before_discount - (before_discount * discount / 100)
  end

  def monthly_rate(hourly_rate, discount) do
    hourly_rate * @month_billable_days_quantity
    |> daily_discounted_rate(discount)
    |> ceil
  end

  def days_in_budget(budget, hourly_rate, discount) do
    (budget / daily_discounted_rate(hourly_rate, discount))
    |> Float.floor(1)
  end

  defp daily_discounted_rate(hourly_rate, discount) do
    hourly_rate 
    |> daily_rate 
    |> apply_discount(discount)
  end
end
