defmodule LibraryFees do
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601(string) |> elem(1)
  end

  def before_noon?(datetime) do
    NaiveDateTime.to_time(datetime).hour < 12
  end

  def return_date(checkout_datetime) do
    amount_days = (before_noon?(checkout_datetime) && 28) || 29

    NaiveDateTime.to_date(checkout_datetime)
    |> Date.add(amount_days)
  end

  def days_late(planned_return_date, actual_return_datetime) do
    res = Date.compare(planned_return_date, actual_return_datetime)

    if res == :lt do
      planned_return_date
      |> Date.range(actual_return_datetime)
      |> Enum.count()
      |> Kernel.-(1)
    else
      0
    end
  end

  def monday?(datetime) do
    Date.day_of_week(datetime) == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    checkout_datetime = datetime_from_string(checkout)
    return_datetime = datetime_from_string(return)

    planned_return_date = return_date(checkout_datetime)

    days_late = days_late(planned_return_date, return_datetime)

    is_monday = monday?(return_datetime)

    current_rate = (is_monday && rate / 2) || rate

    (days_late * current_rate / 1.0)
    |> Float.floor(0)
  end
end
