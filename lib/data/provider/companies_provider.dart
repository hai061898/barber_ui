import 'package:barber/data/api/api_link.dart';
import 'package:barber/data/models/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CompanyProvider extends GetConnect {
  final box = GetStorage('barberapp');
  getAll() async {
    String? token = Auth.fromJson(box.read('auth')).accessToken;
    var response = await get("${baseurl}/companies",
        headers: {"Authorization": 'Bearer ' + token!});
    if (response.hasError) {
      Get.defaultDialog(
          title: "Error", content: Text("${response.statusText}"));
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
