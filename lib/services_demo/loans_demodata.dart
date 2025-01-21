
import 'package:group_reservations/models_demo/loans_model.dart';

class LoansDemodata{

  Future<List<Loans>> fetch_loans () async {
     //await Future.delayed(Duration(seconds: 1));
      List<Loans> loans_list =[
        Loans(
          userid: 1,
          loanid: 1,
          groupid: 1,
          groupname: 'ELITE GROUP',
          balance: '8000',
          status: 'Active',
          upcomingdate: '24-08-2023', 

        ),
        Loans(
          userid: 1,
          loanid: 2,
          groupid: 2,
          groupname: 'STIMA',
          balance: '6000',
          status: 'Active',
          upcomingdate: '24-08-2023',
        ),
      ];
      return loans_list;
  }
}

List<Loans> fetch_demo_loans (){
  return [

    Loans(
          userid: 1,
          loanid: 1,
          groupid: 1,
          groupname: 'ELITE GROUP',
          balance: '8000',
          status: 'Active',
          upcomingdate: '24-08-2023', 

        ),
     Loans(
          userid: 1,
          loanid: 2,
          groupid: 2,
          groupname: 'STIMA',
          balance: '6000',
          status: 'Active',
          upcomingdate: '24-08-2023',
        ),

  ];
}

