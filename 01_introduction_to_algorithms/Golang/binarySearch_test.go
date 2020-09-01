package main

import "testing"

func Test_binSearch_CheckDataStr(t *testing.T) {
	type args struct {
		l      int
		r      int
		params DataStr
	}
	tests := []struct {
		name string
		args args
		want bool
	}{
		{"If this list have data", args{
			l: 0,
			r: 4,
			params: DataStr{
				List: []string{"A", "B", "C", "D", "Z"},
				Data: "C",
			},
		}, true},
		{
			"Second for check", args{
			l: 0,
			r: 4,
			params: DataStr{
				List: []string{"A", "B", "C", "D", "Z"},
				Data: "Z",
			},
		}, true},
		{"haven't", args{
			l: 0,
			r: 4,
			params: DataStr{
				List: []string{"A", "B", "C", "D", "Z"},
				Data: "E",
			},
		}, false},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			s := &binSearch{}
			if got := s.CheckDataStr(tt.args.l, tt.args.r, tt.args.params); got != tt.want {
				t.Errorf("CheckDataStr() = %v, want %v", got, tt.want)
			}
		})
	}
}

func Test_binSearch_CheckDataInt(t *testing.T) {
	type args struct {
		l      int
		r      int
		params DataInt
	}
	tests := []struct {
		name string
		args args
		want bool
	}{
		{
			"first test for check",
			args{
				l: 0,
				r: 5,
				params: DataInt{
					List: []int{0, 1, 2, 3, 7, 9},
					Data: 3,
				},
			},
			true,
		}, {
			"second test for check",
			args{
				l: 0,
				r: 5,
				params: DataInt{
					List: []int{0, 1, 2, 3, 7, 9},
					Data: 9,
				},
			},
			true,
		},
		{
			"haven't",
			args{
				l: 0,
				r: 5,
				params: DataInt{
					List: []int{0, 1, 2, 3, 7, 9},
					Data: 5,
				},
			},
			false,
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			s := &binSearch{}
			if got := s.CheckDataInt(tt.args.l, tt.args.r, tt.args.params); got != tt.want {
				t.Errorf("CheckDataInt() = %v, want %v", got, tt.want)
			}
		})
	}
}