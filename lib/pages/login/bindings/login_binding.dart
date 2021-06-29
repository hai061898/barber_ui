import 'package:barber/data/provider/auth_provide.dart';
import 'package:barber/data/repository/auth_repository.dart';
import 'package:barber/pages/login/controllers/login_controller.dart';
import 'package:get/get.dart';

class Loginbindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<AuthRepository>(() => AuthRepository());
    Get.lazyPut<AuthProvider>(() => AuthProvider());
  }
}
