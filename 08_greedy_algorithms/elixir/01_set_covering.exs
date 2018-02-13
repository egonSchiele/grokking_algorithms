defmodule SetCovering do
  def find_stations(states_needed, stations) do
    stations_list = for station <- stations, do: station
    do_find_stations(states_needed, MapSet.new(), stations_list)
  end

  defp do_find_stations(states_needed, final_stations, stations) do
    cond do
      MapSet.size(states_needed) == 0 ->
        final_stations

      true ->
        {station, states_covered} = find_best_station(states_needed, stations)

        do_find_stations(
          MapSet.difference(states_needed, states_covered),
          MapSet.put(final_stations, station),
          stations
        )
    end
  end

  defp find_best_station(states_needed, [{station_name, station_states} | []]) do
    {station_name, MapSet.intersection(states_needed, station_states)}
  end

  defp find_best_station(states_needed, [{station_name, station_states} | tail]) do
    (best_station = {_, best_states_covered}) = find_best_station(states_needed, tail)

    states_covered = MapSet.intersection(states_needed, station_states)

    if MapSet.size(states_covered) > MapSet.size(best_states_covered),
      do: {station_name, states_covered},
      else: best_station
  end
end

states_needed = MapSet.new(["mt", "wa", "or", "id", "nv", "ut", "ca", "az"])

stations = %{
  "kone" => MapSet.new(["id", "nv", "ut"]),
  "ktwo" => MapSet.new(["wa", "id", "mt"]),
  "kthree" => MapSet.new(["or", "nv", "ca"]),
  "kfour" => MapSet.new(["nv", "ut"]),
  "kfive" => MapSet.new(["ca", "az"])
}

IO.inspect(SetCovering.find_stations(states_needed, stations))
