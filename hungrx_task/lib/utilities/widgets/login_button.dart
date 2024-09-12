import 'package:flutter/material.dart';
import 'package:hungrx_task/utilities/colors.dart';
import 'package:hungrx_task/utilities/text_style.dart';

Widget button(context,{String? label,onPressed}) {
  Size size = MediaQuery.of(context).size;

  return Container(
    width: size.width * 0.5, // 50% of screen width
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: yellowBG), // Set button color to red
      onPressed: onPressed,
      child: Text(
        label!,
        style: AppTextStyle.buttontext,
      ),
    ),
  );
}