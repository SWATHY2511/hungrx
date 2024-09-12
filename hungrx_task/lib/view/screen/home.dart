import 'package:flutter/material.dart';
import 'package:hungrx_task/utilities/colors.dart';
import 'package:hungrx_task/utilities/const.dart';
import 'package:hungrx_task/utilities/text_style.dart';
import 'package:hungrx_task/utilities/widgets/backGroundWid.dart';
import 'package:hungrx_task/utilities/widgets/login_button.dart';
import 'package:hungrx_task/utilities/widgets/textFormField.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _selectedValue;
  String? _selectedGender;
  String _tdee = ''; // Variable to store TDEE result

  // Define the items for the DropdownButton
  List<DropdownMenuItem<String>> items = [
    DropdownMenuItem(
      value: 'item1',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(level1, style: AppTextStyle.dropDownHeadertext),
          Text('Item 1 Description', style: AppTextStyle.dropDowntext),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 'item2',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(level2, style: AppTextStyle.dropDownHeadertext),
          Text('Item 2 Description', style: AppTextStyle.dropDowntext),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 'item3',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(level3, style: AppTextStyle.dropDownHeadertext),
          Text('Item 3 Description', style: AppTextStyle.dropDowntext),
        ],
      ),
    ),
    DropdownMenuItem(
      value: 'item4',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(level4, style: AppTextStyle.dropDownHeadertext),
          Text('Item 4 Description', style: AppTextStyle.dropDowntext),
        ],
      ),
    ),
  ];

  // Define the onChanged callback for dropdown
  void onChanged(String? value) {
    setState(() {
      _selectedValue = value;
    });
    print('Selected value: $value');
  }

  // Define the onChanged callback for gender selection
  void onGenderChanged(String? value) {
    setState(() {
      _selectedGender = value;
    });
    print('Selected gender: $value');
  }

  // Placeholder method to calculate TDEE
  void calculateTDEE() {
    // Implement your TDEE calculation logic here
    setState(() {
      _tdee = '2000 kcal'; // Example placeholder result
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Ensure backGroundWid is not covering the entire screen.
            // Temporary color added for visibility debugging
            Container(
              color: Colors.transparent, // Ensure background is transparent or has no solid color
              child: backGroundWid(context),
            ),
            Center(
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
                    padding: EdgeInsets.only(
                        top: size.height * 0.1, bottom: size.height * 0.15),
                    child: const Text(calculate,
                        style: AppTextStyle.headertextwhite),
                  ),
                  Container(
                    height: size.height * 0.038,
                    width: size.width * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      color: Colors.white, // Changed to ensure dropdown is visible
                      border: Border.all(color: Colors.grey), // Added border for better visibility
                    ),
                    child: DropdownButton<String>(
                      value: _selectedValue,
                      hint: Text(
                        'Select activity level',
                        style: AppTextStyle.dropDownHeadertext.copyWith(color: shadowblack),
                      ),
                      items: items,
                      onChanged: onChanged,
                      icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
                      iconSize: 24,
                      iconEnabledColor: Colors.grey,
                      iconDisabledColor: Colors.grey,
                      alignment: AlignmentDirectional.centerEnd,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Gender Selection in Row
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Radio<String>(
                              value: 'male',
                              groupValue: _selectedGender,
                              onChanged: onGenderChanged,
                              activeColor: white,
                            ),
                            const Text(
                              'Male',
                              style: AppTextStyle.hintTxt,
                            ),
                          ],
                        ),
                        const SizedBox(width: 40), // Spacing between the options
                        Row(
                          children: [
                            Radio<String>(
                              value: 'female',
                              groupValue: _selectedGender,
                              onChanged: onGenderChanged,
                              activeColor: white,
                            ),
                            const Text('Female', style: AppTextStyle.hintTxt),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        authTextForm(context, text: "Feet", legnth: 0.3),
                        authTextForm(context, text: "Inch", legnth: 0.3),
                      ],
                    ),
                  ),
                  authTextForm(context, text: "Weight"),
                  authTextForm(context, text: "Age"),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: button(
                      context,
                      label: "Calculate TDEE",
                      onPressed: calculateTDEE,
                    ),
                  ),
                  Text("The estimated TDEE",style: AppTextStyle.tdeeTxt,),
                  Text('Calories/day',style: AppTextStyle.tdeeValue,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
