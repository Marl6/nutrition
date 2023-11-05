// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'formulas.dart';

class UserData {
  String? userName;
  String? userAddress;
  int? userAge;
  String? userGender;
  int? userHeightFeet;
  int? userHeightInches;
  double? userWeight;
  int? selectedPhysicalActivityLevel;

  UserData({
    this.userName,
    this.userAddress,
    this.userAge,
    this.userGender,
    this.userHeightFeet,
    this.userHeightInches,
    this.userWeight,
    this.selectedPhysicalActivityLevel,
  });
}

class PersonalInfoForm extends StatefulWidget {
  @override
  _PersonalInfoFormState createState() => _PersonalInfoFormState();
}

class _PersonalInfoFormState extends State<PersonalInfoForm> {
  String? userName;
  String? userAddress;
  int? userAge;
  String? userGender;
  int? userHeightFeet;
  int? userHeightInches;
  double? userWeight;
  int? selectedPhysicalActivityLevel;

  List<String> genderOptions = ['Male', 'Female'];
  List<int> physicalActivityLevel = [30, 35, 40, 45];

  void _handleSubmit() {
    UserData userData = UserData(
      userName: userName,
      userAddress: userAddress,
      userAge: userAge,
      userGender: userGender,
      userHeightFeet: userHeightFeet,
      userHeightInches: userHeightInches,
      userWeight: userWeight,
      selectedPhysicalActivityLevel: selectedPhysicalActivityLevel,
    );

    // Navigate to another file and pass userData
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AnotherScreen(userData: userData)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Health Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              onChanged: (value) {
                setState(() {
                  userName = value;
                });
              },
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  userAddress = value;
                });
              },
              decoration: const InputDecoration(labelText: 'Address'),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  userAge = int.tryParse(value);
                });
              },
              decoration: const InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            DropdownButton<String>(
              value: userGender,
              onChanged: (value) {
                setState(() {
                  userGender = value;
                });
              },
              hint: const Text('Select Gender'),
              items: genderOptions
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      ))
                  .toList(),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        userHeightFeet = int.tryParse(value);
                      });
                    },
                    decoration:
                        const InputDecoration(labelText: 'Height (Feet)'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        userHeightInches = int.tryParse(value);
                      });
                    },
                    decoration:
                        const InputDecoration(labelText: 'Height (Inches)'),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  userWeight = double.tryParse(value);
                });
              },
              decoration: const InputDecoration(labelText: 'Weight (kg)'),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            Padding(padding: EdgeInsets.all(15.0)),
            const Divider(),
            // Table added below weight input field
            Table(
              border: TableBorder.all(),
              children: [
                TableRow(children: [
                  TableCell(
                      child: Center(
                          child: Padding(
                    padding:
                        EdgeInsets.all(8.0), // Adjust the padding as needed
                    child: Text(
                      'Activity Level || Category || Work Intensity',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ))),
                  TableCell(
                      child: Center(
                          child: Padding(
                    padding:
                        EdgeInsets.all(8.0), // Adjust the padding as needed
                    child: Text(
                      'Sample Occupational Activities',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ))),
                  TableCell(
                      child: Center(
                          child: Padding(
                    padding:
                        EdgeInsets.all(8.0), // Adjust the padding as needed
                    child: Text(
                      'kcal/kg body weight^2',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ))),
                ]),
                TableRow(children: [
                  TableCell(
                      child: Center(
                          child: Padding(
                    padding:
                        EdgeInsets.all(8.0), // Adjust the padding as needed
                    child: Text(
                      'Sedentary',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ))),
                  TableCell(
                      child: Center(
                          child: Padding(
                    padding:
                        EdgeInsets.all(8.0), // Adjust the padding as needed
                    child: Text('Mostly resting with little or no activity'),
                  ))),
                  TableCell(
                      child: Center(
                          child: Padding(
                    padding:
                        EdgeInsets.all(8.0), // Adjust the padding as needed
                    child: Text('30'),
                  ))),
                ]),
                TableRow(children: [
                  TableCell(
                      child: Center(
                          child: Padding(
                    padding:
                        EdgeInsets.all(8.0), // Adjust the padding as needed
                    child: Text(
                      'Light',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ))),
                  TableCell(
                      child: Center(
                          child: Padding(
                    padding:
                        EdgeInsets.all(8.0), // Adjust the padding as needed
                    child: Text(
                      'Occupations that require minimal movement, mostly sitting/desk work or standing for long hours and/or with occasional walking (professional, clerical, technical workers, administrative and managerial staff, driving light vehicles (cars, jeepney). Housewives with light housework (dishwashing, preparing food))  ',
                      style: TextStyle(
                        height: 1.5,
                      ),
                    ),
                  ))),
                  TableCell(
                      child: Center(
                          child: Padding(
                    padding:
                        EdgeInsets.all(8.0), // Adjust the padding as needed
                    child: Text('35'),
                  ))),
                ]),
                TableRow(children: [
                  TableCell(
                      child: Center(
                          child: Padding(
                    padding:
                        EdgeInsets.all(8.0), // Adjust the padding as needed
                    child: Text(
                      'Moderate',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ))),
                  TableCell(
                      child: Center(
                          child: Padding(
                    padding:
                        EdgeInsets.all(8.0), // Adjust the padding as needed
                    child: Text(
                      'Occupations that require extended periods of walking, pushing or pulling or lifting or carrying heavy objects (cleaning/domestic services, waiting table, homebuilding task, farming, patient care)',
                      style: TextStyle(
                        height: 1.5,
                      ),
                    ),
                  ))),
                  TableCell(
                      child: Center(
                          child: Padding(
                    padding:
                        EdgeInsets.all(8.0), // Adjust the padding as needed
                    child: Text('40'),
                  ))),
                ]),
                TableRow(children: [
                  TableCell(
                      child: Center(
                          child: Padding(
                    padding:
                        EdgeInsets.all(8.0), // Adjust the padding as needed
                    child: Text(
                      'Very Active or Vigorous',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ))),
                  TableCell(
                      child: Center(
                          child: Padding(
                    padding:
                        EdgeInsets.all(8.0), // Adjust the padding as needed
                    child: Text(
                      'Occupations that require etensive periods of running, rapid movement, pushing or pulling heavy objects or tasks frequently requiring strenuous effort and extensive total body movements (teaching a class or skill requiring active and strenuous participation, such as aerobics or physical education instructor; firefighting; masonry and heavy construction work; coal mining; manually shoveling, using heavy non-powered tools)',
                      style: TextStyle(
                        height: 1.5,
                      ),
                    ),
                  ))),
                  TableCell(
                      child: Center(
                          child: Padding(
                    padding:
                        EdgeInsets.all(8.0), // Adjust the padding as needed
                    child: Text('45'),
                  ))),
                ]),
              ],
            ),
            DropdownButton<int>(
              value: selectedPhysicalActivityLevel,
              onChanged: (value) {
                setState(() {
                  selectedPhysicalActivityLevel = value;
                });
              },
              hint: const Text('Select Physical Activity Level'),
              items: physicalActivityLevel
                  .map((item) => DropdownMenuItem<int>(
                        value: item,
                        child: Text(item
                            .toString()), // Convert int to string for display
                      ))
                  .toList(),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleSubmit,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class AnotherScreen extends StatelessWidget {
  final UserData userData;

  AnotherScreen({required this.userData});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('Your Results'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'DBW'), // First tab
              Tab(text: 'TER'), // Second tab
              Tab(text: 'Nutrient Requirements'), // Third tab
              Tab(text: 'Table'), // Fourth tab
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                Padding(padding: EdgeInsets.all(16.0)),
                Text(
                  'Desirable Body Weight', // Title
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.all(32.0)),
                      Text(
                        'DBW using TannHauser Method: ' +
                            dbwTannHauser(userData.userHeightFeet,
                                    userData.userHeightInches)
                                .toStringAsFixed(2) +
                            ' Kg',
                        style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const Divider(),
                      Padding(padding: EdgeInsets.all(32.0)),
                      Text(
                        'DBW using Hamwi Method: ' +
                            dbwHamwiMethod(
                                    userData.userHeightFeet,
                                    userData.userHeightInches,
                                    userData.userGender)
                                .toStringAsFixed(2) +
                            ' Kg',
                        style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const Divider(),
                      Padding(padding: EdgeInsets.all(32.0)),
                      Text(
                        'DBW using BMI Method: ' +
                            dbwBMI(
                              userData.userHeightFeet,
                              userData.userHeightInches,
                            ).toStringAsFixed(2) +
                            ' Kg',
                        style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const Divider(),
                    ],
                  ),
                ),
              ],
            ),

            // Widget for the 'TER' tab
            Column(
              children: [
                Padding(padding: EdgeInsets.all(16.0)),
                Text(
                  'Total Energy Requirement', // Title
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.all(32.0)),
                      Text(
                        'TER based on PAL: ' +
                            terBasedOnPAL(
                                    userData.userHeightFeet,
                                    userData.userHeightInches,
                                    userData.selectedPhysicalActivityLevel)
                                .toStringAsFixed(2) +
                            ' kcal',
                        style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const Divider(),
                      Padding(padding: EdgeInsets.all(32.0)),
                      Text(
                        'BMR using Harris-Benedict Equation: ' +
                            bmrHarrisBenedictEquation(
                                    userData.userHeightFeet,
                                    userData.userHeightInches,
                                    userData.userAge,
                                    userData.userGender,
                                    userData.userWeight)
                                .toStringAsFixed(2) +
                            ' kcal',
                        style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const Divider(),
                      Padding(padding: EdgeInsets.all(32.0)),
                      Text(
                        'DBW using Mifflin-St Jeor Equation: ' +
                            bmrMifflinStJeorEquation(
                                    userData.userHeightFeet,
                                    userData.userHeightInches,
                                    userData.userAge,
                                    userData.userGender,
                                    userData.userWeight)
                                .toStringAsFixed(2) +
                            ' kcal',
                        style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const Divider(),
                      Padding(padding: EdgeInsets.all(32.0)),
                      Text(
                        'DBW using Oxford Equations: ' +
                            oxfordEquations(
                              userData.userHeightFeet,
                              userData.userHeightInches,
                              userData.userGender,
                              userData.userAge,
                            ).toStringAsFixed(2) +
                            ' kcal',
                        style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const Divider(),
                    ],
                  ),
                ),
              ],
            ),
            // Widget for the 'Nutrient Requirements' tab
            Center(
              child: Text('Content for Nutrient Requirements tab'),
            ),
            // Widget for the 'Table' tab
            Center(
              child: Text('Content for Table tab'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: PersonalInfoForm()));
