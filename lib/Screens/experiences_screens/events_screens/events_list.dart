import 'package:flutter/material.dart';
import 'package:group_reservations/Models_demo/events_model.dart';
import 'package:group_reservations/Screens/experiences_screens/events_screens/selected_experience_screen.dart';
import 'package:group_reservations/Services_demo/events_demodata.dart';

class EventsList extends StatefulWidget {
  const EventsList({super.key});

  @override
  State<EventsList> createState() => _EventsListState();
}

class _EventsListState extends State<EventsList> {

  final List<Events> events = get_events();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
                                                      itemCount: events.length,
                                                      itemBuilder: (context, index) {
                                                      final experience = events[index];
                                                      return GestureDetector(
                                                        onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) => SelectedExperienceScreen(
                                                                experience_id : experience.id,
                                                                image : experience.image_url,
                                                                experience_title : experience.title,
                                                                experience_description : experience.description,
                                                                experience_location : experience.location,
                                                                experience_venue : experience.venue,
                                                                experience_occation : experience.occasion,
                                                                experience_subtitle : experience.subtitle,
                                                                experience_activities : experience.package_activities,
                                                                startdate:experience.start_date,
                                                                enddate: experience.end_date,
                                                                standardPrice: experience.standard_price,
                                                                standardStatus : experience.standard_status,
                                                                standardMaxPeople : experience.standard_max_people,
                                                                premiumPrice : experience.premium_price,
                                                                premiumStatus : experience.premium_status,
                                                                premiumMaxPeople : experience.premium_max_people,
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
                                                      experience.image_url,
                                                      fit: BoxFit.cover,
                                                      ),
                                                      ),
                                                      ],
                                                      ),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                      child: Text(experience.title, style: TextStyle(fontWeight: FontWeight.bold)),
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
                                                      experience.subtitle,
                                                      style: TextStyle(fontSize: 11, color: Color.fromARGB(125, 0, 0, 0)),
                                                      ),
                                                      ],
                                                      ),
                                                      Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                      Text('Venue'),
                                                      Text(
                                                      experience.location,
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
                                                      experience.description,
                                                      style: TextStyle(fontSize: 11, color: Color.fromARGB(125, 0, 0, 0)),
                                                      ),
                                                      ),
                                                      const SizedBox(height: 10),
                                                      ],
                                                      ),
                                                      ),
                                                      )
                                                      )
  );}); }
}