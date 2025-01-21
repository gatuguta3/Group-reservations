// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
//import 'package:group_reservations/Components/themes.dart';
import 'package:group_reservations/constants/colors.dart';
import 'package:group_reservations/screens/experiences_screens/events_screens/events_list.dart';
import 'package:group_reservations/screens/experiences_screens/goods_screens/goods_list.dart';
import 'package:group_reservations/screens/experiences_screens/insurance_screens/insurance_list.dart';

class ExperienceUiScreen extends StatefulWidget {
  const ExperienceUiScreen({super.key});

  @override
  State<ExperienceUiScreen> createState() => _ExperienceUiScreenState();
}

class _ExperienceUiScreenState extends State<ExperienceUiScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
      children: [
        SizedBox(height: 10,),
        Row(crossAxisAlignment: CrossAxisAlignment.start,children: [SizedBox(width: 5,),Text('Explore the best offers available !')], ),
        DefaultTabController(
      length: 3, // Number of tabs in the nested TabBar
      child: Column(
      children: [
      TabBar(
      tabs: [
      Tab(text: "Events"),
      Tab(text: "Insurance"),
      Tab(text: "Goods"),
      ],
      indicatorColor: AppColors.orangecolor,
      labelColor: AppColors.orangecolor,
      unselectedLabelColor: Colors.black,
      ),
      SizedBox(
      height: MediaQuery.of(context).size.height * 0.8, // Constrain nested TabBarView
      child: TabBarView(
      children: [

        EventsList(),
        InsuranceList(),
        GoodsList(),
      ],
      ),
      ),
      ],
      ),
      )

]
),
    );

  }
}