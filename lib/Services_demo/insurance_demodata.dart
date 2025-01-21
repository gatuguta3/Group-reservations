
// ignore_for_file: non_constant_identifier_names

import 'package:group_reservations/Models_demo/insurance_model.dart';


List<Insurance> get_insurance (){
  return[

    Insurance(
    id: 1,
    title: 'Britam Last expense',
    image_url: 'images/britaminsurance.png',
    subtitle: 'With you every step of the way',
    provider: 'Britam insurance',
    description: 'Funeral expense insurance, also known as burial or final expense insurance, is a small life insurance policy designed to cover costs associated with a funeral and burial. It typically pays for funeral home services, caskets or urns, burial plots, headstones, and ceremony expenses like flowers and venue fees. It may also cover legal fees, death certificates, and obituary notices. The policy provides a payout to a designated beneficiary to manage these expenses, ensuring that loved ones aren’t burdened with financial stress',
    plans:[
      {
        'name': 'Bronze',
        'claims': 'Multiple claims',
        'price_per_person': 1200,
        'max_members': 10,
        'cost_to_cover': 50000,
        'more_info': 'Condition cover on the fierst two death basis',
        'status':'Pending'
      },
      {
        'name': 'Basic',
        'claims': 'Multiple claims',
        'price_per_person': 800,
        'max_members': 10,
        'cost_to_cover': 50000,
        'more_info': 'Condition cover on the fierst two death basis',
        'status':'Pending'
      },
      {
        'name': 'Premium',
        'claims': 'Multiple claims',
        'price_per_person': 1000,
        'max_members': 10,
        'cost_to_cover': 50000,
        'more_info': 'Condition cover on the fierst two death basis',
        'status':'Pending'
      },
    ],
    payments: [
      {
        'Transaction_Ref':'SQWERTY67H',
        'date:paid': '24-08-12',
        'amount':1000,
        'status':'paid'        

      },
      {
        'Transaction_Ref':'SQWERTY67H',
        'date:paid': '24-08-12',
        'amount':1000,
        'status':'paid'        

      }
    ]
  ),
  Insurance(
    id: 2,
    title: 'APA Last expense cover',
    image_url: 'images/insurance2.jpeg',
    subtitle: 'with you every step of the way',
    provider: 'APA insurance cover',
    description: 'Funeral expense insurance, also known as burial or final expense insurance, is a small life insurance policy designed to cover costs associated with a funeral and burial. It typically pays for funeral home services, caskets or urns, burial plots, headstones, and ceremony expenses like flowers and venue fees. It may also cover legal fees, death certificates, and obituary notices. The policy provides a payout to a designated beneficiary to manage these expenses, ensuring that loved ones aren’t burdened with financial stress',
    plans:[
       {
        'name': 'Bronze',
        'claims': 'Multiple claims',
        'price_per_person': 1200,
        'max_members': 10,
        'cost_to_cover': 50000,
        'more_info': 'Condition cover on the fierst two death basis',
        'status':'Pending'
      },
      {
        'name': 'Basic',
        'claims': 'Multiple claims',
        'price_per_person': 800,
        'max_members': 10,
        'cost_to_cover': 50000,
        'more_info': 'Condition cover on the fierst two death basis',
        'status':'Pending'
      },
      {
        'name': 'Premium',
        'claims': 'Multiple claims',
        'price_per_person': 1000,
        'max_members': 10,
        'cost_to_cover': 50000,
        'more_info': 'Condition cover on the fierst two death basis',
        'status':'Pending'
      },
    ],
    payments: [
      {
        'Transaction_Ref':'SQWERTY67H',
        'date:paid':'24-08-12',
        'amount':1000,
        'status':'paid'
        
      },
      {
        'Transaction_Ref':'SQWERTY67H',
        'date:paid':'24-08-12',
        'amount':1000,
        'status':'paid'        

      }
    ]
  ),
  Insurance(
    id: 3,
    title: 'Absa Last expense',
    image_url: 'images/britaminsurance.png',
    subtitle: 'with ypu every step of the way',
    provider: 'ABSA insirance cover',
    description: 'Funeral expense insurance, also known as burial or final expense insurance, is a small life insurance policy designed to cover costs associated with a funeral and burial. It typically pays for funeral home services, caskets or urns, burial plots, headstones, and ceremony expenses like flowers and venue fees. It may also cover legal fees, death certificates, and obituary notices. The policy provides a payout to a designated beneficiary to manage these expenses, ensuring that loved ones aren’t burdened with financial stress',
    plans:[
       {
        'name': 'Bronze',
        'claims': 'Multiple claims',
        'price_per_person': 1200,
        'max_members': 10,
        'cost_to_cover': 50000,
        'more_info': 'Condition cover on the fierst two death basis',
        'status':'Pending'
      },
      {
        'name': 'Basic',
        'claims': 'Multiple claims',
        'price_per_person': 800,
        'max_members': 10,
        'cost_to_cover': 50000,
        'more_info': 'Condition cover on the fierst two death basis',
        'status':'Pending'
      },
      {
        'name': 'Premium',
        'claims': 'Multiple claims',
        'price_per_person': 1000,
        'max_members': 10,
        'cost_to_cover': 50000,
        'more_info': 'Condition cover on the fierst two death basis',
        'status':'Pending'
      },
    ],
    payments: [
      {
        'Transaction_Ref':'SQWERTY67H',
        'date:paid':'24-08-12',
        'amount':1000,
        'status':'paid'        
      },
      {
        'Transaction_Ref':'SQWERTY67H',
        'date:paid':'24-08-12',
        'amount':1000,
        'status':'paid'        

      }
    ]
  )


  ];
}




