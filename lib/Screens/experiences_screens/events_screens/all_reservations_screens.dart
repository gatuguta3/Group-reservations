import 'package:flutter/material.dart';
import 'package:group_reservations/Components/themes.dart';
import 'package:group_reservations/Screens/Main%20Screeens/homepage.dart';

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
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                   Navigator.pushAndRemoveUntil(   context,  MaterialPageRoute( builder: (context) => Homepage(initialIndex: 3), ), (route) => false,    );
                   
                },
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