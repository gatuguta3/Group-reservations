// ignore_for_file: prefer_const_constructors
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:group_reservations/components/themes.dart';
import 'package:group_reservations/constants/colors.dart';
import 'package:group_reservations/screens/Main%20Screeens/explore_screen.dart';
import 'package:group_reservations/screens/Main%20Screeens/home_screen.dart';
import 'package:group_reservations/screens/Main%20Screeens/profile_screen.dart';
import 'package:group_reservations/screens/Main%20Screeens/wallet_screen.dart';


class Homepage extends StatefulWidget {
  final int initialIndex; // Parameter to set the initial index

  const Homepage({super.key, this.initialIndex = 0}); // Default index is 0

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late int _currentIndex; // Current index

  final screens = [
    const HomeScreen(),
    const ExploreScreen(),
    const WalletScreen(),
    const ProfileScreen()
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex; // Set initial index from parameter
  }

  Future<bool> _onWillPop() async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Exit App'),
            content: Text('Do you really want to exit the app?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                  exit(0);
                },
                child: Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,  
          
      child: Scaffold(
        
        body: screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 253, 252, 253),
          selectedItemColor: Colors.orange,
          unselectedItemColor: const Color.fromRGBO(158, 158, 158, 1),
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'icons/Vector.png',
                width: 24,
                height: 24,
                color: _currentIndex == 0 ? AppColors.secondary : null,
              ),
              label: _currentIndex == 0 ? 'Home' : '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'icons/Vector2.png',
                width: 24,
                height: 24,
                color: _currentIndex == 1 ? AppColors.secondary : null,
              ),
              label: _currentIndex == 1 ? 'Discover' : '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'icons/Vector3.png',
                width: 24,
                height: 24,
                color: _currentIndex == 2 ? AppColors.secondary : null,
              ),
              label: _currentIndex == 2 ? 'Wallet' : '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'icons/Vector4.png',
                width: 24,
                height: 24,
                color: _currentIndex == 3 ? AppColors.secondary : null,
              ),
              label: _currentIndex == 3 ? 'Profile' : '',
            ),
          ],
        ),
      ),
    );
  }
}