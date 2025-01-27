
// ignore_for_file: non_constant_identifier_names

import 'package:group_reservations/models_demo/reservations_model.dart';



List <Reservations> get_reservations () {
  return [

    Reservations(
        reservation_id: 1,
        userid: 1,
        groupid: 1,
        title: "Diani Neptune Beach Resort",
        description: "A relaxing weekend at the beach with sun and sand . Sand basking will from 10-12 am , all activities including jet skiing and snowkerling will be done on order from the main office",
        package_type: "Standard",
        price: 2000,
        payment_status: "Paid",
        reservation_status: "Active",
        date_created: "2022-01-01",
        reservation_date: "2022-01-01",

      ),
      Reservations(
        reservation_id: 2,
        userid: 1,
        groupid: 2,
        title: "Machakos Colour Fest",
        description: "A relaxing weekend at the beach with sun and sand . Sand basking will from 10-12 am , all activities including jet skiing and snowkerling will be done on order from the main office",
        package_type: "Standard",
        price: 2000,
        payment_status: "Paid",
        reservation_status: "Active",
        date_created: "2022-01-01",
        reservation_date: "2022-01-01",

      ),

       Reservations(
        reservation_id: 2,
        userid: 1,
        groupid: 2,
        title: "Machakos Colour Fest",
        description: "A relaxing weekend at the beach with sun and sand . Sand basking will from 10-12 am , all activities including jet skiing and snowkerling will be done on order from the main office",
        package_type: "Standard",
        price: 2000,
        payment_status: "Cancled",
        reservation_status: "Active",
        date_created: "2022-01-01",
        reservation_date: "2022-01-01",

      ),
    

  ];
}