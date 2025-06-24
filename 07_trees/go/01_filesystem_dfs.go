package main

import (
	"fmt"
	"log"
	"os"
	"path/filepath"
	"sort"
)

func printnames(dir string) {
	entries, err := os.ReadDir(dir)
	if err != nil {
		log.Print(err)
		return
	}

	sort.Slice(entries, func(i, j int) bool {
		return entries[i].Name() < entries[j].Name()
	})

	for _, entry := range entries {
		fullpath := filepath.Join(dir, entry.Name())
		fileInfo, err := os.Stat(fullpath)
		if err != nil {
			log.Print(err)
			continue
		}

		if fileInfo.Mode().IsRegular() {
			fmt.Println(entry.Name())
		} else if fileInfo.IsDir() {
			printnames(fullpath)
		}
	}
}

func main() {
	printnames("pics")
}
