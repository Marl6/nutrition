// ignore_for_file: avoid_print, unused_local_variable

double dbwTannHauser(int? feet, int? inches) {
  // Perform the necessary calculations here and return the result
  // For example:
  print('Feet: $feet, Inches: $inches');
  double heightInCm = (feet ?? 0) * 30.48 + (inches ?? 0) * 2.54;
  print('Height in cm: $heightInCm');

  double dbw = heightInCm - 100;
  dbw -= 0.1 * (heightInCm - 100);
  print('Desirable Body Weight: $dbw');
  return dbw;
}

double dbwHamwiMethod(int? feet, int? inches, String? gender) {
  const int baseweight = 106;
  const int addOrDeductMale = 6;
  const int addOrDeductFemale = 5;
  double dbw = 0;

  if (feet != null && inches != null && gender != null) {
    if (feet >= 5 && gender.toLowerCase() == "male") {
      dbw = (baseweight + (inches * addOrDeductMale)).toDouble();
    } else if (feet >= 5 && gender.toLowerCase() == "female") {
      dbw = (baseweight + (inches * addOrDeductFemale)).toDouble();
    } else if (feet < 5 && gender.toLowerCase() == "male") {
      int heightToInch = feet * 12 + inches;
      int inchLessThanFiveFoot = 60 - heightToInch;
      dbw = (baseweight - (inchLessThanFiveFoot * addOrDeductMale)).toDouble();
    } else if (feet < 5 && gender.toLowerCase() == "female") {
      int heightToInch = feet * 12 + inches;
      int inchLessThanFiveFoot = 60 - heightToInch;
      dbw =
          (baseweight - (inchLessThanFiveFoot * addOrDeductFemale)).toDouble();
    }
  } else {
    print('error pi');
    dbw = 0;
  }

  return dbw * 0.453592;
}

double dbwBMI(int? feet, int? inches) {
  double dbw = 0;

  if (feet != null && inches != null) {
    double heightToMeter = (((feet * 12) + inches) * 0.0254).toDouble();
    dbw = (heightToMeter * heightToMeter) * 22;
  }
  return dbw;
}

double terBasedOnPAL(
    int? feet, int? inches, int? selectedPhysicalActivityLevel) {
  double dbw = 0;
  if (feet != null && inches != null && selectedPhysicalActivityLevel != null) {
    double heightToMeter = (((feet * 12) + inches) * 0.0254).toDouble();
    dbw = (heightToMeter * heightToMeter) * 22;
    dbw = dbw * selectedPhysicalActivityLevel;
  }
  return dbw;
}

double bmrHarrisBenedictEquation(
    int? feet, int? inches, int? age, String? gender, double? weight) {
  if (feet == null ||
      inches == null ||
      age == null ||
      gender == null ||
      weight == null) {
    // Handle null values as needed, such as throwing an error or returning a default value.
    // For now, I'm returning 0 in case of any null input.
    return 0;
  }

  double bmr = 0;
  double baseForMale = 66.47;
  double baseForFemale = 655.1;

  double feetToInches = (feet * 12) + inches.toDouble();
  double heightInCm = feetToInches * 2.54;

  if (gender.toLowerCase() == "male") {
    bmr = baseForMale + (13.75 * weight) + (5.003 * heightInCm) - (6.755 * age);
  } else {
    bmr =
        baseForFemale + (9.563 * weight) + (1.850 * heightInCm) - (4.676 * age);
  }

  return bmr;
}

double bmrMifflinStJeorEquation(
    int? feet, int? inches, int? age, String? gender, double? weight) {
  if (feet == null ||
      inches == null ||
      age == null ||
      gender == null ||
      weight == null) {
    return 0;
  }
  double bmr = 0;
  double feetToInches = (feet * 12) + inches.toDouble();
  double heightInCm = feetToInches * 2.54;

  if (gender.toLowerCase() == "male") {
    bmr = 9.99 * weight + 6.25 * heightInCm - 4.92 * age + 5;
  } else {
    bmr = bmr = 9.99 * weight + 6.25 * heightInCm - 4.92 * age + 161;
  }

  return bmr;
}

double oxfordEquations(int? feet, int? inches, String? gender, int? age) {
  if (feet == null || inches == null || gender == null || age == null) {
    return 0;
  }
  double bmr = 0;
  double feetToInches = (feet * 12) + inches.toDouble();
  double heightInCm = feetToInches * 2.54;

  if (gender.toLowerCase() == "male" && age >= 18 && age <= 30) {
    bmr = 16.0 * heightInCm + 545;
  } else if (gender.toLowerCase() == "male" && age >= 30 && age <= 60) {
    bmr = 14.2 * heightInCm + 593;
  } else if (gender.toLowerCase() == "male" && age >= 60 && age <= 69) {
    bmr = 13.0 * heightInCm + 567;
  } else if (gender.toLowerCase() == "male" && age >= 70) {
    bmr = 13.7 * heightInCm + 481;
  } else if (gender.toLowerCase() == "female" && age >= 18 && age <= 30) {
    bmr = 13.1 * heightInCm + 558;
  } else if (gender.toLowerCase() == "female" && age >= 30 && age <= 60) {
    bmr = 9.74 * heightInCm + 694;
  } else if (gender.toLowerCase() == "female" && age >= 60 && age <= 69) {
    bmr = 10.2 * heightInCm + 572;
  } else if (gender.toLowerCase() == "female" && age >= 70) {
    bmr = 10.0 * heightInCm + 577;
  } else {
    return 0;
  }
  return bmr;
}

double bmrxPAL(int? feet, int? inches, String? gender, int? age,
    int? selectedPhysicalActivityLevel, double? weight) {
  if (feet == null ||
      inches == null ||
      gender == null ||
      age == null ||
      weight == null) {
    return 0;
  }

  double bmr = 0;
  double feetToInches = (feet * 12) + inches.toDouble();
  double heightInCm = feetToInches * 2.54;

  if (gender.toLowerCase() == "male" && selectedPhysicalActivityLevel == 30) {
    bmr = 9.99 * weight + 6.25 * heightInCm - 4.92 * age + 5;
    bmr = bmr * 1.30;
  } else if (gender.toLowerCase() == "male" &&
      selectedPhysicalActivityLevel == 35) {
    bmr = 9.99 * weight + 6.25 * heightInCm - 4.92 * age + 5;
    bmr = bmr * 1.58;
  } else if (gender.toLowerCase() == "male" &&
      selectedPhysicalActivityLevel == 40) {
    bmr = 9.99 * weight + 6.25 * heightInCm - 4.92 * age + 5;
    bmr = bmr * 1.67;
  } else if (gender.toLowerCase() == "male" &&
      selectedPhysicalActivityLevel == 45) {
    bmr = 9.99 * weight + 6.25 * heightInCm - 4.92 * age + 5;
    bmr = bmr * 1.88;
  } else if (gender.toLowerCase() == "female" &&
      selectedPhysicalActivityLevel == 30) {
    bmr = 9.99 * weight + 6.25 * heightInCm - 4.92 * age - 161;
    bmr = bmr * 1.30;
  } else if (gender.toLowerCase() == "female" &&
      selectedPhysicalActivityLevel == 35) {
    bmr = 9.99 * weight + 6.25 * heightInCm - 4.92 * age - 161;
    bmr = bmr * 1.45;
  } else if (gender.toLowerCase() == "female" &&
      selectedPhysicalActivityLevel == 40) {
    bmr = 9.99 * weight + 6.25 * heightInCm - 4.92 * age - 161;
    bmr = bmr * 1.55;
  } else if (gender.toLowerCase() == "female" &&
      selectedPhysicalActivityLevel == 45) {
    bmr = 9.99 * weight + 6.25 * heightInCm - 4.92 * age - 161;
    bmr = bmr * 1.75;
  } else {
    return 0;
  }
  return bmr;
}

double amountMacronutrients(
    int? feet,
    int? inches,
    String? gender,
    int? age,
    int? selectedPhysicalActivityLevel,
    double? weight,
    int? carbs,
    int? protein,
    int? fats) {
  if (feet == null ||
      inches == null ||
      gender == null ||
      age == null ||
      weight == null ||
      selectedPhysicalActivityLevel == null ||
      carbs == null ||
      protein == null ||
      fats == null) {
    return 0;
  }

  double bmr = 0;
  double feetToInches = (feet * 12) + inches.toDouble();
  double heightInCm = feetToInches * 2.54;
  double carbskcal = carbs / 100;
  double proteinkcal = protein / 100;
  double fatskcal = fats / 100;

  if (gender.toLowerCase() == "male" && selectedPhysicalActivityLevel == 30) {
    bmr = 9.99 * weight + 6.25 * heightInCm - 4.92 * age + 5;
    bmr = bmr * 1.30;
  } else if (gender.toLowerCase() == "male" &&
      selectedPhysicalActivityLevel == 35) {
    bmr = 9.99 * weight + 6.25 * heightInCm - 4.92 * age + 5;
    bmr = bmr * 1.58;
  } else if (gender.toLowerCase() == "male" &&
      selectedPhysicalActivityLevel == 40) {
    bmr = 9.99 * weight + 6.25 * heightInCm - 4.92 * age + 5;
    bmr = bmr * 1.67;
  } else if (gender.toLowerCase() == "male" &&
      selectedPhysicalActivityLevel == 45) {
    bmr = 9.99 * weight + 6.25 * heightInCm - 4.92 * age + 5;
    bmr = bmr * 1.88;
  } else if (gender.toLowerCase() == "female" &&
      selectedPhysicalActivityLevel == 30) {
    bmr = 9.99 * weight + 6.25 * heightInCm - 4.92 * age - 161;
    bmr = bmr * 1.30;
  } else if (gender.toLowerCase() == "female" &&
      selectedPhysicalActivityLevel == 35) {
    bmr = 9.99 * weight + 6.25 * heightInCm - 4.92 * age - 161;
    bmr = bmr * 1.45;
  } else if (gender.toLowerCase() == "female" &&
      selectedPhysicalActivityLevel == 40) {
    bmr = 9.99 * weight + 6.25 * heightInCm - 4.92 * age - 161;
    bmr = bmr * 1.55;
  } else if (gender.toLowerCase() == "female" &&
      selectedPhysicalActivityLevel == 45) {
    bmr = 9.99 * weight + 6.25 * heightInCm - 4.92 * age - 161;
    bmr = bmr * 1.75;
  } else {
    return 0;
  }

  return bmr;
}
