import 'package:flutter/material.dart';
import 'package:group_reservations/models_demo/goods_model.dart';
import 'package:group_reservations/screens/experiences_screens/goods_screens/goods_details_screen.dart';
import 'package:group_reservations/services_demo/goods_demodata.dart';

class GoodsList extends StatefulWidget {
  const GoodsList({super.key});

  @override
  State<GoodsList> createState() => _GoodsListState();
}

class _GoodsListState extends State<GoodsList> {

  final List<Good> goods = get_goods;

  @override
  Widget build(BuildContext context) {
    return 
ListView.builder(
shrinkWrap: true,
itemCount: goods.length,
itemBuilder: (context , index){
final good = goods[index];
return GestureDetector(
onTap:(){
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => GoodsDetailsScreen(
goods: good,

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
good.image_url,
fit: BoxFit.cover,
), ), ], ),
),
const SizedBox(height: 5),
Padding(
padding: const EdgeInsets.symmetric(horizontal: 8.0),
child: Text(good.name, style: TextStyle(fontWeight: FontWeight.bold)),
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
good.subtitle,
style: TextStyle(fontSize: 11, color: Color.fromARGB(125, 0, 0, 0)),
),
],
),
Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text('Venue'),
Text(
good.venue,
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
good.description,
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