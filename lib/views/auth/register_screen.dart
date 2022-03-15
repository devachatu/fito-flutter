import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:progress_loading_button/progress_loading_button.dart';

import '../../routes/app_pages.dart';
import '../../shared/utilities/constants.dart';
import '../../shared/widgets/TextField.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController fNameController = new TextEditingController();
  TextEditingController lNameController = new TextEditingController();
  TextEditingController phNoController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController cPasswordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color(0xFF324856),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Image(
                        image: logoImage,
                      )),
                  width: Get.width,
                  height: Get.height * 0.2,
                ),
                CustomTextField(
                  label: "Email",
                  controller: emailController,
                  width: Get.width * 0.9,
                ),
                CustomTextField(
                  label: "First Name",
                  controller: fNameController,
                  width: Get.width * 0.9,
                ),
                CustomTextField(
                  label: "Last Name",
                  controller: lNameController,
                  width: Get.width * 0.9,
                ),
                CustomTextField(
                  label: "Phone Number",
                  controller: phNoController,
                  width: Get.width * 0.9,
                ),
                CustomTextField(
                  label: "Password",
                  controller: passwordController,
                  width: Get.width * 0.9,
                ),
                CustomTextField(
                  label: "Confirm Password",
                  controller: cPasswordController,
                  width: Get.width * 0.9,
                ),
                LoadingButton(
                  borderRadius: 50,
                  defaultWidget: Text(
                    'Register',
                    style: TextStyle(color: Colors.black),
                  ),
                  color: Colors.white,
                  width: 196,
                  height: 60,
                  onPressed: () async {
                    await Future.delayed(
                      Duration(milliseconds: 3000),
                      () {
                        print('Button Pressed');
                      },
                    );
                  },
                )
                // InkWell(
                //   onTap: () {
                //     Get.toNamed(Routes.REGISTER);
                //   },
                //   child: Container(
                //     //color: Colors.amber,
                //     child: Row(
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: const [
                //         Icon(
                //           Icons.email_outlined,
                //           color: Color(0xFF324856),
                //         ),
                //         SizedBox(width: 10),
                //         Text(
                //           'SIGN UP WITH EMAIL',
                //           style: TextStyle(color: Color(0xFF324856)),
                //         )
                //       ],
                //     ),
                //     height: 50,
                //     width: Get.width * 0.75,
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       border: Border.all(color: Colors.white),
                //       borderRadius: BorderRadius.circular(50),
                //     ),
                //   ),
                // )
              ],
            )));
  }
}
