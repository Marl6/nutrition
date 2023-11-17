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
  int? selectedCarbohydrateRequirement;
  int? selectedProteinRequirement;
  int? selectedFatRequirement;

  UserData(
      {this.userName,
      this.userAddress,
      this.userAge,
      this.userGender,
      this.userHeightFeet,
      this.userHeightInches,
      this.userWeight,
      this.selectedPhysicalActivityLevel,
      this.selectedCarbohydrateRequirement,
      this.selectedProteinRequirement,
      this.selectedFatRequirement});
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
  int? selectedCarbohydrateRequirement;
  int? selectedProteinRequirement;
  int? selectedFatRequirement;

  List<String> genderOptions = ['Male', 'Female'];
  List<int> physicalActivityLevel = [30, 35, 40, 45];
  List<int> listCarbohydrateRequirement =
      List.generate(31, (index) => 45 + index);
  List<int> listProteinRequirement = List.generate(11, (index) => 5 + index);
  List<int> listFatRequirement = List.generate(26, (index) => 5 + index);

  void _handleSubmit() {
    int totalValue = (selectedCarbohydrateRequirement ?? 0) +
        (selectedProteinRequirement ?? 0) +
        (selectedFatRequirement ?? 0);

    if (totalValue == 100) {
      // Total value is 100, proceed with creating UserData and navigate to AnotherScreen
      UserData userData = UserData(
        userName: userName,
        userAddress: userAddress,
        userAge: userAge,
        userGender: userGender,
        userHeightFeet: userHeightFeet,
        userHeightInches: userHeightInches,
        userWeight: userWeight,
        selectedPhysicalActivityLevel: selectedPhysicalActivityLevel,
        selectedCarbohydrateRequirement: selectedCarbohydrateRequirement,
        selectedProteinRequirement: selectedProteinRequirement,
        selectedFatRequirement: selectedFatRequirement,
      );

      // Navigate to AnotherScreen and pass userData
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AnotherScreen(userData: userData),
        ),
      );
    } else {
      // Total value is not 100, show an error dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Macronutrient Distribution Error'),
            content: Text('The total value must be 100%'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Health Information'),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
              const Divider(),
              SizedBox(
                width:
                    300, // Set a specific width or use double.infinity for maximum width
                child: DropdownButton<int>(
                  value: selectedCarbohydrateRequirement,
                  onChanged: (value) {
                    setState(() {
                      selectedCarbohydrateRequirement = value;
                    });
                  },
                  hint: const Text('% of TER for Carbohydrates'),
                  isExpanded:
                      true, // Ensure the dropdown expands to fill available width
                  items: listCarbohydrateRequirement
                      .map((item) => DropdownMenuItem<int>(
                            value: item,
                            child: Text(item.toString()),
                          ))
                      .toList(),
                ),
              ),
              SizedBox(
                width:
                    300, // Set a specific width or use double.infinity for maximum width
                child: DropdownButton<int>(
                  value: selectedProteinRequirement,
                  onChanged: (value) {
                    setState(() {
                      selectedProteinRequirement = value;
                    });
                  },
                  hint: const Text('% of TER for Protein'),
                  isExpanded:
                      true, // Ensure the dropdown expands to fill available width
                  items: listProteinRequirement
                      .map((item) => DropdownMenuItem<int>(
                            value: item,
                            child: Text(item.toString()),
                          ))
                      .toList(),
                ),
              ),
              SizedBox(
                width:
                    300, // Set a specific width or use double.infinity for maximum width
                child: DropdownButton<int>(
                  value: selectedFatRequirement,
                  onChanged: (value) {
                    setState(() {
                      selectedFatRequirement = value;
                    });
                  },
                  hint: const Text('% of TER for Fat'),
                  isExpanded:
                      true, // Ensure the dropdown expands to fill available width
                  items: listFatRequirement
                      .map((item) => DropdownMenuItem<int>(
                            value: item,
                            child: Text(item.toString()),
                          ))
                      .toList(),
                ),
              ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _handleSubmit,
                child: Text('Submit'),
              ),
            ],
          ),
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
              Tab(text: 'Diet Prescription'), // Third tab
              Tab(text: 'Translating Diet Prescription'), // Fourth tab
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
                      Padding(padding: EdgeInsets.all(32.0)),
                      Text(
                        'DBW x PAL: ' +
                            bmrxPAL(
                                    userData.userHeightFeet,
                                    userData.userHeightInches,
                                    userData.userGender,
                                    userData.userAge,
                                    userData.selectedPhysicalActivityLevel,
                                    userData.userWeight)
                                .toStringAsFixed(2) +
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
            Column(
              children: [
                Padding(padding: EdgeInsets.all(16.0)),
                Text(
                  'Diet Prescription', // Title
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
                        amountMacronutrients(
                            userData.userHeightFeet,
                            userData.userHeightInches,
                            userData.userGender,
                            userData.userAge,
                            userData.selectedPhysicalActivityLevel,
                            userData.userWeight,
                            userData.selectedCarbohydrateRequirement,
                            userData.selectedProteinRequirement,
                            userData.selectedFatRequirement),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(padding: EdgeInsets.all(32.0)),
                      const Divider(),
                    ],
                  ),
                ),
              ],
            ),
            // Widget for the 'Table' tab
            Center(
              child: Text('Content for Diet Pres chuchu tab'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: PersonalInfoForm()));
