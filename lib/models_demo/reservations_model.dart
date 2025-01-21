
// ignore_for_file: non_constant_identifier_names

class Reservations {
  late final int reservation_id;
  late final int userid;
  late final int groupid;
  late final String title;
  late final String description;
  late final String package_type;
  late final int price;
  late final String payment_status;
  late final String reservation_status;
  late final String date_created;
  late final String reservation_date;

  Reservations({
    required this.reservation_id,
    required this.userid,
    required this.groupid,
    required this.title,
    required this.description,
    required this.package_type,
    required this.price,
    required this.payment_status,
    required this.reservation_status,
    required this.date_created,
    required this.reservation_date,
    
  });
}