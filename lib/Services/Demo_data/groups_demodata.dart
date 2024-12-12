
// ignore_for_file: non_constant_identifier_names

import 'package:group_reservations/Models/groups_model.dart';

class GroupsDemodata{

  Future<List<Groups>> fetch_groups () async {

    await Future.delayed(Duration(seconds: 1));

    List<Groups> groups_list = [
      Groups(
        groupid: 1,
        groupname: 'ELITE GROUP',
      ),
      Groups(
        groupid: 2,
        groupname: 'STIMA',
      ),
      Groups(
        groupid: 3,
        groupname: 'MALIPO',
      ),
      Groups(
        groupid: 4,
        groupname: 'ALIFA GROUP',
      ),

    ];

    return groups_list;

    
  }
}