import 'package:barber/pages/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: EdgeInsets.only(left: 8, top: 4, bottom: 4, right: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
          ),
        ],
      ),
      width: Get.width,
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: controller.items.map((item) {
            var itemindex = controller.items.indexOf(item);
            return GestureDetector(
              onTap: () {
                controller.choice(itemindex);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 250),
                height: 50,
                width: controller.selectedIndex.value == itemindex ? 120 : 50,
                padding: controller.selectedIndex.value == itemindex
                    ? EdgeInsets.only(left: 16, right: 16)
                    : null,
                decoration: controller.selectedIndex.value == itemindex
                    ? BoxDecoration(
                        color: item.color,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      )
                    : null,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconTheme(
                          data: IconThemeData(
                            size: 24,
                            color: controller.selectedIndex.value == itemindex
                                ? controller.backgroundColorNav
                                : Colors.black,
                          ),
                          child: item.icon,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: controller.selectedIndex.value == itemindex
                              ? DefaultTextStyle.merge(
                                  style: TextStyle(
                                    color: controller.backgroundColorNav,
                                  ),
                                  child: item.title,
                                )
                              : Container(),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
