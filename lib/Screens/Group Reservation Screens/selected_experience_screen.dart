// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:group_reservations/Config/themes.dart';
import 'package:group_reservations/Models/groups_model.dart';
import 'package:group_reservations/Models/packages_model.dart';
import 'package:group_reservations/Screens/Group%20Reservation%20Screens/members_screen.dart';
import 'package:group_reservations/Services/Demo_data/groups_demodata.dart';
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
final GroupsDemodata groups_demodata = GroupsDemodata();
final TextEditingController _dateController = TextEditingController();

@override
  void initState() {
    super.initState();
    
    _dateController.text = "Select a date range";
  }



void openDialog(BuildContext context) {
    
    

   
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Please set Reservation Date', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400), ),
          content: TextField(
            controller: _dateController,
            readOnly: true,
            decoration: InputDecoration(             
              
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
                openCustomDateRangePicker(context);
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


 void openCustomDateRangePicker(BuildContext context) async {

  String currentDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

  DateTime startDate = DateFormat('dd-MM-yyyy').parse(widget.startdate);
  DateTime endDate = DateFormat('dd-MM-yyyy').parse(widget.enddate);
  DateTimeRange selectedRange = DateTimeRange(start: startDate, end: endDate);

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      
      return AlertDialog(
        title: Text(currentDate),
        
        content: Container(
          width: 350,
          height: 250, // Mimic the size of the DatePicker dialog
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(thickness: 1,),
              // Calendar with range picker
              Expanded(
                child: CalendarDatePicker(
                  initialDate: startDate,
                  firstDate: startDate,
                  lastDate: endDate,
                  onDateChanged: (DateTime selected) {
                    // Update the start and end date dynamically
                    setState(() {
                      if (selected.isBefore(selectedRange.end)) {
                        selectedRange = DateTimeRange(
                          start: selected,
                          end: selectedRange.end,
                        );
                      } else {
                        selectedRange = DateTimeRange(
                          start: selectedRange.start,
                          end: selected,
                        );
                      }
                    });
                  },
                  initialCalendarMode: DatePickerMode.day,
                ),
              ),
            ],
          ),
        ),
        actions: [
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog without changes
            },
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _dateController.text ="${DateFormat('dd-MM-yyyy').format(selectedRange.start)} to ${DateFormat('dd-MM-yyyy').format(selectedRange.end)}";
              });
              Navigator.of(context).pop();
              openReservationTypeDialog(context); 

            },
            child: Text("Ok",style: TextStyle(color: Colors.white),),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 6, 94, 9),
            ),
          ),
        ],
      );
    },
  );
}


void openReservationTypeDialog(BuildContext context) {   
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Please set Reservation Date', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400), ),
          content:Text('Is this plan for an individual or Chama ?', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
          actions: [
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop(); 
                openChamaOptionsDialog(context);
              },
              child: Text("Chama"),
            ),
            ElevatedButton(
              onPressed: () {                
                Navigator.of(context).pop();
                
              },
              child: Text("Individual",style: TextStyle(color: Colors.white),),
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

int? selectedGroupId;

void openChamaOptionsDialog(BuildContext context) async {   
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Please select a chama below', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500), ),
          content:Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //Text('Is this plan for an individual or Chama ?', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
              FutureBuilder<List<Groups>>(
      future: groups_demodata.fetch_groups(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No groups found.'));
        }

        final groups = snapshot.data!;
         return Container(
          height: 200, 
          child: ListView.builder(
          itemCount: groups.length,
          itemBuilder: (context, index) {
            final group = groups[index];

            return ListTile(              
              leading: CircleAvatar(child:  Image.asset('icons/Group.png', width: 24, height: 24),                 
              ),
              title: Text( group.groupname, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color:  Colors.black, ),  ),
              trailing: Radio<int>(
                value: group.groupid, 
                groupValue: selectedGroupId,
                onChanged: (int? value) {
                  setState(() {
                    selectedGroupId = value; // Update the selected group 
                  });
                  
                },
                activeColor: Colors.black,
              ),
              onTap: () {
                setState(() {
                  selectedGroupId = group.groupid; // Select the group on tap
                });
                Navigator.of(context).pop();
                  openChamaOptionsDialog(context);
              },
            );
          },
         ));
      },
    )

              ]
          ),
          actions: [
           
            ElevatedButton(
              onPressed: () {                
                Navigator.of(context).pop();
                
                
              },
              child: Text("Proceed",style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 6, 94, 9), 
                                minimumSize: Size(90, 40), 
                              ),
            ),
          ],
          );
  }
    );         
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