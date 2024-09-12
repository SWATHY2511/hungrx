import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungrx_task/utilities/colors.dart';
import 'package:hungrx_task/utilities/const.dart';
import 'package:hungrx_task/utilities/imagepath.dart';
import 'package:hungrx_task/utilities/text_style.dart';
import 'package:hungrx_task/utilities/widgets/backGroundWid.dart';
import 'package:hungrx_task/utilities/widgets/login_button.dart';
import 'package:hungrx_task/utilities/widgets/textFormField.dart';
import 'package:hungrx_task/view/auth/otpScreen.dart';
import 'package:hungrx_task/view/auth/signupPage.dart';
import 'package:hungrx_task/view/controllers/auth_controller.dart';


class LogInPage extends StatelessWidget {
  LogInPage({super.key});

  final AuthController authController = Get.put(AuthController());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            backGroundWid(context),
            SizedBox(
              height: size.height,
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.05),
                    child: const Text(
                      appname,
                      style: AppTextStyle.headertext,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.07),
                    child: const Text(
                      slogan,
                      style: AppTextStyle.slogantext,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: size.height * 0.02, 
                      bottom: size.height * 0.03
                    ),
                    child: const Image(image: AssetImage(food)),
                  ),
                  authTextForm(
                    context, 
                    text: userName,
                    controller: emailController,  
                  ),
                  authTextForm(
                    context, 
                    text: pswd,
                    view: true,
                    controller: passwordController,  
                    
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: size.height * 0.05, 
                      bottom: size.height * 0.04,
                    ),
                    child: button(
                      context, 
                      label: "Log in", 
                      onPressed: () {
                        String email = emailController.text.trim();
                        String password = passwordController.text.trim();
                        authController.login(email, password);  
                      }
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return OtpScreen();
                        },
                      ));
                    },
                    child: Container(
                      height: 50,
                      width: size.width * 0.7,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.36)),
                        color: white
                      ),
                      child: const Center(
                        child: Text(
                          signInWithMob, 
                          style: AppTextStyle.signInTxt,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(dontHaveAcc, style: AppTextStyle.noAcc),
                        TextButton(
                          child: const Text(
                            "Sign up",
                            style: AppTextStyle.signUp,
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return SignUpPage();
                              },
                            ));
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
