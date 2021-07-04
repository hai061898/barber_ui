import 'dart:ffi';

import 'package:barber/data/repository/employee_repository.dart';
import 'package:get/get.dart';

class EmployeeController extends GetxController {
  final repository = Get.find<EmployeeRepository>();
  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  loadData() async {
    // await repository.getAll().then((value) {
    //   change(value, status: RxStatus.success());
    // }).catchError((err) {
    //   change(null, status: RxStatus.error('Error.'));
    // });
  }

}
