import 'package:barber/data/api/api_link.dart';
import 'package:barber/data/models/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class EmployeeProvider extends GetConnect {
  final box = GetStorage("barberapp");
  getAll() async {
    Auth auth = Auth.fromJson(box.read('auth'));
    var response =
        await get("${baseurl}/employee/schedules/${auth.user!.employees}");
    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      Get.defaultDialog(
          title: "Error", content: Text("${response.body['error']}"));
    }
  }
  
}
