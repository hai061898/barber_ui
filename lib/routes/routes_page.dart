import 'package:barber/pages/home/bindings/home_bindings.dart';
import 'package:barber/pages/home/screens/home_screen.dart';
import 'package:barber/pages/login/bindings/login_binding.dart';
import 'package:barber/pages/login/screens/login_screen.dart';
import 'package:barber/pages/signup/bindings/signup_bindings.dart';
import 'package:barber/pages/signup/screens/signup_screen.dart';
import 'package:barber/pages/welcome/binding/welcome_binding.dart';
import 'package:barber/pages/welcome/screens/welcome_screen.dart';
import 'package:get/get.dart';

import 'package:barber/pages/initial/bindings/initial_binding.dart';
import 'package:barber/pages/initial/screens/initial_screen.dart';

abstract class RoutesName {
  static const INITIAL = '/';
  static const LOGIN = '/login';
  static const WELCOME = '/welcome';
  static const SIGNUP = '/signup';
  static const HOME = '/home';
  static const PAYMENTS = '/payments';
  static const SCHEDULES = '/schedules';
  static const RATINGS = '/ratings';
  static const SETTINGS = '/settings';
  static const COMPANY = '/company';
  static const SERVICE = '/service';
  static const EMPLOYEE_SCHEDULES = '/employee-schedules';
}

class RoutesPage {
  static const INITIAL = RoutesName.INITIAL;
   static final routes = [
    GetPage(
      name: RoutesName.INITIAL,
      page: ()=>InitialPage(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: RoutesName.LOGIN,
      page: () => LoginScreen(),
      binding: Loginbindings(),
    ),
    GetPage(
      name: RoutesName.WELCOME,
      page: () => WelcomeScreen(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: RoutesName.SIGNUP,
      page: () => SignUpScreen(),
      binding: SignBinding(),
    ),
    GetPage(
      name: RoutesName.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}

