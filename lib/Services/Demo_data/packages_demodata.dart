
import 'package:group_reservations/Models/packages_model.dart';

class PackagesDemodata{
  Future<List<Packages>> fetchPackages() async {
    
   // await Future.delayed(Duration(seconds: 2));

    List<Packages> packagelist =[
      Packages(
        type: 'Standard',
      
           ),
      Packages(
        type: 'Premium',
        
       )
    ];
    return packagelist;
  }
}