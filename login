package main

import (
	"net/http"
	"text/template"
)

func main() {
	http.HandleFunc("/index", index)
	http.HandleFunc("/check", check)
	http.ListenAndServe("127.0.0.1:9000", nil)
}

func check(w http.ResponseWriter, r *http.Request) {
	if r.Method == "POST" {
		accountID := r.FormValue("username")
		password := r.FormValue("password")
		if accountID == "benbencat" && password == "123456" {
			t, _ := template.ParseFiles("home.html")
			t.Execute(w, nil)
		} else {
			w.Write([]byte("<script>alert('账号或者密码不正确')</script>"))
			t, _ := template.ParseFiles("index.html")
			t.Execute(w, nil)
		}
	}
}

func index(w http.ResponseWriter, r *http.Request) {
	if r.Method == "GET" {
		t, _ := template.ParseFiles("index.html")
		t.Execute(w, nil)
	}
}
