package main

import (
	"net/http"
)
func main() {
	mux := http.NewServeMux()

	mux.Handle("GET /api/hello", http.HandleFunc(HelloController))
}

func HelloController(w http.ResponseWriter, r *http.Request) {

}