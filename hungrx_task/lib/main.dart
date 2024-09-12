import 'package:flutter/material.dart';
import 'package:hungrx_task/view/auth/loginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:hungrx_task/view/auth/otpScreen.dart';
import 'package:hungrx_task/view/auth/signupPage.dart';
import 'package:hungrx_task/view/screen/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: 
      LogInPage()
    );
  }
}



