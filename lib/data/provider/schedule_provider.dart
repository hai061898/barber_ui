import 'package:barber/data/api/api_link.dart';
import 'package:barber/data/models/auth_model.dart';
import 'package:barber/data/models/employee_model.dart';
import 'package:barber/data/models/service_model.dart';
import 'package:barber/routes/routes_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ScheduleProvider extends GetConnect {
  final box = GetStorage('barberapp');

  getAll() async {
    String? token = Auth.fromJson(box.read('auth')).accessToken;
    var response = await get("${baseurl}/schedules",
        headers: {"Authorization": 'Bearer' + token!});

    if (response.hasError) {
      box.erase();
      Get.offAllNamed(RoutesPage.WELCOME);
    }
    if (response.statusCode == 200) {
      return response.body;
    } else {
      Get.defaultDialog(
          title: "Error", content: Text("${response.body['error']}"));
    }
  }

  add(String date, String hourStart, String hourEnd, Employee employee,
      Service service) async {
    Auth auth = Auth.fromJson(box.read('auth'));
    String? token = auth.accessToken;
    int? userId = auth.user!.id;

    var dt = date.split('/');
    var newDate = dt[2] + '-' + dt[1] + dt[0] + '' + '00:00:00';

    var response = await post("${baseurl}/schedules", {
      "scheduling_date" : "$newDate",
      "hour_start":"$hourStart",
      "hour_end": "$hourEnd",
        "user_id": "$userId",
        "employee_id": "${employee.id ?? ''}",
        "service_id": "${service.id}",
    },
    headers: {"Authorization": 'Barber' + token!});
    if(response.hasError){ 
      Get.defaultDialog(
        title: "Error",
        content: Text("${response.statusText}")
      );
    }

    
    if (response.statusCode == 200) {
      return response.body;
    } else {
      Get.defaultDialog(
          title: "Error",
          content: Text("${response.body['error']}"));
      return null;
    }
  }
}
