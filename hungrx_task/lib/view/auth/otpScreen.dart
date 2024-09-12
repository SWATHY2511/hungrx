import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungrx_task/utilities/const.dart';
import 'package:hungrx_task/utilities/text_style.dart';
import 'package:hungrx_task/utilities/widgets/backGroundWid.dart';
import 'package:hungrx_task/utilities/widgets/login_button.dart';
import 'package:hungrx_task/utilities/widgets/textFormField.dart';
import 'package:hungrx_task/view/controllers/otp_controller.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});

  final OtpController otpController = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            backGroundWid(context),
            Center(
              child: SizedBox(
                width: size.width * 0.7,
                child: Obx(() {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.05),
                        child: const Text(
                          appname,
                          style: AppTextStyle.headertext,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: size.height * 0.3,
                            bottom: size.height * 0.05,
                          ),
                          child: Text(
                            otpController.isOtpSent.value ? "Enter OTP" : useMob,
                            style: AppTextStyle.startText,
                          ),
                        ),
                      ),
                      otpController.isOtpSent.value
                          ? otpInputForm(size, context)
                          : phoneInputForm(size, context),
                      const SizedBox(height: 20),
                      otpController.isLoading.value
                          ? const CircularProgressIndicator()
                          : otpController.isOtpSent.value
                              ? verifyOtpButton(context)
                              : sendOtpButton(context),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget phoneInputForm(Size size, BuildContext context) {
    return Column(
      children: [
        otpTextForm(
          context,
          text: "+91",
          onChanged: (value) {
            otpController.updatePhoneNumber(value); 
          },
        ),
      ],
    );
  }

  
  Widget otpInputForm(Size size, BuildContext context) {
    return Column(
      children: [
        otpTextForm(
          context,
          text: "Enter OTP",
          onChanged: (value) {
            otpController.updateOtp(value); 
          },
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }


  Widget sendOtpButton(BuildContext context) {
    return button(
      context,
      label: submit,
      onPressed: () {
        otpController.sendOtp(otpController.phoneNumber.value); 
      },
    );
  }


  Widget verifyOtpButton(BuildContext context) {
    return button(
      context,
      label: "Verify OTP",
      onPressed: () {
        otpController.verifyOtp(otpController.otp.value); 
      },
    );
  }
}
