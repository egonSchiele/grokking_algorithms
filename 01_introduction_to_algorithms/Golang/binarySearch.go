package main

import "fmt"

//BinSearch
type BinSearch interface {
	CheckDataStr(int, int, DataStr) bool
	CheckDataInt(int, int, DataInt) bool
}

type binSearch struct {
}

func NewBinSearch() BinSearch {
	return &binSearch{}
}

//CheckDataStr find an entry in the List
// l - default 0
// r = len(params.List) - 1
func (s *binSearch) CheckDataStr(l, r int, params DataStr) bool {
	m := (l + r) / 2
	if params.List[m] == params.Data {
		return true
	} else if l >= r {
		return false
	}

	if params.List[m] < params.Data {
		return s.CheckDataStr(m+1, r, params)
	} else {
		return s.CheckDataStr(l, m-1, params)
	}
}

func (s *binSearch) CheckDataInt(l, r int, params DataInt) bool {
	m := (l + r) / 2
	if params.List[m] == params.Data {
		return true
	} else if l >= r {
		return false
	}

	if params.List[m] < params.Data {
		return s.CheckDataInt(m+1, r, params)
	} else {
		return s.CheckDataInt(l, m-1, params)
	}
}

// It is important that both Data are of the same type.
type DataStr struct {
	List []string
	Data string
}

type DataInt struct {
	List []int
	Data int
}

func main() {
	var (
		a      = DataInt{}
		search = NewBinSearch()
		b      = DataStr{}
	)
	a.List = []int{1, 2, 3, 4}
	a.Data = 3
	fmt.Println(search.CheckDataInt(0, len(a.List)-1, a)) //true
	a.Data = 5
	fmt.Println(search.CheckDataInt(0, len(a.List)-1, a)) //false

	b.List = []string{"A", "B", "E", "F"}
	b.Data = "A"
	fmt.Println(search.CheckDataStr(0, len(b.List)-1, b)) //true
	b.Data = "Z"
	fmt.Println(search.CheckDataStr(0, len(b.List)-1, b)) //false
}
