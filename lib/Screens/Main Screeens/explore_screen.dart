// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:group_reservations/Components/themes.dart';
import 'package:group_reservations/Constants/colors.dart';
import 'package:group_reservations/Screens/chamas_screens/chama_ui_screen.dart';
import 'package:group_reservations/Screens/experiences_screens/experience_ui_screen.dart';
import 'package:group_reservations/Screens/fundraisers_screens/fundraisers_ui_screen.dart';
import 'package:group_reservations/Screens/membership_screens/membership_ui_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 4, 
    child: Scaffold(
      appBar: AppBar(
backgroundColor: AppColors.primarycolor,
title: Row(
children: [
GestureDetector(
onTap: () {},
child: Image.asset('icons/Frame36.png', width: 40, height: 40),
),
const SizedBox(width: 30),
Text(
'Explore',
style: TextStyle(fontSize: 21, color: Colors.white),
),
],
),
bottom: PreferredSize(
preferredSize: Size.fromHeight(90.0),
child: Container(
color: AppColors.orangecolor,
height: 80,
child: TabBar(
isScrollable: true,
tabs: [
Tab(
child: Container(
color: AppColors.orangecolor,
height: 80,
width: 80, // Increase height here if needed
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Image.asset('icons/upload-line.png',width: 20, height: 20, ),

Text('Membership' , style: TextStyle(fontSize: 11),),
],
),
),
),
Tab(
child: Container(
color: AppColors.orangecolor,
height: 80,
width: 80, // Increase height here if needed
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Image.asset('icons/diversity_3_FILL0_wght400_GRAD0_opsz48 2.png',width: 20, height: 20, ),

Text('Chamas' , style: TextStyle(fontSize: 11),),
],
),
),
),
Tab(
child: Container(
color: AppColors.orangecolor,
height: 80,
width: 80, // Increase height here if needed
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Image.asset('icons/Group.png',width: 20, height: 20, ),

Text('Fundraisers' , style: TextStyle(fontSize: 11),),
],
),
),
),
Tab(
child: Container(
color: AppColors.orangecolor,
height: 80,
width: 80, // Increase height here if needed
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Image.asset('icons/handshake.png',width: 20, height: 20, ),

Text('Experiences' , style: TextStyle(fontSize: 11),),
],
),
),
),
],
indicatorColor: Colors.red,
labelColor: Colors.white,
unselectedLabelColor: Colors.black,
labelPadding: EdgeInsets.symmetric(horizontal: 4.0),
),
),
),
),

body: TabBarView(
  children: [

    MembershipUiScreen(),
    ChamaUiScreen(),
    FundraisersUiScreen(),
    ExperienceUiScreen(),

  ]),

    ));
  }
}