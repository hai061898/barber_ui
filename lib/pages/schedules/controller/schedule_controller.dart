import 'package:barber/data/models/employee_model.dart';
import 'package:barber/data/models/service_model.dart';
import 'package:barber/data/repository/schedule_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ScheduleController extends GetxController {
  final key = GlobalKey<FormState>();
  Service service = Get.arguments;
  final repository = Get.find<SchedulesRepository>();
  DateTime? datePicked;
  TimeOfDay? timePicked;
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  Employee? employee;
  RxDouble start = 7.0.obs;
  RxDouble end = 20.0.obs;

  void openCalendar(BuildContext context) async {
    FocusScope.of(context).requestFocus(new FocusNode());
    datePicked = await showDatePicker(
      context: context,
      initialDate: datePicked ?? DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (datePicked != null && datePicked != DateTime.now()) {
      dateController.text = DateFormat("dd/MM/yyyy")
          .format(DateTime.parse(datePicked.toString()));
    }
  }

  void openClock(BuildContext context) async {
    TimeOfDay time = TimeOfDay.now();
    FocusScope.of(context).requestFocus(new FocusNode());
    timePicked = await showTimePicker(
      context: context,
      initialTime: time,
    );
    if (timePicked != null && timePicked != time) {
      timeController.text = timePicked!.format(context);
      time = timePicked!;
    }
  }

  void openEmployeePage() {}

  void onsave() async {
    if (key.currentState!.validate()) {
      // var response = await repository.add(date, hourStart, hourEnd, employee, service);
      // if(response != null){
      //   Get.back(result: "OK");
      // }
    }
    
  }
}
