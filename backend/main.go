package main

import (
    "fmt"
    // "github.com/gorilla/websocket"
    // "os"
    "net/http"
    // "path/filepath"
)

// var index_dir string = "/programming/projects/Awesome/NEW/"

func main() {
    // http.HandleFunc("/", serve_main_page_1)
    // http.HandleFunc("/", serve_main_page_2)
    http.Handle("/", http.FileServer(http.Dir("./"))) // BUG: We should serve the right dir, not the one relative to where this is called from
    fmt.Println("Serving on port 7070...")
    err := http.ListenAndServe(":7070", nil);
    if err != nil {
        fmt.Println(err);
        return;
    };
}

// func serve_main_page_1 ( w http.ResponseWriter, r *http.Request) {
//     http.ServeFile(w, r, "../index.html")
// }

