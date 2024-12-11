// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:group_reservations/Models/packages_model.dart';
import 'package:group_reservations/Services/Demo_data/packages_demodata.dart';
import 'package:intl/intl.dart';

class SelectedExperienceScreen extends StatefulWidget {

  final int experience_id;
  final String image;
  final String experience_title;
  final String experience_description;
  final String experience_activities;
  final String experience_location;
  final String experience_occation;
  final String experience_subtitle;
  final String experience_venue;
  final String startdate;
  final String enddate;
  final int standardPrice;
  final String standardStatus;
  final int standardMaxPeople;
  final int premiumPrice;
  final String premiumStatus;
  final int premiumMaxPeople;


  const SelectedExperienceScreen(
    { 
      required this.experience_id,
      required this.image,
      required this.experience_title, 
      required this.experience_description, 
      required this.experience_location, 
      required this.experience_venue,
      required this.experience_occation, 
      required this.experience_subtitle, 
      required this.experience_activities,
      required this.enddate,
      required this.startdate,
      required this.standardPrice,
      required this.standardStatus,
      required this.standardMaxPeople,      
      required this.premiumPrice,
      required this.premiumStatus,
      required this.premiumMaxPeople
      });

  @override
  State<SelectedExperienceScreen> createState() => _SelectedExperienceScreenState();
}

class _SelectedExperienceScreenState extends State<SelectedExperienceScreen> {

final PackagesDemodata packages_demodata = PackagesDemodata();


void openDialog(BuildContext context) {
    
    String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

   
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Please set Reservation Date', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400), ),
          content: TextField(
            decoration: InputDecoration(
              labelText: currentDate, 
              prefixIcon: Icon(Icons.calendar_today), 
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {                
                Navigator.of(context).pop();
                datepickerDialog(context);
              },
              child: Text("Proceed",style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 6, 94, 9), 
                                minimumSize: Size(90, 40), 
                              ),
            ),
          ],
        );
      },
    );
  }


   void datepickerDialog (BuildContext context) async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(), 
          firstDate: DateTime.now(), 
          lastDate: DateTime(2100), 
        );
        if (pickedDate != null) {
          setState(() {
            //_dateController.text = pickedDate.toString(); 
          });
        }      
    }      
    
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width, 
              height: 300.0,
              child: Image.asset(
                widget.image,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5),

            Row(children: [ 
                  SizedBox(width: 5,),                 
                  Text(widget.experience_title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400), ),
                 ],),
             Row(children: [ 
                  SizedBox(width: 5,),                 
                  Text(widget.experience_subtitle  ,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
                ),
                 ],),
            Row(children: [ 
                  SizedBox(width: 5,),                 
                  Text('Venue: ${widget.experience_venue}' ,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
                ),
                 ],),
            Row(children: [ 
                  SizedBox(width: 5,),                 
                  Text('Date: ${widget.startdate} - ${widget.enddate}' ,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
                ),
                 ],),
            SizedBox(height: 10),
            Divider(thickness: 1,),
            SizedBox(height: 10),
            Row(children: [ 
                  SizedBox(width: 5,),                 
                  Text('What to expect :', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400), ),
                 ],),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child:Text(widget.experience_description ,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
                ),
                 ),
            Row(children: [ 
                  SizedBox(width: 5,),                 
                  Text('Package include:' ,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w200),
                ),
                 ],),
            Row(children: [ 
                  SizedBox(width: 5,),                 
                  Text(widget.experience_activities ,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
                ),
                 ],),
            SizedBox(height: 10),
            Divider(thickness: 1,),
            SizedBox(height: 10),

             Row(children: [ 
                  SizedBox(width: 5,),                 
                  Text('Packages', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400), ),
                 ],),



        FutureBuilder<List<Packages>>(
        future: packages_demodata.fetchPackages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No packages found.'));
          }

          final packages = snapshot.data!;

          return SingleChildScrollView( 
            scrollDirection: Axis.horizontal,
            child: Row(
              children: packages.map((package) {
                return 
                  SizedBox(
                    width: 320,
                    child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Color.fromARGB(34, 0, 0, 0), width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                    color: Colors.white,
                    child:   Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(package.type,style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold)),
                          
                          package.type =='Standard'
                          ? Column(children: [

                          Row(
                            children: [
                             Container(
                                  width: 30.0,
                                  height: 30.0,
                                  decoration: BoxDecoration(shape: BoxShape.circle,),
                                  child: Image.asset('icons/Home2.png', fit: BoxFit.cover),
                                ),
                             const SizedBox(width: 3,),
                             Text('KES ${widget.standardPrice}/Person',style: TextStyle(fontSize: 15 , fontWeight: FontWeight.w400)),
                          ],
                          ),
                          SizedBox(height: 5,),

                          Row(
                            children: [
                             Container(
                                  width: 30.0,
                                  height: 30.0,
                                  decoration: BoxDecoration(shape: BoxShape.circle,),
                                  child: Image.asset('icons/Home21.png', fit: BoxFit.cover),
                                ),
                             const SizedBox(width: 3,),
                             Text('Up to ${widget.standardMaxPeople} people',style: TextStyle(fontSize: 15 , fontWeight: FontWeight.w400)),
                          ],
                          ),
                          SizedBox(height: 5,),

                          
                            Row(
                            children: [
                              widget.standardStatus == 'Active'
                              ? Container(
                                  width: 30.0,
                                  height: 30.0,
                                  decoration: BoxDecoration(shape: BoxShape.circle,),
                                  child: Image.asset('icons/Home22.png', fit: BoxFit.cover),
                                )
                              : Icon(size:40 ,color: Colors.red,Icons.cancel_outlined),                               
                             const SizedBox(width: 3,),
                             Text(widget.standardStatus,style: TextStyle(fontSize: 15 , fontWeight: FontWeight.w400)),
                          ],
                          ), 
                          ],)
                          : Column(children: [

                          Row(
                            children: [
                             Container(
                                  width: 30.0,
                                  height: 30.0,
                                  decoration: BoxDecoration(shape: BoxShape.circle,),
                                  child: Image.asset('icons/Home2.png', fit: BoxFit.cover),
                                ),
                             const SizedBox(width: 3,),
                             Text('KES ${widget.premiumPrice}/Person',style: TextStyle(fontSize: 15 , fontWeight: FontWeight.w400)),
                          ],
                          ),
                          SizedBox(height: 5,),

                          Row(
                            children: [
                             Container(
                                  width: 30.0,
                                  height: 30.0,
                                  decoration: BoxDecoration(shape: BoxShape.circle,),
                                  child: Image.asset('icons/Home21.png', fit: BoxFit.cover),
                                ),
                             const SizedBox(width: 3,),
                             Text('Up to ${widget.premiumMaxPeople} people',style: TextStyle(fontSize: 15 , fontWeight: FontWeight.w400)),
                          ],
                          ),
                          SizedBox(height: 5,),

                          
                            Row(
                            children: [
                              widget.premiumStatus == 'Active'
                              ? Container(
                                  width: 30.0,
                                  height: 30.0,
                                  decoration: BoxDecoration(shape: BoxShape.circle,),
                                  child: Image.asset('icons/Home22.png', fit: BoxFit.cover),
                                )
                              : Icon(size:30 ,color: Colors.red,Icons.cancel_outlined),                               
                             const SizedBox(width: 3,),
                             Text(widget.premiumStatus,style: TextStyle(fontSize: 15 , fontWeight: FontWeight.w400)),
                          ],
                          ), 
                          ]),      
                          
                          
                          SizedBox(height: 5,),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             ElevatedButton(
                              onPressed: () { 
                                   openDialog(context);                     
                              },
                              child: Text('Reserve',style: TextStyle(color: Colors.white),),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 6, 94, 9), 
                                minimumSize: Size(290, 40), 
                              ),
                            ),                      
                          
                          ],)

                          
                          
                        ],
                      ),
                    ),
                  ),
                  );

 
                
                }).toList(),
            ),
          );
        },
      ),




          ],
        ),
      ),
      
    );
  }
}