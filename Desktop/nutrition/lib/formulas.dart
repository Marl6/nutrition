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
