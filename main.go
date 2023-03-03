package main

import (
	"fmt"
	"net/http"
)

func main() {
	// Define the route handler for the "/" endpoint
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		// Write the response as a string
		_, err := fmt.Fprintf(w, "Hello, world!")
		if err != nil {
			return
		}
	})

	// Start the server and listen for incoming requests
	if err := http.ListenAndServe(":8080", nil); err != nil {
		panic(err)
	}
}
