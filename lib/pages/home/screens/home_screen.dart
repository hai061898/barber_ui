import 'package:barber/pages/home/controller/home_controller.dart';
import 'package:barber/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/Page1.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              ()=> Visibility(
                visible: controller.selectedIndex ==0,
                child: Page1(),
              ),
            ),
          //    Obx(
          //   () => Visibility(
          //     visible: controller.selectedIndex.value == 1,
          //     child: Page2(),
          //   ),
          // ),
          // Obx(
          //   () => Visibility(
          //     visible: controller.selectedIndex.value == 2,
          //     child: Page3(),
          //   ),
          // ),
          ],
        ),
        bottomNavigationBar: BottomNavBar(),
    );
  }
}
