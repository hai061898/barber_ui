import 'package:barber/routes/routes_page.dart';
import 'package:barber/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Barber App',
      theme: appThemeData,
      // getPages: RoutesPage.routes(),
      initialRoute: RoutesPage.INITIAL,
      
    );
  }
}
