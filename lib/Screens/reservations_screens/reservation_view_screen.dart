// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:group_reservations/Components/themes.dart';
import 'package:group_reservations/Screens/Main%20Screeens/payment_screeen.dart';

class ReservationViewScreen extends StatefulWidget {
   final int reservation_id;  
   final String title;
   final String description;
   final String package_type;
   final int price;
   final String payment_status;
   final String reservation_status;
   final String date_created;
   final String reservation_date;
  const ReservationViewScreen({
    
    required this.reservation_id,    
    required this.title,
    required this.description,
    required this.package_type,
    required this.price,
    required this.payment_status,
    required this.reservation_status,
    required this.date_created,
    required this.reservation_date,

  });

  @override
  State<ReservationViewScreen> createState() => _ReservationViewScreenState();
}

class _ReservationViewScreenState extends State<ReservationViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarycolor,
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          crossAxisAlignment: CrossAxisAlignment.center,         
          children: [
            SizedBox(height: 20),

                    Container(
                        width: 350, 
                        height: 300,                       
                        decoration: BoxDecoration(
                        color: whitecolor,
                        borderRadius: BorderRadius.circular(20),),                        
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,                          
                        children: [
                          Text(widget.title , style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
                          Text(widget.date_created ,style: TextStyle(fontSize: 11, fontWeight: FontWeight.w200),),
                          SizedBox(height: 5,),
                          Divider(thickness: 1,),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Column(
                                children: [
                                  Text('Package', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w200),),
                                  Text(widget.package_type , style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),)
                                ],
                              ),
                              Column(
                                children: [
                                  Text('Status',style: TextStyle(fontSize: 11, fontWeight: FontWeight.w200),),
                                  Text(widget.reservation_status , style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),)

                                ],
                              )
                            ],
                          ),

                          SizedBox(height: 5,),
                          Divider(thickness: 1,),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Column(
                                children: [
                                  Text('Price',style: TextStyle(fontSize: 11, fontWeight: FontWeight.w200),),
                                  Text(widget.price.toString() , style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),)

                                ],
                              ),
                              Column(
                                children: [
                                  Text('Status',style: TextStyle(fontSize: 11, fontWeight: FontWeight.w200),),
                                  Text(widget.payment_status , style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),)

                                ],
                              ),
                              Column(
                                children: [
                                  Text('Reservation date',style: TextStyle(fontSize: 11, fontWeight: FontWeight.w200),),
                                  Text(widget.reservation_date , style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),)

                                ],
                              )

                            ],
                          ),

                           SizedBox(height: 5,),
                          Divider(thickness: 1,),
                          SizedBox(height: 5,),

                          Text('Description',style: TextStyle(fontSize: 11, fontWeight: FontWeight.w200),),
                          SizedBox(height: 5,),

                          Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child:Text(widget.description , style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                            ),
                            ),



                        ],
                    )),
                    SizedBox(height: 10),

                    //implement the payment option when the view subscription option is clicked on the selected experience screen

                    widget.payment_status == "Not paid"
                    ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton(
                              onPressed: () {
                                                               
                              },
                              child: Text("Cancle Reservation" ,  style: TextStyle(color: Colors.black , fontWeight: FontWeight.w300),),
                              style: CustomButtonStyle.outlinedButtonStyle(),
                            ),
                            ElevatedButton(
                              onPressed: () {   
                                Navigator.push(context, MaterialPageRoute( builder: (context) => PaymentScreeen( amount: widget.price, ),), );                              
                                
                              },
                              child: Text("Make Payment",style: TextStyle(color: Colors.white),),
                              style: CustomButtonStyle.buttonStyle4(),
                              
                            ),
                                      ],
                      )
                    :

                    SizedBox(height: 20),

                    Container(
                        width: 350,
                        height: 30,                                               
                        decoration: BoxDecoration(
                        color: greycardcolor,
                        ),                        
                      child: Row(children: [SizedBox(width: 10,), Text('Payments')],)),
                    SizedBox(height: 10),


                   
            

          ],
        ),
      )


    );
  }
}