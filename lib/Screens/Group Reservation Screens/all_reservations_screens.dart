import 'package:flutter/material.dart';
import 'package:group_reservations/Config/themes.dart';

class AllReservationsScreens extends StatefulWidget {
  const AllReservationsScreens({super.key});

  @override
  State<AllReservationsScreens> createState() => _AllReservationsScreensState();
}

class _AllReservationsScreensState extends State<AllReservationsScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: primarycolor,
          title: Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Image.asset('icons/Frame36.png', width: 40, height: 40),
              ),
              const SizedBox(width: 30),
              Text('Reservations',style: TextStyle(fontSize: 21, color: Colors.white),
              ),
            ],
          ),)
    );
  }
}