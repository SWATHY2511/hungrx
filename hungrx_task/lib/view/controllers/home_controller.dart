import 'package:get/get.dart';

class HomeController extends GetxController {
  
  var selectedValue = ''.obs;
  var selectedGender = ''.obs; 
  var feet = ''.obs; 
  var inches = ''.obs; 
  var weight = ''.obs; 
  var age = ''.obs; 

  var tdeeResult = ''.obs;

  void updateSelectedValue(String? value) {
    selectedValue.value = value ?? '';
  }

  void updateSelectedGender(String? value) {
    selectedGender.value = value ?? '';
  }

  void updateFeet(String value) {
    feet.value = value;
  }

  void updateInches(String value) {
    inches.value = value;
  }

  void updateWeight(String value) {
    weight.value = value;
  }

  void updateAge(String value) {
    age.value = value;
  }

  void calculateTDEE() {
    try {
      double heightInInches = (double.parse(feet.value) * 12) + double.parse(inches.value);
      double weightInKg = double.parse(weight.value) * 0.453592; 
      int ageInYears = int.parse(age.value);
      double bmr;

      if (selectedGender.value == 'male') {
        bmr = 10 * weightInKg + 6.25 * heightInInches * 2.54 / 100 - 5 * ageInYears + 5;
      } else {
        bmr = 10 * weightInKg + 6.25 * heightInInches * 2.54 / 100 - 5 * ageInYears - 161;
      }

      double activityFactor;
      switch (selectedValue.value) {
        case 'level1':
          activityFactor = 1.2; 
        case 'level2':
          activityFactor = 1.375; 
          break;
        case 'level3':
          activityFactor = 1.55; 
          break;
        case 'level4':
          activityFactor = 1.725; 
          break;
        default:
          activityFactor = 1.2; 
      }

      double tdee = bmr * activityFactor;
      tdeeResult.value = tdee.toStringAsFixed(2);
    } catch (e) {
      tdeeResult.value = 'Error calculating TDEE';
    }
  }
}
