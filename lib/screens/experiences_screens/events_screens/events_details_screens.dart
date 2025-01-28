// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unnecessary_brace_in_string_interps, unused_import, unnecessary_string_interpolations, unused_local_variable, unused_element, unnecessary_null_comparison, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:group_reservations/components/custom_button_styles.dart';
import 'package:group_reservations/components/custom_text_form_field.dart';
import 'package:group_reservations/components/themes.dart';
import 'package:group_reservations/constants/colors.dart';
import 'package:group_reservations/models_demo/events_model.dart';
import 'package:group_reservations/models_demo/group_members_model.dart';
import 'package:group_reservations/models_demo/groups_model.dart';
import 'package:group_reservations/models_demo/reservation_model.dart';
import 'package:group_reservations/screens/Main%20Screeens/members_screen.dart';
import 'package:group_reservations/screens/Main%20Screeens/payment_screeen.dart';
import 'package:group_reservations/screens/reservations_screens/reservation_view_screen.dart';
import 'package:group_reservations/services_demo/groups_demodata.dart';
import 'package:intl/intl.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';


class EventsDetailsScreen extends StatefulWidget {

  final Events events;


  const EventsDetailsScreen(
    { 
      required this.events
      });

  @override
  State<EventsDetailsScreen> createState() => _SelectedExperienceScreenState();
}

class _SelectedExperienceScreenState extends State<EventsDetailsScreen> {



final List <Groups> groups = fetch_groups(); 
String currentDate = DateFormat('EEE, MMM d').format(DateTime.now());

@override
  void initState() {
    super.initState();  
      
    
  }

  String? formattedDate;

final TextEditingController reservationDateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();



//! Select Reservation Date
  void _reserveDate(BuildContext context, Map<String, dynamic> package) {
    // Parse start and end dates
  DateTime startDate = DateFormat('dd-MM-yyyy').parse(widget.events.start_date);
  DateTime endDate = DateFormat('dd-MM-yyyy').parse(widget.events.end_date);
  String currentDate = DateFormat('EEE, MMM d').format(DateTime.now());

  // Ensure selected has an initial value
  DateTime? selected = startDate;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              'Please set Reservation Date',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content: SizedBox(
            height: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: CustomTextFormField(
                    textEditingController: reservationDateController,
                    label: 'Reservation Date',
                    hintText: 'dd-mm-yyyy',
                    failedValidationText: 'Please select a reservation date',
                    readOnly: true,
                    onTap: () async {
                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: selected,
                        firstDate: startDate,
                        lastDate: endDate,
                      );
                      if (selectedDate != null) {
                        // Format the date to dd/mm/yyyy
                        String formattedDate = "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
                        reservationDateController.text = formattedDate;
                        setState(() {
                          formattedDate =formattedDate;
                        });
                      }
                    },
                    suffixIcon: Icon(
                      Icons.calendar_month,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Text(
                          'Proceed',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pop(context);
                            openReservationTypeDialog(context, package);
                            

                            
                          }
                        }),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
//



// select the type of reservation this is bettween chama and individual

void openReservationTypeDialog(BuildContext context, Map<String, dynamic> package) {   
    
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
                openChamaOptionsDialog(context , package);
              },
              child: Text("Chama"),
              style: CustomButtonStyle.outlinedButtonStyle(),
            ),
            ElevatedButton(
              onPressed: () {                
                Navigator.of(context).pop();
                openExperienceCompletionDialog(context , package);                
              },
              child: Text("Individual",style: TextStyle(color: Colors.white),),
              style: CustomButtonStyle.buttonStyle4(),
            ),
          ],
        );
      },
    );
  }

//the below group id is used in the members screen to filter the list of members that will be diaplayed
int? selectedGroupId;

// the dialog below opens a show dialog to select the group that  members will be picked from
void openChamaOptionsDialog(BuildContext context, Map<String, dynamic> package) async {   
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Please select a chama below', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500), ),
          content:Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //Text('Is this plan for an individual or Chama ?', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),

              Container(
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
                  activeColor: AppColors.primary,
                ),
                onTap: () {
                  setState(() {
                    selectedGroupId = group.groupid; // Select the group on tap
                  });
                  Navigator.of(context).pop();
                  openChamaOptionsDialog(context , package);
                },
              );
            },
          ),
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
                  openExperienceDetailsDialog(context , package);
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
   
// the counter variable is used to submit a demo group id to the reservation view page 
int counter = 0;

int generateSequentialId() {
  counter += 1;
  return counter;
}





bool make_collective_payment =false;

// selection of members  from the group selected above 
// the selectedMembers List stores the selected members
List<GroupMembers> selectedMembers = [];

void openExperienceDetailsDialog(BuildContext context, Map<String, dynamic> package) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text(
              'Experience Details (${package['name']}) ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Column(
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
                          'Cost per person KES ${package['price']}',
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
                          'Cover up to ${package['capacity']} people',
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
                                    color: Colors.white
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
                        activeColor: AppColors.primary,
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
                        backgroundColor: AppColors.primary,
                        content: const Text('No members selected.'),
                      ),
                    );
                  } else {
                    Navigator.of(context).pop();
                    openExperienceCompletionDialog(context, package);
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
                    SizedBox(width: 10,),
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


// the experience completion dialog that completes the processes in the events details  screen  that proceeds either to the payments  screen or the reserved view  events

void openExperienceCompletionDialog(BuildContext context, Map<String, dynamic> package) async{   
    
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Pay', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500), ),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.close,size: 30,),
              )
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

             Icon(Icons.check_circle, size: 60 , color: AppColors.secondary),
              SizedBox(height: 10,),
              Text('Reserved Succesfully',style: TextStyle(fontSize: 12 , fontWeight: FontWeight.w400)  ),
              SizedBox(height: 5,),
               Text('Reservation for ${package['name']} Package has been accepted ',style: TextStyle(fontSize: 12 , fontWeight: FontWeight.w200) , textAlign: TextAlign.center,   ),
               SizedBox(height: 5,),
               Text('Kindly proceed and Pay',style: TextStyle(fontSize: 12 , fontWeight: FontWeight.w200)  ),
               SizedBox(height: 10,),
                ElevatedButton(
              onPressed: () {                
                Navigator.of(context).pop();

                // get total function calculates the total cost , just in case the user selects make collective payment it calculates the total of all  users selected

             int totalamount = 0; 
             int price = package['price'];

              if (make_collective_payment == true ) { 
                totalamount = selectedMembers.length * price;                   
                
              } else {
                totalamount = price;
                
              }

              Navigator.push(context, MaterialPageRoute( builder: (context) => PaymentScreeen( amount: totalamount, ),), );
              clearAllTextFields();
                                
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("Proceed to Pay",style: TextStyle(color: Colors.white),),
                SizedBox(width: 10,),
                Icon(Icons.arrow_forward, color: Colors.white)
              ],),
              style: CustomButtonStyle.buttonStyle2()
            ),
            SizedBox(height: 10,),
            TextButton(onPressed: (){
              Navigator.of(context).pop();    
              
                // get total function calculates the total cost , just in case the user selects make collective payment it calculates the total of all  users selected

             int totalamount = 0; 
             int price = package['price'];

              if (make_collective_payment == true ) { 
                totalamount = selectedMembers.length * price;                   
                
              } else {
                totalamount = price;
                
              }         

               Reservation reservation = Reservation(
                eventName : widget.events.title,
                eventDate: widget.events.start_date,
                eventDescription: widget.events.description,
                eventReservationDate : widget.events.end_date,
                package_name : package['name'],
                package_capacity: package['capacity'],
                package_price : package['price'],
                package_status: package['status'],
                status : 'Not Paid',
                amount: totalamount,
               

             
            );

               Navigator.push( context, MaterialPageRoute( builder: (context) => ReservationViewScreen(reservation: reservation  ),) );
               clearAllTextFields();

            }, child: Text('View Reservation' , style: TextStyle( fontSize: 12 , color: Colors.grey , fontWeight: FontWeight.w200 , decoration: TextDecoration.underline),))


            ],
          ),
          actions: [
           
           
          ],
          
        );
      },
    );
  
  }
  
//function to clear controllers

void clearControllers(List<TextEditingController> controllers) => 
    controllers.forEach((controller) => controller.clear());

void clearAllTextFields() {
  clearControllers([reservationDateController]);
}

// logic to convert date format


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
                widget.events.image_url,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),             


            Row(children: [ 
                  SizedBox(width: 16,),  
                  Text(widget.events.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400), ),               
                  
                 ],),
            Row(children: [ 
                SizedBox(width: 16,), 
                Text(widget.events.subtitle  ,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
                ),
                                
                  
                 ],),
            Row(children: [ 
                  SizedBox(width: 16,),                 
                  Text('Venue: ${widget.events.venue}' ,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                ),
                 ],),

                 
            Row(
          children: [
            SizedBox(width: 16),
            Text(
              'Date: ${widget.events.start_date} - ${widget.events.end_date}',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            ),
          ],
        ),

            SizedBox(height: 10),
            Divider(thickness: 1,),
            SizedBox(height: 10),
            Row(children: [ 
                  SizedBox(width: 16,),                 
                  Text('What to expect :', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400), ),
                 ],),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child:Text(widget.events.description ,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
                ),
                 ),
            Row(children: [ 
                  SizedBox(width: 16,),                 
                  Text('Package include:' ,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                ),
                 ],),
             Padding(padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child:Text(widget.events.package_activities ,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
                ),
                 ),
            SizedBox(height: 10),
            Divider(thickness: 1,),
            SizedBox(height: 10),

             Row(children: [ 
                  SizedBox(width: 16,),                 
                  Text('Packages :', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400), ),
                 ],),

      

            // updated method of loading my packages
               SizedBox(
                    height: 210.0, // Adjust height as needed
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal, // Horizontal scrolling
                      itemCount: widget.events.packages.length,
                      itemBuilder: (context, index) {
                        final package = widget.events.packages[index];
                        return Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                            padding: EdgeInsets.all(8),
                          
                          child: Card(
                            elevation: 4,
                            
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start, 
                                children: [
                                  Text('${package['name']}',style: TextStyle(fontSize: 24 , fontWeight: FontWeight.w500)),
                                  SizedBox(height: 5,),
                                  Row(
                                    children: [

                                      Container(
                                  width: 30.0,
                                  height: 30.0,
                                  decoration: BoxDecoration(shape: BoxShape.circle,),
                                  child: Image.asset('icons/Home2.png', fit: BoxFit.cover),
                                ),
                                const SizedBox(width: 3,),
                                Text('KES ${package['price']}/Person',style: TextStyle(fontSize: 15 , fontWeight: FontWeight.w400)),

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
                                Text('Up to ${package['capacity']} people',style: TextStyle(fontSize: 15 , fontWeight: FontWeight.w400)),
                                          
                                    ],
                                  ),

                                

                                  SizedBox(height: 10,),

                                   Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             ElevatedButton(
                              onPressed: () { 
                                   if(package['status'] == 'Active'){
                                    //openDialog();
                                    //selectSize(size);
                                    _reserveDate(context, package);
                                    
                                   }else{

                                   }                    
                              },
                              child: Text('Reserve',style: TextStyle(color: Colors.white),),
                              style: CustomButtonStyle.buttonStyle2(),
                            ),                      
                          
                          ],)

                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )





          ],
        ),
      ),
      
    );
  }
}