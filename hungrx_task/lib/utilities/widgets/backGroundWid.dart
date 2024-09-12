import 'package:flutter/material.dart';
import 'package:hungrx_task/utilities/colors.dart';
import 'package:hungrx_task/utilities/imagepath.dart';

Widget backGroundWid(context) {
  Size size = MediaQuery.of(context).size;
  return Container(
      color: yellowBG,
      height: size.height * 1,
      width: size.width * 1,
      child: Align(alignment: Alignment.bottomRight
      , child: Padding(
        padding:  EdgeInsets.only(left: size.width*0.05),
        child: const Image(image:  AssetImage(bgImag),),
      )));
}
