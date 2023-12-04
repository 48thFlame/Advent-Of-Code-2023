defmodule Day1 do
  @moduledoc """
  Documentation for `Day1`.
  """

  def load_input do
    File.read!("day1input.txt") |> String.split()
  end

  def get_first_last_item(l) when is_list(l) do
    [hd(l), Enum.reverse(l) |> hd]
  end

  def number_text_to_number_char(s) when is_binary(s) do
    # for part 2
    # didn't complete
    case s do
      "one" ->
        "1"

      "two" ->
        "2"

      "three" ->
        "3"

      "four" ->
        "4"

      "five" ->
        "5"

      "six" ->
        "6"

      "seven" ->
        "7"

      "eight" ->
        "8"

      "nine" ->
        "9"

      _ ->
        "$"
    end
  end

  def get_number_from_binary(b) when is_binary(b) do
    {num, _} =
      String.split(b, "")
      |> IO.inspect()
      # not for part 1
      |> Enum.map(&number_text_to_number_char/1)
      |> IO.inspect()
      |> Enum.filter(&(Integer.parse(&1) != :error))
      # |> IO.inspect()
      |> get_first_last_item()
      # |> IO.inspect()
      |> Enum.join()
      |> Integer.parse()

    num
  end

  def main do
    input = load_input()
    # input = ["1abc2", "pqr3stu8vwx", "a1b2c3d4e5f", "treb7uchet"]

    Enum.map(input, &get_number_from_binary/1) |> Enum.sum()
  end
end
