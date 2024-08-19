package main

import (
	"github.com/joho/godotenv"
	"go-gin-gonic-api/config"
)

func init() {
	godotenv.Load()
	config.InitLog()
}

func main() {
	godotenv.Load()
	config.InitLog()
}
