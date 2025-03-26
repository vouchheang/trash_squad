import 'package:flutter/material.dart';
import 'package:trash_squad/screens/history.dart';
import 'package:trash_squad/screens/home.dart';
import 'package:trash_squad/screens/profile.dart';
import 'package:trash_squad/screens/social.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    HistoryWidget(),
    SocialWidget(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Container(
      //   child: _widgetOptions.elementAt(_selectedIndex),
      // ),
      body: Stack(
        children: List.generate(_widgetOptions.length, (index) {
          return Offstage(
            offstage: _selectedIndex != index,
            child: _widgetOptions[index],
          );
        }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF086C74),
        unselectedItemColor: const Color(0xFF086C74),
        selectedItemColor: const Color(0xFF5BB59B),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Pickup History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Green Social',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
