
// ignore_for_file: non_constant_identifier_names

import 'package:group_reservations/Models_demo/reservations_model.dart';

class ReservationsDemodata{

  Future<List<Reservations>> fetch_reservations () async {
   // await Future.delayed(Duration(seconds: 1));


    List<Reservations> reservations_list =[
      Reservations(
        reservation_id: 1,
        userid: 1,
        groupid: 1,
        title: "Test Reservation",
        description: "Test Description",
        package_type: "Test Package",
        price: 100,
        payment_status: "Paid",
        reservation_status: "Active",
        date_created: "2022-01-01",
        reservation_date: "2022-01-01",

      ),
      Reservations(
        reservation_id: 2,
        userid: 1,
        groupid: 2,
        title: "Test Reservation 2",
        description: "Test Description",
        package_type: "Test Package",
        price: 100,
        payment_status: "Paid",
        reservation_status: "Active",
        date_created: "2022-01-01",
        reservation_date: "2022-01-01",

      ),
    ];
    return reservations_list;
    
  }
}