import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
   
  const CustomBottomNavigationBar({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.white,
      backgroundColor: const Color.fromARGB(255, 77, 85, 123),
      unselectedItemColor: Colors.white54,
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month_outlined),
          label: 'Calendar'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.api_sharp),
          label: 'Graphics'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_rounded),
          label: 'Users'
        ),
      ],
    );
  }
}