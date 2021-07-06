import 'package:barber/data/provider/companies_provider.dart';
import 'package:barber/data/provider/schedule_provider.dart';
import 'package:barber/data/repository/company_repository.dart';
import 'package:barber/data/repository/schedule_repository.dart';
import 'package:barber/pages/home/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<HomeController>(() => HomeController());
   Get.lazyPut<SchedulesRepository>(
      () => SchedulesRepository(),
    );
    Get.lazyPut<ScheduleProvider>(
      () => ScheduleProvider(),
    );
    // Companies
    Get.lazyPut<CompanyRepository>(
      () => CompanyRepository(),
    );
    Get.lazyPut<CompanyProvider>(
      () => CompanyProvider(),
    );
  }
}