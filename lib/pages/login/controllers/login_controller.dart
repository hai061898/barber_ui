import 'package:barber/data/models/auth_model.dart';
import 'package:barber/data/repository/auth_repository.dart';
import 'package:barber/routes/routes_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final repository = Get.find<AuthRepository>();
  late Auth auth;
  final key = GlobalKey<FormState>();
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  final GetStorage box = GetStorage('barberapp');
  RxBool showpassword = false.obs;
  RxBool loading = false.obs;

  void login() async {
    if (key.currentState!.validate()) {
      loading.value = true;
      await repository
          .login(usernameCtrl.text, passwordCtrl.text)
          .then((auth)  {
            // ignore: unnecessary_null_comparison
            if(auth != null){
              box.write('auth', auth);
              Get.offAllNamed(RoutesName.HOME);
            }
            loading.value =false;
          }).catchError((err){
            loading.value =false;
          });
    }
  }
  void toRegister(){
    Get.offAndToNamed(RoutesName.SIGNUP);
  }
}
