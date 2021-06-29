import 'package:barber/data/models/user_model.dart';
import 'package:barber/data/repository/auth_repository.dart';
import 'package:barber/routes/routes_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final repository = Get.find<AuthRepository>();
  final key = GlobalKey<FormState>();
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  late User user;
  RxBool showPassword = false.obs;
  RxBool loading = false.obs;
  void register() async {
    if (key.currentState!.validate()) {
      loading.value = true;
      User user = await repository
          .register(usernameCtrl.text, passwordCtrl.text)
          .catchError((e) {
        loading.value = false;
      });
      // ignore: unnecessary_null_comparison
      if (user != null) {
        Get.offAllNamed(RoutesPage.LOGIN);
      }
      loading.value = false;
    }
  }

  void toLogin() {
    Get.offAllNamed(RoutesPage.LOGIN);
  }
}
