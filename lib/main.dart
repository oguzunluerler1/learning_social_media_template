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
      title: 'Material App',
      home: Scaffold(
        body: Pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          fixedColor: Colors.brown,
          unselectedItemColor: Color.fromARGB(219, 168, 143, 143),
          elevation: 8,
          iconSize: 34,
          type: BottomNavigationBarType.fixed,
          unselectedFontSize: 10,
          selectedFontSize: 13,
          unselectedIconTheme: IconThemeData(size: 25),
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {

            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "SEARCH"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "PROFILE"),
          ]
        ),
      ),
    );
  }
}