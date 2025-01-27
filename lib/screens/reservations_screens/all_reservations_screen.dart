import 'package:flutter/material.dart';
import 'package:group_reservations/components/themes.dart';
import 'package:group_reservations/constants/colors.dart';
import 'package:group_reservations/models_demo/reservation_model.dart';
import 'package:group_reservations/models_demo/reservations_model.dart';
import 'package:group_reservations/screens/Main%20Screeens/homepage.dart';
import 'package:group_reservations/screens/reservations_screens/all_reservations_view_screen.dart';
import 'package:group_reservations/services_demo/reservations_demodata.dart';

class AllReservationsScreens extends StatefulWidget {
  const AllReservationsScreens({super.key});

  @override
  State<AllReservationsScreens> createState() => _AllReservationsScreensState();
}

class _AllReservationsScreensState extends State<AllReservationsScreens> {


final List<Reservations> reservations = get_reservations();// Get demo data

  @override
  Widget build(BuildContext context) {
    
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
          ),),

          floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {          

                    Navigator.pushAndRemoveUntil(   context,  MaterialPageRoute( builder: (context) => Homepage(initialIndex: 1), ), (route) => false,    );
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: ListView.builder(
            itemCount: reservations.length,
            itemBuilder: (context, index) {
              final reservation = reservations[index];              
              return GestureDetector(
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(
                    builder: (context) => AllReservationsViewScreen(
                    reservation : reservation,       )  ),  );
                },
                child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          reservation.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          reservation.date_created,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Package',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  reservation.package_type,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Paid',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  reservation.payment_status,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Price',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  'Ksh ${reservation.price}',
                                  //'  Ksh${reservedPackage.}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Reservation Date',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  reservation.reservation_date,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            
              );})
    );
  }
}