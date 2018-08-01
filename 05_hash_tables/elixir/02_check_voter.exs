defmodule Voting do
  def check_voter(voters_map, name) do
    if Map.has_key?(voters_map, name) do
      IO.puts("kick them out!")
    else
      IO.puts("let them vote!")
      Map.put(voters_map, name, true)
    end
  end
end

Voting.check_voter(%{}, "tom")
|> Voting.check_voter("mike")
|> Voting.check_voter("mike")
