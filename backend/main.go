package main

import (
    "fmt"
    // "github.com/gorilla/websocket"
    // "os"
    "net/http"
    "io/ioutil"
    // "path/filepath"
)

// var upgrader = websocket.Upgrader {
//     ReadBufferSize: 1024,
//     WriteBufferSize: 1024,
// };

// func handle_connection(w http.ResponseWriter, r *http.Request) {
//     conn, err := upgrader.Upgrade(w, r, nil);
//     if err != nil {
//         fmt.Println(err);
//         return;
//     };

//     handle_ws := func(connectionThing *websocket.Conn ) {
//         for {
//             mType, msg, err := conn.ReadMessage();
//             fmt.Println(mType);
//             fmt.Println(msg);
//             if err != nil {
//                 fmt.Println(err);
//                 return;
//             };
//             // conn.WriteMessage(mType, msg);
//         };
//     };
//     go handle_ws(conn);

// };

// var index_dir string = "/programming/projects/Awesome/NEW/"

func main() {
    // http.HandleFunc("/", serve_main_page_1)
    // http.HandleFunc("/", serve_main_page_2)
    // http.Handle("/", http.FileServer(http.Dir("./"))) // BUG: We should serve the right dir, not the one relative to where this is called from

    dir, err1 := ioutil.ReadDir("./data/");
    if err1 != nil {
        fmt.Println("ok something didnt go well");
        fmt.Println(err1);
    };
    // fmt.Printf("%T", dir[0].IsDir());
    fmt.Println(dir[0].IsDir());

    mux := http.NewServeMux();
    mux.Handle("/", http.FileServer(http.Dir("./")));
    // mux.HandleFunc("/", handle_connection);

    mux.HandleFunc("/expo",
        func ( w http.ResponseWriter, r *http.Request ) {
            http.ServeFile(w, r, "./index.html");
    });

    mux.HandleFunc("/data/hot/0/data.json",
        func (w http.ResponseWriter, r *http.Request ) {
            http.ServeFile(w, r, "./data/hot/0/data.json")
    });

    mux.HandleFunc("/ws", func (w http.ResponseWriter, r *http.Request) {
        http.ServeFile(w, r, "./index.html");
    });


    mux.HandleFunc("/download", func ( w http.ResponseWriter, r *http.Request ) {
        http.ServeFile(w, r, "./index.html");
    });

    mux.HandleFunc("/community", func ( w http.ResponseWriter, r *http.Request ) {
        http.ServeFile(w, r, "./index.html");
    });
    // http.Handle("/expo", http.FileServer(http.Dir("./")));
    // http.HandleFunc("/expo", func (w http.ResponseWriter, r *http.Request ) {
    // })

    // DEBUGGING
    // fmt.Println("%T", mux);
    // fmt.Println("%T", mux.HandleFunc);

    fmt.Println("Serving on port 7070...");
    err := http.ListenAndServe(":7070", mux);
    if err != nil {
        fmt.Println(err);
        return;
    };
};

// func serve_main_page_1 ( w http.ResponseWriter, r *http.Request) {
//     http.ServeFile(w, r, "../index.html")
// }

