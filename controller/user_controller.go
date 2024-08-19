package controller

import (
	"github.com/gin-gonic/gin"
	"go-gin-gonic-api/service"
)

type UserController interface {
	GetAllUserData(c *gin.Context)
	AddUserData(c *gin.Context)
	GetUserById(c *gin.Context)
	UpdateUserData(c *gin.Context)
	DeleteUser(c *gin.Context)
}

type UserControllerImpl struct {
	svc service.UserService
}
