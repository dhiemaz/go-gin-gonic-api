package repository

import "gorm.io/gorm"

type RoleRepository interface {
	FindAllRole()
}

type RoleRepositoryImpl struct {
	db *gorm.DB
}
