// ignore_for_file: prefer_const_constructors
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:group_reservations/Config/themes.dart';
import 'package:group_reservations/Screens/Group%20Reservation%20Screens/explore_screen.dart';
import 'package:group_reservations/Screens/Group%20Reservation%20Screens/home_screen.dart';
import 'package:group_reservations/Screens/Main%20Screeens/profile_screen.dart';
import 'package:group_reservations/Screens/Main%20Screeens/wallet_screen.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {


  int _currentIndex = 0;
  final screens=[
    const HomeScreen(),
    const ExploreScreen(),
    const WalletScreen(),
    const ProfileScreen()   
  ];


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
       icon: Image.asset('icons/Vector.png', width: 24, height: 24 ,   color:  _currentIndex == 0 ?orangecolor : null,),
      label: _currentIndex == 0 ? 'Home' : '',
    ),
    BottomNavigationBarItem(
      icon: Image.asset('icons/Vector2.png', width: 24, height: 24,   color:  _currentIndex == 1 ?orangecolor : null,),
      label: _currentIndex == 1 ? 'Discover' : '',
    ),
    BottomNavigationBarItem(
      icon: Image.asset('icons/Vector3.png', width: 24, height: 24 ,   color:  _currentIndex == 2 ?orangecolor : null,),
      label: _currentIndex == 2 ? 'wallet' : '',
    ),
    BottomNavigationBarItem(
      icon: Image.asset('icons/Vector4.png', width: 24, height: 24 ,   color:  _currentIndex == 3 ?orangecolor : null,) ,
      label: _currentIndex == 3 ? 'Profile' : '',
    ),
  ],
),
        
      )
    );
  
  }
}