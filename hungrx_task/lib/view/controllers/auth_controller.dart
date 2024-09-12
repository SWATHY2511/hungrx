import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hungrx_task/utilities/colors.dart';
import 'package:hungrx_task/view/auth/loginPage.dart';
import 'package:hungrx_task/view/screen/home.dart';
class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var isLoggedIn = false.obs;
  var phoneNumber = ''.obs;
  var otp = ''.obs;

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      isLoggedIn.value = true;
      Get.offAll(() => HomePage());  
    } catch (e) {
      Get.snackbar("Login Failed", e.toString(), snackPosition: SnackPosition.BOTTOM, backgroundColor: const Color.fromARGB(205, 255, 255, 255));
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      isLoggedIn.value = true;
      Get.offAll(() => HomePage()); 
    } catch (e) {
      Get.snackbar("Signup Failed", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> loginWithPhoneNumber(String phoneNumber) async {
    this.phoneNumber.value = phoneNumber;
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        isLoggedIn.value = true;
        Get.offAll(() => HomePage());  // Navigate to HomePage if login is successful
      },
      verificationFailed: (FirebaseAuthException e) {
        Get.snackbar("Login Failed", e.toString(), snackPosition: SnackPosition.BOTTOM);
      },
      codeSent: (String verificationId, int? resendToken) async {
        // Handle code sent
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Handle timeout
      },
    );
  }

  // Submit OTP method
  Future<void> submitOtp(String otp) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: phoneNumber.value,
      smsCode: otp,
    );
    await _auth.signInWithCredential(credential);
    isLoggedIn.value = true;
    Get.offAll(() => HomePage());  // Navigate to HomePage if OTP is valid
  }

  // Logout method
  Future<void> logout() async {
    await _auth.signOut();
    isLoggedIn.value = false;
    Get.offAll(() => LogInPage());  // Navigate to LogInPage after logout
  }
}