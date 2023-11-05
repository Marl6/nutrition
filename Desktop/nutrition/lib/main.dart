// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:side_navigation/side_navigation.dart';
import 'userinform.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: const MainView(),
    ),
  );
}

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  /// The currently selected index of the bar
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideNavigationBar(
            selectedIndex: selectedIndex,
            items: const [
              SideNavigationBarItem(
                icon: Icons.person,
                label: 'Account',
              ),
              SideNavigationBarItem(
                icon: Icons.health_and_safety_sharp,
                label: 'Health Information',
              ),
              SideNavigationBarItem(
                icon: Icons.health_and_safety,
                label: 'Nutrition Calculator',
              ),
              SideNavigationBarItem(
                icon: Icons.settings,
                label: 'Settings',
              ),
            ],
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          Expanded(
            child: selectedIndex == 0
                ? Padding(
                    padding: EdgeInsets.all(16.0),
                    child: PersonalInfoForm(),
                  )
                : selectedIndex == 1
                    ? Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                                'Content for index 1'), // Replace this line with your content
                            SizedBox(height: 10), // Add some spacing if needed
                            Text(
                                'More content for index 1'), // Replace this line with more content
                          ],
                        ),
                      )
                    : selectedIndex == 2
                        ? Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text('Content for index 2'),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text('Content for index 3'),
                          ),
          ),
        ],
      ),
    );
  }
}
