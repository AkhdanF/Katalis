import 'package:flutter/material.dart';
import 'package:katalis2/widgets/bottom_navigation_bar.dart';
import 'home_screen.dart';
import 'keuangan_screen.dart';
import 'operasi_screen.dart';
import 'komunitas_screen.dart';
import 'profile_screen.dart';

class MainScreen extends StatefulWidget {
  final String username;

  const MainScreen({super.key, required this.username});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(username: ''),
    const KeuanganScreen(),
    const OperasiScreen(),
    const KomunitasScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Update HomeScreen dengan username yang diterima
    _screens[0] = HomeScreen(username: widget.username);

    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}