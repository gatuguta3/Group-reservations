// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_brace_in_string_interps, unnecessary_string_interpolations, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:group_reservations/Components/themes.dart';

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
        backgroundColor: primarycolor,
      ),
      body: Column(
        
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
           SizedBox(height: 10,),

        ],
      ),
    );
  }
}