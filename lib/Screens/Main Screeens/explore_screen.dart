// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:group_reservations/Components/themes.dart';
import 'package:group_reservations/Models_demo/experiences_model.dart';
import 'package:group_reservations/Models_demo/goods_model.dart';
import 'package:group_reservations/Models_demo/insurance_model.dart';
import 'package:group_reservations/Screens/experiences_screens/goods_screens/selected_goods_screen.dart';
import 'package:group_reservations/Screens/experiences_screens/events_screens/selected_experience_screen.dart';
import 'package:group_reservations/Screens/experiences_screens/insurance_screens/selected_insurance_screen.dart';
import 'package:group_reservations/Services_demo/experiences_demodata.dart';
import 'package:group_reservations/Services_demo/goods_demodata.dart';
import 'package:group_reservations/Services_demo/insurance_demodata.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {

  final ExperiencesDemodata experience_demodata = ExperiencesDemodata();
  final List<Insurance> insurances = get_insurance;
  final List<Good> goods = get_goods;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController( // Wrap Scaffold in DefaultTabController
      length: 4, // The number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primarycolor,
          title: Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Image.asset('icons/Frame36.png', width: 40, height: 40),
              ),
              const SizedBox(width: 30),
              Text(
                'Explore',
                style: TextStyle(fontSize: 21, color: Colors.white),
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(90.0),
            child: Container(
              color: orangecolor,
              height: 80,
              child: TabBar(
                isScrollable: true,
                tabs: [
                  Tab(
                      child: Container(
                        color: orangecolor,
                        height: 80, 
                        width: 80,       // Increase height here if needed
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('icons/upload-line.png',width: 20, height: 20,            ),
                            
                            Text('Membership' , style: TextStyle(fontSize: 11),),
                          ],
                        ),
                      ),
                    ),
                  Tab(
                      child: Container(
                        color: orangecolor,
                        height: 80,
                        width: 80,        // Increase height here if needed
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('icons/diversity_3_FILL0_wght400_GRAD0_opsz48 2.png',width: 20, height: 20,            ),
                            
                            Text('Chamas' , style: TextStyle(fontSize: 11),),
                          ],
                        ),
                      ),
                    ),
                  Tab(
                      child: Container(
                        color: orangecolor,
                        height: 80,
                        width: 80,        // Increase height here if needed
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('icons/Group.png',width: 20, height: 20,            ),
                            
                            Text('Fundraisers' , style: TextStyle(fontSize: 11),),
                          ],
                        ),
                      ),
                    ),
                  Tab(
                      child: Container(
                        color: orangecolor,
                        height: 80, 
                        width: 80,       // Increase height here if needed
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('icons/handshake.png',width: 20, height: 20,            ),
                            
                            Text('Experiences' , style: TextStyle(fontSize: 11),),
                          ],
                        ),
                      ),
                    ),                  
                ],
                indicatorColor: Colors.red,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                labelPadding: EdgeInsets.symmetric(horizontal: 4.0), 
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Content for Tab 1')),
            Center(child: Text('Content for Tab 2')),
            Center(child: Text('Content for Tab 3')),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Row(crossAxisAlignment: CrossAxisAlignment.start,children: [SizedBox(width: 5,),Text('Explore the best offers available !')], ),

                               DefaultTabController(
                    length: 3, // Number of tabs in the nested TabBar
                    child: Column(
                      children: [
                        TabBar(
                          tabs: [
                            Tab(text: "Events"),
                            Tab(text: "Insurance"),
                            Tab(text: "Goods"),
                          ],
                          indicatorColor: orangecolor,
                          labelColor: orangecolor,
                          unselectedLabelColor: Colors.black,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.8, // Constrain nested TabBarView
                          child: TabBarView(
                            children: [

                              FutureBuilder<List<Experiences>>(
                                                      future: experience_demodata.fetch_experiences(),
                                                      builder: (context, snapshot) {
                                                      if (snapshot.connectionState == ConnectionState.waiting) {
                                                      return Center(child: CircularProgressIndicator());
                                                      } else if (snapshot.hasError) {
                                                      return Center(
                                                      child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                      Text('Error: ${snapshot.error}'),
                                                      SizedBox(height: 10),
                                                      ElevatedButton(
                                                      onPressed: () {
                                                      setState(() {}); // Retry fetching
                                                      },
                                                      child: Text('Retry'),
                                                      ),
                                                      ],
                                                      ),
                                                      );
                                                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                                      return Center(child: Text('No experiences found.'));
                                                      }

                                                      final experiences = snapshot.data!;

                                                      return ListView.builder(
                                                      itemCount: experiences.length,
                                                      itemBuilder: (context, index) {
                                                      final experience = experiences[index];
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
                                                      );
                                                      
                                                      
                                                      
                                                      
                                                     },
                                                      );
                                                      },
                                                      ),                            


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
                                                              builder: (context) => SelectedInsuranceScreen(
                                                                id : insurance.id,
                                                                title : insurance.title,
                                                                subtitle : insurance.subtitle,
                                                                description : insurance.description,
                                                                image : insurance.image_url,
                                                                provider : insurance.provider,
                                                                plans : insurance.plans,
                                                                payments: insurance.payments,
                                                               
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
                                                      ),                ),         ],          ),
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
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                      Text('Provider'),
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
                  ),
            
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
                                                              builder: (context) => SelectedGoodsScreen(
                                                                id : good.id,
                                                                name : good.name,
                                                                subtitle : good.subtitle,
                                                                description : good.description,
                                                                image : good.image_url,                                                                
                                                                sizes : good.sizes,
                                                                enddate : good.end_date,
                                                                startdate : good.start_date,
                                                                venue : good.venue,                                                                
                                                               
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
                                                      ),                ),         ],          ),
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
                  ),
            
                                                                                  ],
                                                                                ),
                                                                              ),
                      ],
                    ),
                  )

                  ]
        ),
      ),
                    ]
        ))
    );

  }
}
