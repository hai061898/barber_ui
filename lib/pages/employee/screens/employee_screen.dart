import 'package:barber/data/models/schedule_model.dart';
import 'package:barber/global/constants.dart';
import 'package:barber/pages/employee/controller/employee_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EmployeePage extends GetView<EmployeeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agendamentos Funcionário'),
        centerTitle: true,
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Obx(
          () => ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              Schedule? schedule = list[index];
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      padding: EdgeInsets.all(20),
                      color: Color(0xffdfdeff),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${schedule!.user!.fullname}",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "${schedule.service!.name}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Horario do Agendamento',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.timer,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${DateFormat('dd/MM/yyyy').format(DateTime.parse(schedule.schedulingDate!))} - Previsão: ${schedule.hourStart}h ~ ${schedule.hourEnd}h",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 0.5,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.call,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.mail_outline,
                                color: Colors.black,
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              Text(
                                "R\$ ${formatnumber.format(schedule.service!.cost)}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ),
          onError: (err) => Expanded(child: Center(child: Text('$err'))),
          onEmpty: Expanded(
              child: Center(child: Text('Erorro.'))),
        ),
      ),
    );
  }
}
