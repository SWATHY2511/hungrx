import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:hungrx_task/utilities/colors.dart';
import 'package:hungrx_task/utilities/text_style.dart';

Widget authTextForm(BuildContext context, {
  required String text, 
  double legnth = 0.7, 
  TextEditingController? controller,
  view =false
}) {
  Size size = MediaQuery.of(context).size;

  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Container(
      width: size.width * legnth,
      child: TextFormField(
        controller: controller,
        style: AppTextStyle.textfieldTxt,
        obscureText: view,
        decoration: InputDecoration(
          label: Text(text, style: AppTextStyle.hintTxt),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: yellowBG),
            borderRadius: BorderRadius.all(
              Radius.circular(41.3),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget otpTextForm(
  BuildContext context, {
  required String text,
  double legnth = 0.7,
  required Function(String) onChanged, // Add this to handle input changes
  TextEditingController? controller,
  bool view = false,
  TextInputType keyboardType = TextInputType.text, // Make this optional with default value
}) {
  Size size = MediaQuery.of(context).size;

  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Container(
      width: size.width * legnth,
      child: TextFormField(
        controller: controller,
        style: AppTextStyle.textfieldTxt,
        obscureText: view,
        keyboardType: keyboardType,  // This was missing in the earlier version
        onChanged: onChanged,  // Use the onChanged handler
        decoration: InputDecoration(
          label: Text(text, style: AppTextStyle.hintTxt),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: yellowBG),
            borderRadius: BorderRadius.all(
              Radius.circular(41.3),
            ),
          ),
        ),
      ),
    ),
  );
}


Widget tdeeTextForm(
  BuildContext context, {
  required String text,
  double length = 0.7, // Corrected the spelling of 'length'
  TextEditingController? controller,
  bool view = false, // Explicitly typed as bool
  Function(String)? onChanged, // Optional callback for onChanged event
}) {
  Size size = MediaQuery.of(context).size;

  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Container(
      width: size.width * length,
      child: TextFormField(
        controller: controller,
        obscureText: view,
        style: AppTextStyle.textfieldTxt,
        decoration: InputDecoration(
          labelText: text,
          labelStyle: AppTextStyle.hintTxt,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: yellowBG),
            borderRadius: BorderRadius.all(Radius.circular(41.3)),
          ),
        ),
        onChanged: onChanged, // Attach the onChanged callback if provided
      ),
    ),
  );
}
