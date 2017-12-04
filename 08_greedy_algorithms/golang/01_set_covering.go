package main

import "fmt"

func main() {
	states_needed := []string{"mt", "wa", "or", "id", "nv", "ut", "ca", "az"}

	var stations = make(map[string][]string)
	stations["kone"] = []string{"id", "nv", "ut"}
	stations["ktwo"] = []string{"wa", "id", "mt"}
	stations["kthree"] = []string{"or", "nv", "ca"}
	stations["kfour"] = []string{"nv", "ut"}
	stations["kfive"] = []string{"ca", "az"}

	station_key := []string{"kone", "ktwo", "kthree", "kfour", "kfive"}

	var final_stations []string

	for len(states_needed) > 0 {
		var best_station string
		var states_covered []string

		for _, station := range station_key {
			states := stations[station]
			var covered = equaldata(states_needed, states)
			if len(covered) > len(states_covered) {
				best_station = station
				states_covered = covered
			}
		}
		states_needed = removedata(states_needed, states_covered)
		final_stations = append(final_stations, best_station)

	}

	fmt.Println(final_stations)
}

func equaldata(states_needed []string, states []string) []string {
	var covered []string

	for _, state_needed := range states_needed {
		for _, state := range states {
			if state_needed == state {
				covered = append(covered, state_needed)
			}
		}
	}
	return covered
}

func removedata(states_needed []string, states_covered []string) []string {
	for _, state_covered := range states_covered {
		states_needed = remove(states_needed, state_covered)
	}
	return states_needed
}

func remove(states_needed []string, state_covered string) []string {
	for i, state_needed := range states_needed {
		if state_covered == state_needed {
			return append(states_needed[:i], states_needed[i+1:]...)
		}
	}
	return states_needed
}
