defmodule HighSchoolSweetheart do
  def first_letter(name), do: name |> String.trim() |> String.at(0)

  def initial(name), do: "#{name |> first_letter() |> String.upcase()}."

  def initials(full_name) do
    name_splited = String.split(full_name, " ")
    initial(hd(name_splited)) <> " " <> initial(List.last(name_splited))
  end

  def pair(full_name1, full_name2) do
    love = "#{initials(full_name1)}  +  #{initials(full_name2)}"

    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{love}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end
end
