// ignore_for_file: non_constant_identifier_names

class Transactions{
  late final String transaction_reference_id ;
  late final int amount ;
  late final DateTime date_payed;
  late final String status;
  late final String payment_method;

  Transactions({
    required this.transaction_reference_id,
    required this.amount,
    required this.date_payed,
    required this.status,
    required this.payment_method,
  });

}