import 'package:flutter/material.dart';
import 'package:group_reservations/models_demo/insurance_model.dart';
import 'package:group_reservations/screens/experiences_screens/insurance_screens/insurance_details_screen.dart';

class InsuranceList extends StatelessWidget {
  const InsuranceList({super.key , required this.insurances});
  final List <Insurance> insurances;

  @override
  Widget build(BuildContext context) {
    return 
     ListView.builder(
shrinkWrap: true,
itemCount: insurances.length,
itemBuilder: (context , index){
final insurance = insurances[index];
return GestureDetector(
onTap:(){
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => InsuranceDetailsScreen(
insurances: insurance,

)
),
);

},
child: Container(
padding: const EdgeInsets.all(8),
child: SizedBox(
width: MediaQuery.of(context).size.width * 0.9,
child: Card(
color: Colors.white,
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: <Widget>[
Container(
height: 140.0,
child: Stack(
children: <Widget>[
Positioned.fill(
child: Image.asset(
insurance.image_url,
fit: BoxFit.cover,
), ), ], ),
),
const SizedBox(height: 5),
Padding(
padding: const EdgeInsets.symmetric(horizontal: 8.0),
child: Text(insurance.title, style: TextStyle(fontWeight: FontWeight.bold)),
),
const Divider(thickness: 1),
Padding(
padding: const EdgeInsets.symmetric(horizontal: 8.0),
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text('Subtitle'),
Text(
insurance.subtitle,
style: TextStyle(fontSize: 11, color: Color.fromARGB(125, 0, 0, 0)),
),
],
),
Column(
crossAxisAlignment: CrossAxisAlignment.end,
children: [
Text('Insurance provider'),
Text(
insurance.provider,
style: TextStyle(fontSize: 11, color: Color.fromARGB(125, 0, 0, 0)),
),
],
),
],
),
),
const Divider(thickness: 1),
Padding(
padding: const EdgeInsets.symmetric(horizontal: 8.0),
child: Text(
insurance.description,
style: TextStyle(fontSize: 11),
),
),
const SizedBox(height: 10),
],
),
),
),
)

);

}
);
     
  }
}