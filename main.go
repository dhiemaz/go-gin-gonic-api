package main

import (
	"github.com/joho/godotenv"
	log "github.com/sirupsen/logrus"
	"go-gin-gonic-api/config"
	"go-gin-gonic-api/router"
	"os"
)

func init() {
	godotenv.Load()
	config.InitLog()
}

func main() {
	port := os.Getenv("PORT")

	init := config.Init()
	app := router.Init(init)

	app.Run(":" + port)
	log.Println("Service running")
}
