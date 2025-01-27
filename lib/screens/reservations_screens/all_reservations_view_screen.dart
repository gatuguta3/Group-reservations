// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:group_reservations/constants/colors.dart';
import 'package:group_reservations/models_demo/reservations_model.dart';

class AllReservationsViewScreen extends StatefulWidget {
  final Reservations reservation;
  const AllReservationsViewScreen({super.key  , required this.reservation});

  @override
  State<AllReservationsViewScreen> createState() => _AllReservationsViewScreenState();
}

class _AllReservationsViewScreenState extends State<AllReservationsViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.primary,),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                            crossAxisAlignment: CrossAxisAlignment.start,                            
                            children: [
                            
                            Text(widget.reservation.title, style: TextStyle(fontWeight: FontWeight.w400 , fontSize: 18)),
                            Text(widget.reservation.date_created, style: TextStyle(fontSize: 13 , fontWeight: FontWeight.w200)),
                          ],),
                            ],
                          ),
                          SizedBox(height: 20,),
                      Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Column(crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text('Package' , style: TextStyle(fontSize: 11, color: Color.fromARGB(125, 0, 0, 0)),), 
                                      Text(  widget.reservation.package_type, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),  ),
                                            ],  ),
                                       
                            
                             Column( crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [  Text('Status' , style: TextStyle(fontSize: 11, color: Color.fromARGB(125, 0, 0, 0)),),
                                                 Text( widget.reservation.payment_status, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400), ), 
                                                     
                                                      ],),
                                                      
                                                      
                                                      ],),

                        const Divider(thickness: 1),
                        Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Column(crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(  'Price', style: TextStyle(fontSize: 11, color: Color.fromARGB(125, 0, 0, 0)),  ),  
                                       Text('Ksh ${widget.reservation.price}' , style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                            ],  ),
                             Column( crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [ 
                                        Text( 'status', style: TextStyle(fontSize: 11, color: Color.fromARGB(125, 0, 0, 0)),        ), 
                                        Text('${widget.reservation.reservation_status}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                                 ],),

                              Column( crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [ 
                                         Text( 'Reservation Date',   style: TextStyle(fontSize: 11, color: Color.fromARGB(125, 0, 0, 0)),      ),
                                        Text('${widget.reservation.reservation_date}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                                  ],),
                                                                                                      
                                                      ],),

                        
                        Divider(thickness: 1),

                        Text( widget.reservation.description, style: TextStyle(fontSize: 11),),
                        const SizedBox(height: 15),
                        const Divider(thickness: 1),
                        const SizedBox(height: 15),

                        
                          Container(
                              width: 350,
                              height: 45,                                               
                              decoration: BoxDecoration(
                              color: AppColors.greycardcolor,
                              ),                        
                            child: Row(                              
                              
                              children: [
                                  SizedBox(width: 10,),
                                   Text('Payments',style: TextStyle(color: Colors.black)),
                                                                  
                                   ],)),
                        ],
                      ),

                        
        )
      ),
    );
  }
}