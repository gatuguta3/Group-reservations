// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:group_reservations/Config/themes.dart';
import 'package:group_reservations/Models/contributions_model.dart';
import 'package:group_reservations/Models/loans_model.dart';
import 'package:group_reservations/Services/Demo_data/contributions_demodata.dart';
import 'package:group_reservations/Services/Demo_data/loans_demodata.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String WalletId="QW123456789";
  String WalletBalance="1000.00";
  int userid = 1;
   String name = "Edwin";
   String phonenumber = "1234567890";
   String email = "Edwin@gmail.com";
   String profile_image_url = 'images/edwin.jpeg';

   bool _isBlurred = false;

  void _toggleBlur() {
    setState(() {
      _isBlurred = !_isBlurred;
    });
  }

  final ContirbutionsDemodata contributions_demodata = ContirbutionsDemodata();
  final LoansDemodata loans_demodata = LoansDemodata();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: primarycolor, 
          title:  Row(            
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(profile_image_url),                
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Good morning, ',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Text(name,
                  style: TextStyle(fontSize: 15, color: Colors.white , fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(width: 140,),              
                Icon(
                  size: 25.0,
                  color: Color.fromARGB(150, 255, 255, 255),
                  Icons.notifications_active_outlined),
                
              
            ],
          ),
        ),


        body:  Column(
            children: [
              Container(                      
                  width: double.infinity, 
                  
                  color: secondarycolor, 
                  child:  Column(                  
                    children: [ 
                     const SizedBox(height: 20,),

                      Container(
                        width: 310,
                        
                        decoration: BoxDecoration(
                        color: primarycolor,
                        borderRadius: BorderRadius.circular(20),),                        
                      child:Column(
                        children: [
                          const SizedBox(height: 15,),
                          Container(
      width: 200,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Color.fromARGB(97, 233, 221, 88),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Wallet ID :  $WalletId ',
            style: TextStyle(
              fontSize: 11,
              color: Color.fromARGB(255, 235, 181, 34),
            ),
          ),
          SizedBox(width: 3),
          GestureDetector(
            onTap: () {              
              Clipboard.setData(ClipboardData(text: '$WalletId')).then((_) {              
              
              });
            },
            child: Icon(
              color: Color.fromARGB(255, 235, 181, 34),
              size: 15,
              Icons.copy_outlined,
            ),
          ),
        ],
      ),
    ),
                           const SizedBox(height: 20,),
                           const Text(
                                    'My Wallet Balance ',
                                    style: TextStyle(fontSize: 14,color: Color.fromARGB(255, 71, 3, 88),),
                                  ),
                          const SizedBox(height: 8,),
               Stack(
                  children: [
                    Text(
                      'KES $WalletBalance',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    if (_isBlurred)
                      Positioned.fill(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: Container(color: Colors.transparent),
                        ),
                      ),
                  ],
                ),
        const SizedBox(height: 15),
        GestureDetector(
          onTap: _toggleBlur,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Show balance ',
                style: TextStyle(
                  fontSize: 11,
                  color: Color.fromARGB(255, 235, 181, 34),
                ),
              ),
              const SizedBox(width: 3),
              Icon(
                color: Color.fromARGB(255, 235, 181, 34),
                size: 15,
                Icons.remove_red_eye_outlined,
              ),
            ],
          ),
        ),
                         const SizedBox(height: 10,),
                         ElevatedButton.icon(
                                onPressed: () {
                                  
                                },                                
                                label: Text('Wallet'), 
                                icon: Image.asset('icons/Vector3.png', width: 24, height: 24),                                
                                style: CustomButtonStyle.buttonStyle(),
                              ),
                              const SizedBox(height: 20,),
                         

                        ],
                      )
                     ),
                   
                   const SizedBox(height: 20,),
                    ]
                  ),
                ),

               SizedBox(height: 30,),
                    Row(
                    children: [
                      SizedBox(width: 10,),
                       Text('4 Upcoming Contributions ',style: TextStyle(fontSize: 14,color: Color.fromARGB(255, 5, 5, 5),fontWeight: FontWeight.w400),),
                    ],
                   ),
                    const SizedBox(height: 8,),

                  FutureBuilder<List<Contributions>>(
                  future: contributions_demodata.fetch_contributions(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No contributions found.'));
                    }

                    final contributions = snapshot.data!;
                    return Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: contributions.length,
                itemBuilder: (context, index) {
                  final contribution = contributions[index];
                  return SizedBox(
                    width: 240,
                   
                    child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: const Color.fromARGB(111, 0, 0, 0), width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                    color: Colors.white,
                    child:  Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: orangecolor,
                                child: Image.asset('icons/Group.png', width: 24, height: 24), 
                              ),                                                           
                              
                             const SizedBox(width: 3,),
                               Column(
                                children: [
                                  Text(contribution.groupname,style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold)),
                                  SizedBox(height: 2,),
                                  Text(contribution.contributiontype,style: TextStyle(fontSize: 11, color: Color.fromARGB(117, 0, 0, 0)),)
                                ],
                              ),
                              const SizedBox(width: 30,),
                              GestureDetector(
                                onDoubleTap: (){},
                                child: Image.asset('icons/arrow-up-right.png', width: 24, height: 24), 
                              )
                            ],
                          ),           
                          const Divider(thickness: 1),
                           Row(children: [
                            Text('KSH : ${contribution.amount }', style: TextStyle(fontSize: 14 , fontWeight: FontWeight.bold)),
                            SizedBox(width: 40,),
                            SizedBox(
                              child: Row(
                                children: [
                                  Icon(
                                    size: 15,
                                    Icons.punch_clock_outlined),
                                    SizedBox(width: 5,),
                                  Text(contribution.upcomingdate, style: TextStyle(fontSize: 13))
                                ],
                              ),
                            )
                          ],)

                          
                          
                        ],
                      ),
                    ),
                  ),
                  );

             
    },
  ),
);

                    }),

              
              SizedBox(height: 20,),
                    Row(
                    children: [
                      SizedBox(width: 10,),
                       Text('My loans ',style: TextStyle(fontSize: 14,color: Color.fromARGB(255, 5, 5, 5),fontWeight: FontWeight.w400),),
                    ],
                   ),
                    const SizedBox(height: 8,),

              
                  FutureBuilder<List<Loans>>(
                  future: loans_demodata.fetch_loans(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No loans found.'));
                    }

                    final loans = snapshot.data!;
                    return Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: loans.length,
                itemBuilder: (context, index) {
                  final loan = loans[index];
                  return  SizedBox(
                    width: 240,
                    child: Card(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color:  Color.fromARGB(111, 0, 0, 0), width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                    color: Colors.white,
                    child:  Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [                             
                             const SizedBox(width: 3,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(loan.groupname,style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold)),
                                  SizedBox(height: 2,),
                                  Text('Next Installment : ${loan.upcomingdate}',style: TextStyle(fontSize: 11, color: Color.fromARGB(117, 0, 0, 0)),)
                                ],
                              ),
                              const SizedBox(width: 30,),
                              GestureDetector(
                                onDoubleTap: (){},
                                child:Image.asset('icons/arrow-up-right.png', width: 24, height: 24), 
                              )
                            ],
                          ),             
                          const Divider(thickness: 1),
                           Row(
                            children: [
                              const SizedBox(width: 3,),
                              Text('BAL : KES ${loan.balance}',style: TextStyle(fontSize: 13 , fontWeight: FontWeight.w300)),
                             const SizedBox(width: 50,),
                            Container(
                                alignment: Alignment.center,
                                width: 60,height: 20,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF00563B), 
                                  borderRadius: BorderRadius.circular(12), // Set the border radius for rounded corners
                                ),                                
                                child:  SizedBox(                               
                              child: Text(loan.status,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w100 ,color: Colors.white)),),
                              )

                            ],
                          )
                          
                          
                        ],
                      ),
                    ),
                  ),
                  );

  
    },
  ),
);

                    }),

              SizedBox(height: 10,)

                
              
                  
                      

            

            ],
          ),
        );

    
  }
}