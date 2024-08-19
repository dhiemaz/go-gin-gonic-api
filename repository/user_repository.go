package repository

import "go-gin-gonic-api/domain/dao"

type UserRepository interface {
	FindAllUser() ([]dao.User, error)
	FindUserById(id int) (dao.User, error)
	Save(user *dao.User) (dao.User, error)
	DeleteUserById(id int) error
}
