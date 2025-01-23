import 'package:flutter/material.dart';
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
    return const Placeholder();
  }
}