// ignore_for_file: camel_case_types

class Claims{
  final int id;
  final String owner;
  final String initiator;
  final String status;
  final DateTime daterequested;

  Claims({
    required this.id,
    required this.owner,
    required this.initiator,
    required this.status,
    required this.daterequested,
  });

}