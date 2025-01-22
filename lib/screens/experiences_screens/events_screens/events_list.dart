// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:group_reservations/models_demo/events_model.dart';
import 'package:group_reservations/screens/experiences_screens/events_screens/events_details_screens.dart';

class EventsList extends StatelessWidget {
  const EventsList({super.key, required this.events});
  final List <Events> events;

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
                                                      itemCount: events.length,
                                                      itemBuilder: (context, index) {
                                                      final event = events[index];
                                                      return GestureDetector(
                                                        onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) => EventsDetailsScreen(
                                                                events : event ,
                                                              )
                                                            ),
                                                          );
                                                      }, 
                                                      child:  Container(
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
                                                      event.image_url,
                                                      fit: BoxFit.cover,
                                                      ),
                                                      ),
                                                      ],
                                                      ),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                      child: Text(event.title, style: TextStyle(fontWeight: FontWeight.bold)),
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
                                                      event.subtitle,
                                                      style: TextStyle(fontSize: 11, color: Color.fromARGB(125, 0, 0, 0)),
                                                      ),
                                                      ],
                                                      ),
                                                      Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                      Text('Venue'),
                                                      Text(
                                                      event.location,
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
                                                      event.description,
                                                      style: TextStyle(fontSize: 11, color: Color.fromARGB(125, 0, 0, 0)),
                                                      ),
                                                      ),
                                                      const SizedBox(height: 10),
                                                      ],
                                                      ),
                                                      ),
                                                      )
                                                      )
  );});
  }
}