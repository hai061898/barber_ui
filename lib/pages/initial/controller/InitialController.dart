import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class InitialController extends GetxController {
  final box = GetStorage('barbar');
  var auth;
  // String verifyAuth() {
  //   auth = box.read('auth');
  //   if (auth != null) {
  //     return;
  //   } else {
  //     return;
  //   }
  // }
}
