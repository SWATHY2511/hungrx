import 'package:get/get.dart';
import 'package:hungrx_task/view/screen/home.dart';

class OtpController extends GetxController {
  var phoneNumber = ''.obs;
  var otp = ''.obs;
  var isOtpSent = false.obs;
  var isLoading = false.obs;

  void sendOtp(String phone) {
    if (phone.isNotEmpty && phone.length == 10) {
      isLoading.value = true;
      Future.delayed(const Duration(seconds: 2), () {
        isOtpSent.value = true;
        isLoading.value = false;
        print("OTP sent to $phone");
      });
    } else {
      Get.snackbar('Invalid Phone', 'Please enter a valid 10-digit phone number');
    }
  }

  void verifyOtp(String otpEntered) {
    if (otpEntered.length == 6) {
      isLoading.value = true;
      Future.delayed(const Duration(seconds: 2), () {
        isLoading.value = false;
        if (otpEntered == "123456") { 
          Get.snackbar('Success', 'OTP verified successfully');
          Get.offAll(() => HomePage()); 
        } else {
          Get.snackbar('Invalid OTP', 'Please enter the correct OTP');
        }
      });
    } else {
      Get.snackbar('Invalid OTP', 'OTP should be 6 digits');
    }
  }


  void updatePhoneNumber(String value) {
    phoneNumber.value = value;
  }

 
  void updateOtp(String value) {
    otp.value = value;
  }
}
