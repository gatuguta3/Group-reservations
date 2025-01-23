import 'package:flutter/material.dart';
import 'package:group_reservations/components/themes.dart';
import 'package:group_reservations/constants/colors.dart';
import 'package:group_reservations/models_demo/reservation_model.dart';
import 'package:group_reservations/screens/Main%20Screeens/homepage.dart';

class AllReservationsScreens extends StatefulWidget {
  const AllReservationsScreens({super.key});

  @override
  State<AllReservationsScreens> createState() => _AllReservationsScreensState();
}

class _AllReservationsScreensState extends State<AllReservationsScreens> {




  @override
  Widget build(BuildContext context) {
    //final List<Reservation> reservations = getDemoReservations(); // Get demo data
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.primary,
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