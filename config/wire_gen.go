package config

// Injectors from injector.go:

func Init() *Initialization {
	gormDB := ConnectToDB()
	userRepositoryImpl := repository.UserRepositoryInit(gormDB)
	userServiceImpl := service.UserServiceInit(userRepositoryImpl)
	userControllerImpl := controller.UserControllerInit(userServiceImpl)
	roleRepositoryImpl := repository.RoleRepositoryInit(gormDB)
	initialization := NewInitialization(userRepositoryImpl, userServiceImpl, userControllerImpl, roleRepositoryImpl)
	return initialization
}

// injector.go:

var db = wire.NewSet(ConnectToDB)

var userServiceSet = wire.NewSet(service.UserServiceInit, wire.Bind(new(service.UserService), new(*service.UserServiceImpl)))

var userRepoSet = wire.NewSet(repository.UserRepositoryInit, wire.Bind(new(repository.UserRepository), new(*repository.UserRepositoryImpl)))

var userCtrlSet = wire.NewSet(controller.UserControllerInit, wire.Bind(new(controller.UserController), new(*controller.UserControllerImpl)))
