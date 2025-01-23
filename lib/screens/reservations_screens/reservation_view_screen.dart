// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:group_reservations/components/custom_button_styles.dart';
import 'package:group_reservations/components/themes.dart';
import 'package:group_reservations/constants/colors.dart';
import 'package:group_reservations/models_demo/events_model.dart';
import 'package:group_reservations/models_demo/goods_model.dart';
import 'package:group_reservations/screens/Main%20Screeens/payment_screeen.dart';

class ReservationViewScreen extends StatefulWidget {

   // final Events events ;
   //final dynamic package;
   //final Good goods;
   //final dynamic size;
  
  //const ReservationViewScreen({   
    
    //required this.events,
    //required this.package,
    //required this.goods,
    //required this.size,
    

 // });

  @override
  State<ReservationViewScreen> createState() => _ReservationViewScreenState();
}

class _ReservationViewScreenState extends State<ReservationViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
      ),

     


    );
  }
}