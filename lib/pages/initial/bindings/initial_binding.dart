import 'package:barber/pages/initial/controller/InitialController.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InitialController>(() => InitialController());
  }
}
