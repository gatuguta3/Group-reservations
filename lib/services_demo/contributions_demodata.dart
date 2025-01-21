
// ignore_for_file: non_constant_identifier_names

import 'package:group_reservations/models_demo/contributions_model.dart';

class ContirbutionsDemodata {

  Future<List<Contributions>> fetch_contributions () async {
    //await Future.delayed(Duration(seconds: 1));

    List<Contributions> contribution_list = [
      Contributions(
        userid: 1,
        contributionid: 1,
        groupid: 1,
        groupname: 'ELITE GROUP',
        contributiontype: ' monthly contribution',
        amount: '1000',
        upcomingdate: '24-08-2023'

      ),
      Contributions(
        userid: 1,
        contributionid: 2,
        groupid: 2,
        groupname: 'STIMA',
        contributiontype: ' monthly contribution',
        amount: '10000',
        upcomingdate: '24-08-2023'

      ),
      Contributions(
        userid: 1,
        contributionid: 3,
        groupid: 3,
        groupname: 'MALIPO',
        contributiontype: ' Annual contribution',
        amount: '10000',
        upcomingdate: '24-08-2023'

      ),
      Contributions(
        userid: 1,
        contributionid: 4,
        groupid: 4,
        groupname: 'ALIFA GROUP',
        contributiontype: ' quaterly contribution',
        amount: '10000',
        upcomingdate: '24-08-2023'

      )
    ];
    return contribution_list;
  }
}