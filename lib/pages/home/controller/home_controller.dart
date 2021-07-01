import 'package:barber/widgets/navigation_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final box = GetStorage('barberapp');

  RxInt selectedIndex = 0.obs;
  Color backgroundColorNav = Colors.white;
  List<NavigationItem> items = [
    NavigationItem(Icon(Icons.home), Text('Home'), Colors.deepPurpleAccent),
    NavigationItem(Icon(Icons.search), Text('Search'), Colors.pinkAccent),
    NavigationItem(Icon(Icons.person_outline), Text('Preson'), Colors.teal),
  ];
  @override

 void inInit() {
    super.onInit();
  }

  void choice(int index) {
    selectedIndex.value = index;
  }
}
