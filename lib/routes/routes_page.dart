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
  ];
}

