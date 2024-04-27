

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:medlistweb/Pages/Auth/loginUser.dart';
import 'package:medlistweb/Pages/home.dart';

import 'auth_middleware.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static get INITIAL => Routes.HOME;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => HomeScreen(),
        middlewares: [AuthMiddleware()])
    ,GetPage(
        name: _Paths.LOGIN,
        page: () => LoginPageUser(),
    )

  ];
}
