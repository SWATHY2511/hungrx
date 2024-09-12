import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungrx_task/utilities/colors.dart';
import 'package:hungrx_task/utilities/const.dart';
import 'package:hungrx_task/utilities/text_style.dart';
import 'package:hungrx_task/utilities/widgets/backGroundWid.dart';
import 'package:hungrx_task/utilities/widgets/login_button.dart';
import 'package:hungrx_task/utilities/widgets/textFormField.dart';
import 'package:hungrx_task/view/auth/loginPage.dart';
import 'package:hungrx_task/view/controllers/auth_controller.dart'; // Import AuthController

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final AuthController authController = Get.put(AuthController());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            backGroundWid(
              context,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.05),
                  child: const Text(
                    appname,
                    style: AppTextStyle.headertext,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * .25),
                  child: Center(
                    child: SizedBox(
                      height: size.height * 0.5,
                      width: size.width * 0.7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 30),
                              child: Text(
                                strt,
                                style: AppTextStyle.startText,
                              ),
                            ),
                          ),
                          authTextForm(
                            context,
                            text: userName,
                            controller:
                                emailController, ),
                          // Password TextFormField
                          authTextForm(
                            context,
                            text: pswd,
                            controller:
                                passwordController, 
                          ),
                          
                          authTextForm(
                            context,
                            text: repswd,
                            controller:
                                rePasswordController, 
                          ),
                          // Sign Up Button
                          button(context, label: "Sign up", onPressed: () {
                            String email = emailController.text.trim();
                            String password = passwordController.text.trim();
                            String rePassword =
                                rePasswordController.text.trim();

                            if (password != rePassword) {
                              Get.snackbar(
                                "Error",
                                "Passwords do not match!",
                                snackPosition: SnackPosition.BOTTOM,
                              );
                              return;
                            }

                            authController.signUp(email, password);
                          }),
                          Padding(
                            padding: EdgeInsets.only(top: size.height * 0.02),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(dontHaveAcc,
                                    style: AppTextStyle.noAcc),
                                TextButton(
                                  child: const Text(
                                    "Log in",
                                    style: AppTextStyle.signUp,
                                  ),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return LogInPage();
                                      },
                                    ));
                                  },
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
