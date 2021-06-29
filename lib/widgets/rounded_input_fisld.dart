import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
    required this.controller,
  }) : super(key: key);
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final controller;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'user null';
          }
          return null;
        },
        controller: controller,
        onChanged: onChanged,
        cursorColor: Get.theme.primaryColor,
        decoration: InputDecoration(  
          icon: Icon(
            icon,
            color: Get.theme.primaryColor,

          ),
          hintText: hintText,
          border: InputBorder.none

        ),
      ),
    );
  }
}
