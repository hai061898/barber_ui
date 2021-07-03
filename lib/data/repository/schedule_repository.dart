import 'package:barber/data/models/employee_model.dart';
import 'package:barber/data/models/schedule_model.dart';
import 'package:barber/data/models/service_model.dart';
import 'package:barber/data/provider/schedule_provider.dart';
import 'package:get/get.dart';

class SchedulesRepository{
   final ScheduleProvider apiClient = Get.find<ScheduleProvider>();
  
  Future<List<Schedule>> getAll() async{
    List<Schedule> list = <Schedule>[];
    var response = await apiClient.getAll();
    if(response != null){
      response.forEach((e){
        //print(Schedule.fromJson(e).toJson());
        list.add(Schedule.fromJson(e));
      });
    }

    return list;
    
  }
  add(String date, String hourStart, String hourEnd, Employee employee, Service service) async{
    return Schedule.fromJson(await apiClient.add(date, hourStart, hourEnd, employee, service));
  }
}