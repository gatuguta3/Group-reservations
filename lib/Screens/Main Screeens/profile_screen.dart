import 'package:flutter/material.dart';
import 'package:group_reservations/Config/themes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarycolor,
      ),
      body: Column(
        children: [
          OutlinedButton(
              onPressed: () {       },
              child: Text("View all Reservations", style: TextStyle(color: Colors.black , fontWeight: FontWeight.w300),),
          ),
          SizedBox(height: 20),
          OutlinedButton(
              onPressed: () {       },
              child: Text("View all Policies & claims", style: TextStyle(color: Colors.black , fontWeight: FontWeight.w300),),
          ),
        ],
      ),
    );
  }
}