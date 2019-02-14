package main

import (
	"net/http"
)

func main() {
}

// Handler is the entry point for this fission function
func Handler(w http.ResponseWriter, r *http.Request) {
	msg := "Hello, world!\n"
	w.Write([]byte(msg))
}
