// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unnecessary_brace_in_string_interps, unused_import, unnecessary_string_interpolations, unused_local_variable, unused_element, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:group_reservations/Components/custom_button_styles.dart';
import 'package:group_reservations/Components/themes.dart';
import 'package:group_reservations/Constants/colors.dart';
import 'package:group_reservations/Models_demo/group_members_model.dart';
import 'package:group_reservations/Models_demo/groups_model.dart';
import 'package:group_reservations/Models_demo/packages_model.dart';
import 'package:group_reservations/Screens/Main%20Screeens/members_screen.dart';
import 'package:group_reservations/Screens/Main%20Screeens/payment_screeen.dart';
import 'package:group_reservations/Screens/reservations_screens/reservation_view_screen.dart';
import 'package:group_reservations/Services_demo/groups_demodata.dart';
import 'package:group_reservations/Services_demo/packages_demodata.dart';
import 'package:intl/intl.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';


class EventsDetailsScreen extends StatefulWidget {

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


  const EventsDetailsScreen(
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
  State<EventsDetailsScreen> createState() => _SelectedExperienceScreenState();
}

class _SelectedExperienceScreenState extends State<EventsDetailsScreen> {

final PackagesDemodata packages_demodata = PackagesDemodata();
final GroupsDemodata groups_demodata = GroupsDemodata();
late Future<List<Groups>> _groupsFuture; 
final TextEditingController _dateController = TextEditingController();
String currentDate = DateFormat('EEE, MMM d').format(DateTime.now());

@override
  void initState() {
    super.initState();  
     _groupsFuture = groups_demodata.fetch_groups();  
    
  }

  String ? selected_experience_type ;
  DateTime? selected;

void openDialog() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'Please set Reservation Date',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        content:GestureDetector(
          onDoubleTap: (){
            Navigator.of(context).pop(); // Close current dialog
                openCustomDateRangePicker(); 
          },
          child:  TextField(
          controller: _dateController,
          
          readOnly: true, // Ensures user cannot type directly
          decoration: InputDecoration(
            labelText: 'Select a date',
            prefixIcon: Icon(Icons.calendar_today),            
            border: const OutlineInputBorder(),
          ),
        ),
        
        ), 
        actions: [
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text("Cancel"),
            style: CustomButtonStyle.outlinedButtonStyle(),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
                openReservationTypeDialog();
            },
            style: CustomButtonStyle.buttonStyle4(),
            child: const Text(
              "Proceed",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    },
  );
}


void openCustomDateRangePicker() async {
  // Parse start and end dates
  DateTime startDate = DateFormat('dd-MM-yyyy').parse(widget.startdate);
  DateTime endDate = DateFormat('dd-MM-yyyy').parse(widget.enddate);
  String currentDate = DateFormat('EEE, MMM d').format(DateTime.now());

  // Ensure selected has an initial value
  DateTime? selected = startDate;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(currentDate),
        content: SizedBox(
          width: 350,
          height: 350, // Adjusted height for better usability
          child: Column(
            children: [
              const Divider(thickness: 1),
              Expanded(
                child: CalendarDatePicker(
                  initialDate: selected ?? startDate,
                  firstDate: startDate,
                  lastDate: endDate,
                  onDateChanged: (DateTime newSelectedDate) {
                    // Update the selected date
                    setState(() {
                      selected = newSelectedDate;
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
            child: const Text("Cancel"),
            style: CustomButtonStyle.outlinedButtonStyle(),
          ),
          ElevatedButton(
            onPressed: () {
              if (selected != null) {
                setState(() {
                  // Update the controller text with the selected date
                  _dateController.text = DateFormat('dd-MM-yyyy').format(selected!);
                });
              }
              Navigator.of(context).pop();
              openDialog(); // Trigger the next dialog or action
            },
           style: CustomButtonStyle.buttonStyle4(),
            child: const Text(
              "Ok",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    },
  );
}


void openReservationTypeDialog() {   
    
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
                openChamaOptionsDialog();
              },
              child: Text("Chama"),
              style: CustomButtonStyle.outlinedButtonStyle(),
            ),
            ElevatedButton(
              onPressed: () {                
                Navigator.of(context).pop();
                
              },
              child: Text("Individual",style: TextStyle(color: Colors.white),),
              style: CustomButtonStyle.buttonStyle4(),
            ),
          ],
        );
      },
    );
  }

int? selectedGroupId;



void openChamaOptionsDialog() async {   
    
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
      future: _groupsFuture, // Use the cached future
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
                leading: CircleAvatar(
                  child: Image.asset('images/edwin.jpeg', width: 24, height: 24),
                ),
                title: Text(
                  group.groupname,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
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
                  openChamaOptionsDialog();
                },
              );
            },
          ),
        );
      },
    )

              ]
          ),
          actions: [
           
            ElevatedButton(
              onPressed: () {                
                if(selectedGroupId == null){

                  ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red,
                    content: const Text(
                      'Please select a group before proceeding.',
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ),
                );

                }else{
                  Navigator.of(context).pop();
                  openExperienceDetailsDialog(context);
                }            
                
              },
              child: Text("Proceed",style: TextStyle(color: Colors.white),),
              style: CustomButtonStyle.buttonStyle4(),
            ),
          ],
          );
  }
    );         
  }
   

int counter = 0;

int generateSequentialId() {
  counter += 1;
  return counter;
}

int getTotal(){
   int totalamount = 0; 

              
              if (make_collective_payment == true ) {
                    if( selected_experience_type == "Standard"){
                      totalamount = selectedMembers.length * widget.standardPrice; 
                    }else{
                      totalamount = selectedMembers.length * widget.premiumPrice; 
                    }
                
              } else {

                if( selected_experience_type == "Standard"){
                      totalamount = widget.standardPrice; 
                    }else{
                      totalamount = widget.premiumPrice; 
                    }
                
              }

              return totalamount;
}

String get_experience_type(){
  String experience_type = "";

   if( selected_experience_type == "Standard"){
      experience_type =  "Standard";
        }else{
      experience_type =  "Premium";
      }
      return experience_type;

}

bool make_collective_payment =false;
List<GroupMembers> selectedMembers = [];

void openExperienceDetailsDialog(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text(
              'Experience Details ($selected_experience_type) - ${selectedMembers.length} members selected',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  selected_experience_type == 'Standard'
                  ? Column(
                          children: [
                          Row(
                          children: [
                          Container(
                          width: 20.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                          'icons/Home2.png',
                          fit: BoxFit.cover,
                          ),
                          ),
                          const SizedBox(width: 3),
                          Text(
                          'Cost per person KES ${widget.standardPrice}',
                          style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          ),
                          ),
                          ],
                          ),
                          SizedBox(height: 5),
                          Row(
                          children: [
                          Container(
                          width: 20.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                          'icons/Home21.png',
                          fit: BoxFit.cover,
                          ),
                          ),
                          const SizedBox(width: 3),
                          Text(
                          'Cover up to ${widget.standardMaxPeople} people',
                          style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          ),
                          ),
                          ],
                          ),
                          SizedBox(height: 5),
                          ],
                          )
                          : Column(
                          children: [
                          Row(
                          children: [
                          Container(
                          width: 20.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                          'icons/Home2.png',
                          fit: BoxFit.cover,
                          ),
                          ),
                          const SizedBox(width: 3),
                          Text(
                          'Cost per person KES ${widget.premiumPrice}',
                          style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          ),
                          ),
                          ],
                          ),
                          SizedBox(height: 5),
                          Row(
                          children: [
                          Container(
                          width: 20.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                          'icons/Home21.png',
                          fit: BoxFit.cover,
                          ),
                          ),
                          const SizedBox(width: 3),
                          Text(
                          'Cover up to ${widget.premiumMaxPeople} people',
                          style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          ),
                          ),
                          ],
                          ),
                          SizedBox(height: 5),
                          ],
                          ),


                  const SizedBox(height: 10),

                  Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 0,
    color: AppColors.cardcolor,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Add members to reservation',
            style: TextStyle(fontSize: 13),
          ),
          GestureDetector(
            onTap: () async {
              if (selectedGroupId != null) {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MembersScreen(group_id: selectedGroupId!),
                  ),
                );

                if (result != null && result is List<GroupMembers>) {
                  setState(() {
                    selectedMembers = result;
                  });
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red,
                    content: const Text(
                      'Please select a group before proceeding.',
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ),
                );
              }
            },
            child: const Icon(Icons.add, size: 25),
          ),
        ],
      ),
    ),
  ),

                  const SizedBox(height: 10),

                  // Display Selected Members
                  SizedBox(
                    height: 50, // Set a fixed height for horizontal ListView
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: selectedMembers.length,
                      itemBuilder: (context, index) {
                        final member = selectedMembers[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ActionChip(
                            backgroundColor: Color.fromRGBO(89, 71, 80, 1.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            label: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  member.name,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                                SizedBox(width: 5,),
                                Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black, 
                                      shape: BoxShape.circle, 
                                    ),
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.white, 
                                      size: 20, // Icon size
                                    ),
                                  )
                              ],
                            ),
                            onPressed: () {
                              setState(() {
                                selectedMembers.removeAt(index);
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),

                  // Collective Payment Checkbox
                  Row(
                    children: [
                      Checkbox(
                        activeColor: AppColors.primarycolor,
                        value: make_collective_payment,
                        onChanged: (bool? value) {
                          setState(() {
                            make_collective_payment = value ?? false;
                          });
                        },
                      ),
                      const Text(
                        'Make collective payments',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  if (selectedMembers.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: AppColors.primarycolor,
                        content: const Text('No members selected.'),
                      ),
                    );
                  } else {
                    Navigator.of(context).pop();
                    openExperienceCompletionDialog();
                  }
                },
                style:CustomButtonStyle.buttonStyle2(),
                
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Make reservation",
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ],
          );
        },
      );
    },
  );
}

void openExperienceCompletionDialog() async{   
    
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Pay', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500), ),
              GestureDetector(
                onTap: (){},
                child: Icon(Icons.close,size: 30,),
              )
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

             Icon(Icons.check_circle, size: 60 , color: AppColors.orangecolor),
              SizedBox(height: 10,),
              Text('Reserved Succesfully',style: TextStyle(fontSize: 12 , fontWeight: FontWeight.w400)  ),
              SizedBox(height: 5,),
               Text('Reservation for ${selected_experience_type} Package has been accepted ',style: TextStyle(fontSize: 12 , fontWeight: FontWeight.w200)  ),
               SizedBox(height: 5,),
               Text('Kindly proceed and Pay',style: TextStyle(fontSize: 12 , fontWeight: FontWeight.w200)  ),
               SizedBox(height: 10,),
                ElevatedButton(
              onPressed: () {                
                Navigator.of(context).pop();

             int totalamount = 0; 

              if (make_collective_payment == true ) {
                    if( selected_experience_type == "Standard"){
                      totalamount = selectedMembers.length * widget.standardPrice; 
                    }else{
                      totalamount = selectedMembers.length * widget.premiumPrice; 
                    }
                
              } else {

                if( selected_experience_type == "Standard"){
                      totalamount = widget.standardPrice; 
                    }else{
                      totalamount = widget.premiumPrice; 
                    }
                
              }

              Navigator.push(context, MaterialPageRoute( builder: (context) => PaymentScreeen( amount: totalamount, ),), );
                                
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("Proceed to Pay",style: TextStyle(color: Colors.white),),
                Icon(Icons.arrow_forward, color: Colors.white)
              ],),
              style: CustomButtonStyle.buttonStyle2()
            ),
            SizedBox(height: 10,),
            TextButton(onPressed: (){
              Navigator.of(context).pop();             

               Navigator.push( context, MaterialPageRoute( builder: (context) => ReservationViewScreen(
                                                               reservation_id : counter, 
                                                               title: widget.experience_title,
                                                                description: widget.experience_description,
                                                                package_type: get_experience_type(),
                                                                price: getTotal(),
                                                                payment_status: 'Not paid',
                                                                reservation_status: 'Expired',
                                                                date_created: currentDate,
                                                                reservation_date: widget.enddate,
                                                                                                                              
                                                              )
                                                            ),
                                                          );

            }, child: Text('View Reservation' , style: TextStyle( fontSize: 12 , color: Colors.grey , fontWeight: FontWeight.w200 , decoration: TextDecoration.underline),))


            ],
          ),
          actions: [
           
           
          ],
          
        );
      },
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
            Padding(padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child:Text(widget.experience_description ,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
                ),
                 ),
            Row(children: [ 
                  SizedBox(width: 5,),                 
                  Text('Package include:' ,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
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

                          SizedBox(height: 5,),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             ElevatedButton(
                              onPressed: () { 
                                   if(widget.standardStatus == 'Active'){
                                    openDialog();
                                    setState(() {
                                      selected_experience_type = package.type; // Update the selected group 
                                    }); 
                                   }else{

                                   }                    
                              },
                              child: Text('Reserve',style: TextStyle(color: Colors.white),),
                              style: CustomButtonStyle.buttonStyle2(),
                            ),                      
                          
                          ],)
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

                          SizedBox(height: 5,),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             ElevatedButton(
                              onPressed: () { 
                                   if(widget.premiumStatus == 'Active'){
                                    openDialog();
                                    setState(() {
                                      selected_experience_type = package.type; // Update the selected group 
                                    }); 
                                   }else{

                                   }                    
                              },
                              child: Text('Reserve',style: TextStyle(color: Colors.white),),
                              style: CustomButtonStyle.buttonStyle2(),
                            ),                      
                          
                          ],)
                          ]),      
                          
                          

                          
                          
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