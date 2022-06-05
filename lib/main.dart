import 'package:flutter/material.dart';
import 'package:togla_pratik/Screens/home.dart';
import 'package:togla_pratik/Screens/profile.dart';
import 'package:togla_pratik/Screens/search.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;
  List<Widget> Pages = [
    home(),
    Search(),
    UserProfile()
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Benzeri Bişey',
      home: Scaffold(
        body: Pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          //showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedLabelStyle: TextStyle(
           decorationStyle: TextDecorationStyle.dashed,
           decorationThickness: 2.85,
           decoration: TextDecoration.underline, 
          ),
          fixedColor: Colors.brown,
          unselectedItemColor: Color.fromARGB(219, 211, 198, 198),           elevation: 20,
          iconSize: 34,
          type: BottomNavigationBarType.fixed,
          unselectedFontSize: 10,
          selectedFontSize: 15,
          backgroundColor: Colors.orange,
          unselectedIconTheme: IconThemeData(size: 25),
          selectedIconTheme: IconThemeData(size: 40),
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {

            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "HOME"),
            BottomNavigationBarItem(icon: Icon(Icons.search_rounded), label: "SEARCH"),
            BottomNavigationBarItem(icon: Icon(Icons.person_pin), label: "PROFILE"),
          ]
        ),
      ),
    );
  }
}