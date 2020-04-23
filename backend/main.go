package main

import (
    "fmt"
    "net/http"
)

func main() {
    // http.HandleFunc("/", serve_main_page_1)
    // http.HandleFunc("/", serve_main_page_2)
    // http.Handle("/", http.FileServer(http.Dir("./"))) // BUG: We should serve the right dir, not the one relative to where this is called from

    // dir, err1 := ioutil.ReadDir("./data/");
    // if err1 != nil {
    //     fmt.Println("ok something didnt go well");
    //     fmt.Println(err1);
    // };
    // fmt.Println(dir[0].IsDir());

    mux := http.NewServeMux();
    mux.Handle("/", http.FileServer(http.Dir("./")));

    mux.HandleFunc("/expo",
        func ( w http.ResponseWriter, r *http.Request ) {
            http.ServeFile(w, r, "./index.html");
    });

    mux.HandleFunc("/download", func ( w http.ResponseWriter, r *http.Request ) {
        http.ServeFile(w, r, "./index.html");
    });

    mux.HandleFunc("/community", func ( w http.ResponseWriter, r *http.Request ) {
        http.ServeFile(w, r, "./index.html");
    });

    fmt.Println("Serving on port 7070...");
    err := http.ListenAndServe(":7070", mux);
    if err != nil {
        fmt.Println(err);
        return;
    };
};
