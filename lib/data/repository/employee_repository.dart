import 'package:barber/data/models/schedule_model.dart';
import 'package:barber/data/provider/employee.dart';
import 'package:get/get.dart';

class EmployeeRepository {
  final EmployeeProvider apiClient = Get.find<EmployeeProvider>();

  Future<List<Schedule>> getAll() async{
    List<Schedule> list = <Schedule>[];
    var response = await apiClient.getAll();
    if(response != null){
      response.forEach((e){
        list.add(Schedule.fromJson(e));
      });
    }

    return list;
  }
}