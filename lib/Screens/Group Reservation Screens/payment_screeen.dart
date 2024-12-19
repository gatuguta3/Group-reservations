// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:group_reservations/Config/themes.dart';

class PaymentScreeen extends StatefulWidget {
  final int amount;
  
  const PaymentScreeen({required this.amount,});

  @override
  State<PaymentScreeen> createState() => _PaymentScreeenState();
}

class _PaymentScreeenState extends State<PaymentScreeen> {

   String? _selectedOption;
   late final TextEditingController _controller ;

  void _handleRadioValueChange(String? value) {
    setState(() {
      _selectedOption = value;
    });
  }

   @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.amount.toString());
  }

  @override
  void dispose() {
    _controller.dispose(); // Clean up the controller when the widget is removed
    super.dispose();
  }



  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: primarycolor,
          title: Row(
            children: [
             // GestureDetector(        onTap: () {},    child: Image.asset('icons/Frame36.png', width: 40, height: 40),     ),
              // const SizedBox(width: 30),
              Text(
                'Make Payment',
                style: TextStyle(fontSize: 21, color: Colors.white),
              ),
            ],
          ),),

          body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:Padding(
            padding:  EdgeInsets.all(10.0),
            child:  Column(
          children: [

              Row(children: [
                              Text('Payment Option :',style: TextStyle(fontSize: 14 , fontWeight: FontWeight.w400)), 
                            ],),

              Row(
                mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
                children: [
                       Row(
            children: [
              Radio<String>(
                value: 'M-Pesa',
                groupValue: _selectedOption,
                onChanged: _handleRadioValueChange,
              ),
              const Text('M-Pesa'),
            ],
          ),
          Row(
            children: [
              Radio<String>(
                value: 'Wallet',
                groupValue: _selectedOption,
                onChanged: _handleRadioValueChange,
              ),
              const Text('Wallet'),
            ],
          ),

          Row(
            children: [
              Radio<String>(
                value: 'Card',
                groupValue: _selectedOption,
                onChanged: _handleRadioValueChange,
              ),
              const Text('Card'),
            ],
          ),
                ],
              ),

              const SizedBox(height: 10,),

             const Row(children: [Text('Enter Amount :',style: TextStyle(fontSize: 14 , fontWeight: FontWeight.w400)),],),
             const SizedBox(height: 5,),
             TextField(
                controller: _controller,
                enabled: false,                      
                decoration: InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),                   

                  ),       
                ),
                style: TextStyle(
                  color: Colors.grey[700],           
                ),
              ),

              SizedBox(height: 15,),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             ElevatedButton(
                                onPressed: () {
                                  
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center, 
                                  children: [
                                    
                                    Text(
                                      'Complete',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(width: 8),
                                    Icon(
                                      Icons.arrow_forward, 
                                      color: Colors.white, 
                                    ),
                                     
                                  ],
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(255, 6, 94, 9), 
                                  minimumSize: Size(330, 40), 
                                ),
                              )       
                          
                          ],),
                         
            
              

          ])
          )
          )
    );
  }
}
