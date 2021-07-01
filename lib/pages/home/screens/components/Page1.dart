import 'package:barber/pages/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page1 extends StatelessWidget {
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(  
        children: [
          Obx(
            (list)=>Expanded(

            ),
          ),
        ],
      ),
    );
  }
}
