defmodule NameBadge do
  def print(id, name, nil) do
    if is_nil(id), do: "#{name} - OWNER", else: "[#{id}] - #{name} - OWNER"
  end

  def print(nil, name, department) do
    "#{name} - #{String.upcase(department)}"
  end

  def print(id, name, department) do
    "[#{id}] - #{name} - #{String.upcase(department)}"
  end
end
