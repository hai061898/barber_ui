import 'package:barber/data/api/api_link.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthProvider extends GetConnect {
  Future<Map<String, dynamic>> login(String username, String password) async {
    var response = await post(
        "$baseurl/login", {"username": username, "password": password});

    print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      Get.defaultDialog(title: "Login", content: Text("Login fail "));
      return Future.error(response.status.isNotFound);
    }
  }

  Future<Map<String, dynamic>> register(
      String username, String password) async {
    var response = await post(
      "$baseurl/register",
      {"username": username, "password": password},
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      Get.defaultDialog(
          title: "Not register", content: Text("${response.body['message']}"));
      return Future.error(response.status.isNotFound);
    }
  }

// // Get request
//   Future<Response> getUser(int id) => get('http://youapi/users/id');
// // Post request
//   Future<Response> postUser(Map data) =>
//       post('http://youapi/users', body: data);
// // Post request with File
//   Future<Response<CasesModel>> postCases(List<int> image) {
//     final form = FormData({
//       'file': MultipartFile(image, filename: 'avatar.png'),
//       'otherFile': MultipartFile(image, filename: 'cover.png'),
//     });
//     return post('http://youapi/users/upload', form);
//   }

//   GetSocket userMessages() {
//     return socket('https://yourapi/users/socket');
//   }

}
