// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_brace_in_string_interps, unnecessary_string_interpolations, non_constant_identifier_names, unused_import

import 'package:flutter/material.dart';
import 'package:group_reservations/components/themes.dart';
import 'package:group_reservations/constants/colors.dart';
import 'package:group_reservations/screens/reservations_screens/all_reservations_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  int userid = 1;
   String name = "Edwin Wafula";
   String phonenumber = "1234567890";
   String email = "Edwin@gmail.com";
   String profile_image_url = 'images/edwin.jpeg';
   //rgba(203, 213, 224, 1)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
        
        crossAxisAlignment: CrossAxisAlignment.center,
        
        children: [
           SizedBox(height: 20),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('${profile_image_url}'),
            ),
            ]
           ),
           SizedBox(height: 10,),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name , style: TextStyle(fontWeight: FontWeight.w600),)
            ]
           ),
           SizedBox(height: 10,),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(email)
            ]
           ),
           SizedBox(height: 10,),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(phonenumber)
            ]
           ),
           SizedBox(height: 10,),
           Divider(thickness: 1,),
           SizedBox(height: 20,),

           ListTile(
            leading: Container(
              width: 50, // Set width
              height: 50, // Set height (equal to width for a circle)
              decoration: BoxDecoration(
                color: AppColors.secondary, // Background color
                shape: BoxShape.circle, // Circular shape
              ),
            ),
           ),

           SizedBox(height: 10,),

           GestureDetector(
            onTap: () {

            },
            child: ListTile(
            leading: Container(
              width: 50, // Set width
              height: 50, // Set height (equal to width for a circle)
              decoration: BoxDecoration(
                color: AppColors.secondary, // Background color
                shape: BoxShape.circle, // Circular shape
              ),
            ),
            title: Text('Reset Pin'),
            trailing: Icon(Icons.keyboard_arrow_right_sharp , color: AppColors.secondary,),
           ),
           ),


           SizedBox(height: 10,),

           GestureDetector(
            onTap: () {

              // navigation to all reservations screen
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AllReservationsScreens()),
            );

            },
            child: ListTile(
            leading: Container(
              width: 50, // Set width
              height: 50, // Set height (equal to width for a circle)
              decoration: BoxDecoration(
                color: AppColors.secondary, // Background color
                shape: BoxShape.circle, // Circular shape
              ),
            ),
            title: Text('Reservations'),
            trailing: Icon(Icons.keyboard_arrow_right_sharp , color: AppColors.secondary,),
           ),
           ),

           SizedBox(height: 10,),

            GestureDetector(
            onTap: () {

            },
            child: ListTile(
            leading: Container(
              width: 50, // Set width
              height: 50, // Set height (equal to width for a circle)
              decoration: BoxDecoration(
                color: AppColors.secondary, // Background color
                shape: BoxShape.circle, // Circular shape
              ),
            ),
            title: Text('Policies'),
            trailing: Icon(Icons.keyboard_arrow_right_sharp , color: AppColors.secondary,),
           ),
           ),



           SizedBox(height: 10,),

            GestureDetector(
            onTap: () {

            },
            child: ListTile(
            leading: Container(
              width: 50, // Set width
              height: 50, // Set height (equal to width for a circle)
              decoration: BoxDecoration(
                color: AppColors.secondary, // Background color
                shape: BoxShape.circle, // Circular shape
              ),
            ),
            title: Text('Contact Support'),
            trailing: Icon(Icons.keyboard_arrow_right_sharp , color: AppColors.secondary,),
           ),
           ),



           SizedBox(height: 10,),

           GestureDetector(
            onTap: () {

            },
            child: ListTile(
            leading: Container(
              width: 50, // Set width
              height: 50, // Set height (equal to width for a circle)
              decoration: BoxDecoration(
                color: AppColors.secondary, // Background color
                shape: BoxShape.circle, // Circular shape
              ),
            ),
            title: Text('Logout'),
            trailing: Icon(Icons.keyboard_arrow_right_sharp , color: AppColors.secondary,),
           ),
           ),




        ],
      ),
    
      ));
  }
}