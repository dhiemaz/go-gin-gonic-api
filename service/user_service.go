package service

import (
	"github.com/gin-gonic/gin"
	log "github.com/sirupsen/logrus"
	"go-gin-gonic-api/constant"
	"go-gin-gonic-api/domain/dao"
	"go-gin-gonic-api/pkg"
	"net/http"
	"strconv"
)

type UserService interface {
	GetAllUser(c *gin.Context)
	GetUserById(c *gin.Context)
	AddUserData(c *gin.Context)
	UpdateUserData(c *gin.Context)
	DeleteUser(c *gin.Context)
}

type UserServiceImpl struct {
	userRepository repository.UserRepository
}

func (u UserServiceImpl) UpdateUserData(c *gin.Context) {
	defer pkg.PanicHandler(c)

	log.Info("start to execute program update user data by id")
	userID, _ := strconv.Atoi(c.Param("userID"))

	var request dao.User
	if err := c.ShouldBindJSON(&request); err != nil {
		log.Error("Happened error when mapping request from FE. Error", err)
		pkg.PanicException(constant.InvalidRequest)
	}

	data, err := u.userRepository.FindUserById(userID)
	if err != nil {
		log.Error("Happened error when get data from database. Error", err)
		pkg.PanicException(constant.DataNotFound)
	}

	data.RoleID = request.RoleID
	data.Email = request.Email
	data.Name = request.Password
	data.Status = request.Status
	u.userRepository.Save(&data)

	if err != nil {
		log.Error("Happened error when updating data to database. Error", err)
		pkg.PanicException(constant.UnknownError)
	}

	c.JSON(http.StatusOK, pkg.BuildResponse(constant.Success, data))
}
