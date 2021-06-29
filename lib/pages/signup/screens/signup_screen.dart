import 'package:barber/pages/signup/controller/signup_controller.dart';
import 'package:barber/widgets/background.dart';
import 'package:barber/widgets/rounded_button.dart';
import 'package:barber/widgets/rounded_input_fisld.dart';
import 'package:barber/widgets/rounded_password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SignUpScreen extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Form(
            key: controller.key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "REGISTRAR",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: Get.height * 0.03),
                SvgPicture.asset(
                  "assets/signup.svg",
                  height: Get.height * 0.35,
                ),
                RoundedInputField(
                  hintText: "name",
                  controller: controller.usernameCtrl,
                  onChanged: (value) {},
                ),
                Obx(
                  () => RoundedPasswordField(
                    onChanged: (value) {},
                    changeShowPassword: () {
                      controller.showPassword.value =
                          !controller.showPassword.value;
                    },
                    controller: controller.passwordCtrl,
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible: !controller.showPassword.value,
                    child: RoundedButton(
                      text: "REGISTRAR",
                      press: () {
                        controller.register();
                      },
                    ),
                  ),
                ),
                Obx(() => Visibility(
                      visible: controller.showPassword.value,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        width: Get.width * 0.8,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(29),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 40,
                              ),
                            ),
                            onPressed: null,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    )),
                SizedBox(height: Get.height * 0.03),
                // AlreadyHaveAnAccountCheck(
                //   login: false,
                //   press: () {
                //     controller.toLogin();
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
