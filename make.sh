#!/usr/bin/env bash
elm make ./src/Main.elm --output="app.js" && go run ./backend/main.go
