import 'package:barber/data/provider/employee.dart';
import 'package:barber/data/repository/employee_repository.dart';
import 'package:barber/pages/employee/controller/employee_controller.dart';
import 'package:get/get.dart';

class EmployeeBinding implements Bindings {
@override
void dependencies() {
 Get.lazyPut<EmployeeController>(
      () => EmployeeController(),
    );
   Get.lazyPut<EmployeeRepository>(
      () => EmployeeRepository(),
    );
    Get.lazyPut<EmployeeProvider>(
      () => EmployeeProvider(),
    );
  
  }
}