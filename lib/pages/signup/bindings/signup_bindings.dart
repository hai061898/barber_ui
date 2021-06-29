import 'package:barber/data/provider/auth_provide.dart';
import 'package:barber/data/repository/auth_repository.dart';
import 'package:barber/pages/signup/controller/signup_controller.dart';
import 'package:get/get.dart';

class SignBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(() => SignupController());
     Get.lazyPut<AuthRepository>(
      () => AuthRepository(),
    );

    Get.lazyPut<AuthProvider>(
      () => AuthProvider(),
    );
  }
}
