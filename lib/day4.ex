defmodule Day4 do
  def calculate_score({winning_nums, mine}) when is_list(winning_nums) and is_list(mine) do
    winners = Enum.filter(mine, &Enum.member?(winning_nums, &1)) |> length()

    if winners <= 0 do
      0
    else
      Integer.pow(2, winners - 1)
    end
  end

  def parse_card(card) when is_binary(card) do
    only_nums =
      String.split(card)
      |> Enum.drop(2)

    pipe_i = Enum.find_index(only_nums, &(&1 == "|"))

    {winning_nums, mine} = Enum.split(only_nums, pipe_i)

    {winning_nums, tl(mine)}
  end

  def part1 do
    input =
      AdventOfCode.get_input(4)
      |> String.split("\n")
      # drops the empty line at end of file
      |> Enum.drop(-1)

    # input =
    #   """
    #   Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
    #   Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
    #   Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
    #   Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
    #   Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
    #   Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11
    #   """
    #   |> String.split("\n")
    #   |> Enum.drop(-1)

    Enum.map(input, &(parse_card(&1) |> calculate_score)) |> Enum.sum()
  end
end
