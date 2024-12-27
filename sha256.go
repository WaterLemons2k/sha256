package main

import (
	"crypto/sha256"
	"fmt"
	"io"
	"os"
)

func e(err error) {
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
}

func sum(f *os.File) []byte {
	defer f.Close()
	h := sha256.New()

	_, err := io.Copy(h, f)
	e(err)

	return h.Sum(nil)
}

func main() {
	if len(os.Args) != 2 {
		println("Usage: sha256 [file]")
		os.Exit(2)
	}

	f, err := os.Open(os.Args[1])
	e(err)

	fmt.Printf("%x\n", sum(f))
}
