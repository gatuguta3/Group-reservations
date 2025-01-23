class Reservation {
  final String eventName;
  final String eventDate;
  final String eventReservationDate;
  final List packages;
  final String status;

  Reservation({
    required this.eventName,
    required this.eventDate,
    required this.eventReservationDate,
    required this.packages,
    required this.status,
  });
}
