import 'package:barber/widgets/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class RoundedPasswordField extends StatelessWidget {
  RoundedPasswordField({
    Key? key,
    this.controller,
    required this.onChanged,
    this.showPassword = false,
    required this.changeShowPassword,
  }) : super(key: key);
  final ValueChanged<String> onChanged;
  final controller;
  bool showPassword;
  final VoidCallback changeShowPassword;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'password empty';
          }
          if (value.length <= 4) {
            return 'you must have 5 char';
          }
          return null;
        },
        controller: controller,
        obscureText: !showPassword,
        onChanged: onChanged,
        cursorColor: Get.theme.primaryColor,
        decoration: InputDecoration(  
          icon: Icon(
            Icons.lock,
            color: Get.theme.primaryColor,
          ),
          suffixIcon:IconButton(
            icon: Icon(  
              Icons.visibility,
              color: Get.theme.primaryColor,
            ),
            onPressed: changeShowPassword,
          ), 
          border: InputBorder.none,
        ),
      ),

    );
  }
}
