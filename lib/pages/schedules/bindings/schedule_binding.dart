import 'package:barber/data/provider/schedule_provider.dart';
import 'package:barber/data/repository/schedule_repository.dart';
import 'package:barber/pages/schedules/controller/schedule_controller.dart';
import 'package:get/get.dart';

class ScheduleBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScheduleController>(() => ScheduleController());
    Get.lazyPut<ScheduleProvider>(() => ScheduleProvider());
    Get.lazyPut<SchedulesRepository>(() => SchedulesRepository());
  }
}
