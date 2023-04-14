import 'package:expense_tracker/Screens/ExpenseScreen.dart';
import 'package:expense_tracker/Screens/LoginScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = <Widget>[ExpenseScreen(), LogInScreen()];

  @override
  void initState() {
    _selectedIndex = 0;
    // bannerService.getBanners();
    super.initState();
  }

  void _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'Expenses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report),
            label: 'Analytics',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
