defmodule LogLevel do
  def to_label(level, legacy?) do
    cond do
      {level, legacy?} == {0, false} -> :trace
      {level} == {1} -> :debug
      {level} == {2} -> :info
      {level} == {3} -> :warning
      {level} == {4} -> :error
      {level, legacy?} == {5, false} -> :fatal
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    level_label = to_label(level, legacy?)

    cond do
      {level_label} == {:error} -> :ops
      {level_label} == {:fatal} -> :ops
      {level_label, legacy?} == {:unknown, true} -> :dev1
      {level_label, legacy?} == {:unknown, false} -> :dev2
      true -> false
    end
  end
end
