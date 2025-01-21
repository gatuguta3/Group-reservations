
import 'package:group_reservations/models_demo/packages_model.dart';

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