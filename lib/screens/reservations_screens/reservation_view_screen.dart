// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, prefer_const_literals_to_create_immutables, sort_child_properties_last, unnecessary_cast

import 'package:flutter/material.dart';
import 'package:group_reservations/components/custom_button_styles.dart';
import 'package:group_reservations/constants/colors.dart';
import 'package:group_reservations/models_demo/events_model.dart';
import 'package:group_reservations/models_demo/reservation_model.dart';
import 'package:group_reservations/screens/Main%20Screeens/homepage.dart';
import 'package:group_reservations/screens/Main%20Screeens/payment_screeen.dart';

class ReservationViewScreen extends StatefulWidget {
final Reservation reservation;
  const ReservationViewScreen({super.key ,
   required this.reservation
   });

  @override
  State<ReservationViewScreen> createState() => _ReservationViewScreenState();
}

class _ReservationViewScreenState extends State<ReservationViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:  AppBar(
  backgroundColor: AppColors.primary,
  automaticallyImplyLeading: false,
  toolbarHeight: 0.0,),
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
                            
                            Text(widget.reservation.eventName, style: TextStyle(fontWeight: FontWeight.w400 , fontSize: 18)),
                            Text(widget.reservation.eventDate, style: TextStyle(fontSize: 11 , fontWeight: FontWeight.w200)),
                          ],),
                            ],
                          ),
                          Divider(thickness: 1),
                          SizedBox(height: 10,),
                      Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Column(crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text('Package' , style: TextStyle(fontSize: 11, color: Color.fromARGB(125, 0, 0, 0)),), 
                                      Text(  widget.reservation.package_name as String, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),  ),
                                            ],  ),
                                       
                            
                             Column( crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [  Text('Status' , style: TextStyle(fontSize: 11, color: Color.fromARGB(125, 0, 0, 0)),),
                                                 Text( widget.reservation.status, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400), ), 
                                                     
                                                      ],),
                                                      
                                                      
                                                      ],),

                        const Divider(thickness: 1),
                        Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Column(crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text(  'Price', style: TextStyle(fontSize: 11, color: Color.fromARGB(125, 0, 0, 0)),  ),  
                                       Text('Ksh ${widget.reservation.package_price}' , style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                            ],  ),
                             Column( crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [ 
                                        Text( 'status', style: TextStyle(fontSize: 11, color: Color.fromARGB(125, 0, 0, 0)),        ), 
                                        Text( 
                                          '${widget.reservation.package_status}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                                 ],),

                              Column( crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [ 
                                         Text( 'Reservation Date',   style: TextStyle(fontSize: 11, color: Color.fromARGB(125, 0, 0, 0)),      ),
                                        Text('${widget.reservation.eventReservationDate}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                                  ],),
                                                                                                      
                                                      ],),

                        
                        Divider(thickness: 1),

                        Row(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Description' , style: TextStyle(fontSize: 11, color: Color.fromARGB(125, 0, 0, 0)),),
                        ],
                        ),
                        const SizedBox(height: 10),
                        Text( widget.reservation.eventDescription, style: TextStyle(fontSize: 12),),
                        const SizedBox(height: 15),
                        const Divider(thickness: 1),
                        const SizedBox(height: 15),


                        
                        if(widget.reservation.status == 'Not Paid')
                          Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:[
                             OutlinedButton(
                              onPressed: () {     
                                Navigator.pushAndRemoveUntil(   context,  MaterialPageRoute( builder: (context) => Homepage(initialIndex: 1), ), (route) => false,    );                          
                                
                              },
                              child: Text("Cancel Reservation", style: TextStyle(color: Colors.black),),
                              style: CustomButtonStyle.outlinedButtonStyle2(),
                            ),
                            SizedBox(width: 10,),
                            ElevatedButton(
                              onPressed: () {            
                                

              Navigator.push(context, MaterialPageRoute( builder: (context) => PaymentScreeen( amount: widget.reservation.package_price, ),), );    
                               
                              },
                              child: Text("Make Payment",style: TextStyle(color: Colors.white),),
                              style: CustomButtonStyle.buttonStyle4(),
                            ),
                            
                          ]
                        ),
                         
                        


                        const SizedBox(height: 10),                       

                        
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