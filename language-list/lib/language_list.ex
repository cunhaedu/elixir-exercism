defmodule LanguageList do
  @moduledoc """
  Utilities to manipulate a list of programming languages
  """

  @exciting_language "Elixir"

  def new(), do: []

  def add(list, language), do: [language | list]

  def remove(list), do: tl(list)

  def first(list), do: hd(list)

  def count(list), do: length(list)

  def exciting_list?(list), do: @exciting_language in list
end
