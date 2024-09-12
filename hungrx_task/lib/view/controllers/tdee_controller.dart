import 'package:get/get.dart';

class TDEEController extends GetxController {
  var selectedValue = ''.obs;
  var selectedGender = ''.obs;
  var feet = ''.obs;
  var inch = ''.obs;
  var weight = ''.obs;
  var age = ''.obs;
  var tdee = ''.obs;

  void updateSelectedValue(String value) {
    selectedValue.value = value;
  }

  void updateSelectedGender(String value) {
    selectedGender.value = value;
  }

  void updateFeet(String value) {
    feet.value = value;
  }

  void updateInch(String value) {
    inch.value = value;
  }

  void updateWeight(String value) {
    weight.value = value;
  }

  void updateAge(String value) {
    age.value = value;
  }

  void calculateTDEE() {
    double height = (double.parse(feet.value) * 12) + double.parse(inch.value);
    double weightValue = double.parse(weight.value);
    int ageValue = int.parse(age.value);

    double bmr = 10 * weightValue + 6.25 * height - 5 * ageValue + (selectedGender.value == 'male' ? 5 : -161);
    double activityFactor = 1.2; 

    if (selectedValue.value == 'item1') activityFactor = 1.2;
    if (selectedValue.value == 'item2') activityFactor = 1.375;
    if (selectedValue.value == 'item3') activityFactor = 1.55;
    if (selectedValue.value == 'item4') activityFactor = 1.725;

    tdee.value = (bmr * activityFactor).toStringAsFixed(2);
  }
}
