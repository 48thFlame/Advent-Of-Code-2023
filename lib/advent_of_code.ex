defmodule AdventOfCode do
  @moduledoc """
  Documentation for `AdventOfCode`.
  """

  def get_input(day) when is_number(day) do
    File.read!("input/day#{day}input.txt")
  end
end
