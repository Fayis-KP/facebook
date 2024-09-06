import 'package:facebook/screens/explore.dart';
import 'package:facebook/screens/home.dart';
import 'package:facebook/screens/people.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int selectedIndex = 0;
  List<Widget> pages() {
    return [Home(), People(), Explore()];
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set the background color of the app to black
      body: pages()[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        backgroundColor: Colors.black, // Set the background color of the BottomNavigationBar to black
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: "",
            backgroundColor: Colors.black, // Set each tab's background to black
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: "",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: "",
            backgroundColor: Colors.black,
          ),
        ],
        selectedItemColor: Colors.white, // Change the selected item color to white
        unselectedItemColor: Colors.grey, // Keep the unselected items grey
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
