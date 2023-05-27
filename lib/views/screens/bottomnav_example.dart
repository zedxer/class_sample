import 'package:class_sample/views/screens/student_list_screen.dart';
import 'package:class_sample/views/screens/student_list_screen_v2.dart';
import 'package:class_sample/views/screens/student_list_screen_v3.dart';
import 'package:flutter/material.dart';

import 'listview_with_searching.dart';

/// Flutter code sample for [BottomNavigationBar].

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
   final List<Widget> _widgetOptions = <Widget>[
    const ListViewWithSearchExample(title: "title"),
    StudentListScreenV3(),
    const Text(
      'Index 2: AC',
      style: optionStyle,
    ),
  ];

  void tapped(int a) {
    setState(() {
      _selectedIndex = a;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Student LMS'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_edu),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.black,
        onTap: tapped,
      ),
    );
  }
}
