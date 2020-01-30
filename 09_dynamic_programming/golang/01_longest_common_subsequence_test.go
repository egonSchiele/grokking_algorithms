package main

import "testing"

func TestSubstring(t *testing.T) {
	var stests = []struct {
		name, a, b, expected string
	}{
		{"hish-vista", "vista", "hish", "is"},
		{"hish-fish", "fish", "hish", "ish"},
	}

	for _, tt := range stests {
		t.Run(tt.name, func(t *testing.T) {
			actual := substring(tt.a, tt.b)

			if actual != tt.expected {
				t.Errorf("Expected %s but received %s", tt.expected, actual)
			}
		})
	}
}

func TestSubsequence(t *testing.T) {
	var stests = []struct {
		name, a, b string
		expected   int
	}{
		{"fosh-fish", "fish", "fosh", 3},
		{"fosh-fort", "fort", "fosh", 2},
	}

	for _, tt := range stests {
		t.Run(tt.name, func(t *testing.T) {
			actual := subsequence(tt.a, tt.b)

			if actual != tt.expected {
				t.Errorf("Expected %d but received %d", tt.expected, actual)
			}
		})
	}
}
