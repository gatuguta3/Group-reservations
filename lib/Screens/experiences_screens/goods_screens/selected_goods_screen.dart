// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, sort_child_properties_last, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:group_reservations/Components/themes.dart';
import 'package:group_reservations/Screens/experiences_screens/events_screens/payment_screeen.dart';
import 'package:group_reservations/Screens/experiences_screens/events_screens/reservation_view_screen.dart';
import 'package:intl/intl.dart';

class SelectedGoodsScreen extends StatefulWidget {
 final int id;
 final String name;
 final String subtitle;
 final String venue;
 final String enddate;
 final String startdate;
 final String description;
 final List sizes;
 final String image;

 const SelectedGoodsScreen({

  required this.id,
  required this.name,
  required this.subtitle,
  required this.venue,
  required this.enddate,
  required this.startdate,
  required this.description,
  required this.sizes,
  required this.image,
 });

  @override
  State<SelectedGoodsScreen> createState() => _SelectedGoodsScreenState();
}

class _SelectedGoodsScreenState extends State<SelectedGoodsScreen> {

  DateTime? selected;
  final TextEditingController _dateController = TextEditingController();
  String currentDate = DateFormat('EEE, MMM d').format(DateTime.now());

  Map<String, dynamic>? selectedSize;

  void selectSize(Map<String, dynamic> size) {
    setState(() {
      selectedSize = size; // Update the selected size
    });
  }



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
          child:  Container(
            child: TextField(
          controller: _dateController,          
          readOnly: true, // Ensures user cannot type directly
          decoration: InputDecoration(
            labelText: 'Select a date',
            suffixIcon: Icon(Icons.calendar_today),            
            border: const OutlineInputBorder(),
          ),
        ),
          )
        
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
              if (_dateController =="") {
                // Show a snackbar if no date is selected
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: primarycolor,
                    content: const Text('No date selected'),
                  ),
                );
              } else {
                Navigator.of(context).pop(); // Close the dialog
                openReservationTypeDialog(); // Proceed to the next dialog
              }
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
                openExperienceCompletionDialog();
              },
              child: Text("Chama"),
              style: CustomButtonStyle.outlinedButtonStyle(),
            ),
            ElevatedButton(
              onPressed: () {                
                Navigator.of(context).pop();
                openExperienceCompletionDialog();
                
              },
              child: Text("Individual",style: TextStyle(color: Colors.white),),
              style: CustomButtonStyle.buttonStyle4(),
            ),
          ],
        );
      },
    );
  }


int counter = 0;

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

             Icon(Icons.check_circle, size: 60 , color: orangecolor),
              SizedBox(height: 10,),
              Text('Reserved Succesfully',style: TextStyle(fontSize: 12 , fontWeight: FontWeight.w400)  ),
              SizedBox(height: 5,),
               Text('Reservation for ${selectedSize!['size']} Package has been accepted ',style: TextStyle(fontSize: 12 , fontWeight: FontWeight.w200)  ),
               SizedBox(height: 5,),
               Text('Kindly proceed and Pay',style: TextStyle(fontSize: 12 , fontWeight: FontWeight.w200)  ),
               SizedBox(height: 10,),
                ElevatedButton(
              onPressed: () {                
                Navigator.of(context).pop();
             

              Navigator.push(context, MaterialPageRoute( builder: (context) => PaymentScreeen( amount: selectedSize!['price_per_person'] ),), );
                                
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
                                                               title: widget.name,
                                                                description: widget.description,
                                                                package_type: selectedSize!['size'],
                                                                price: selectedSize!['price_per_person'],
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
      body:  SingleChildScrollView(
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
                  Text(widget.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400), ),
                 ],),
             Row(children: [ 
                  SizedBox(width: 5,),                 
                  Text(widget.subtitle  ,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
                ),
                 ],),
            Row(children: [ 
                  SizedBox(width: 5,),                 
                  Text('Venue: ${widget.venue}' ,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
                 ],),
            Row(children: [ 
                  SizedBox(width: 5,),                 
                  Text('Date: ${widget.startdate} - ${widget.enddate}' ,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
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
                    child:Text(widget.description ,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
                ),
                 ),
           
            SizedBox(height: 10),
            Divider(thickness: 1,),
            SizedBox(height: 10),

             Row(children: [ 
                  SizedBox(width: 5,),                 
                  Text('Packages', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400), ),
                 ],),

             SizedBox(
                    height: 250.0, // Adjust height as needed
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal, // Horizontal scrolling
                      itemCount: widget.sizes.length,
                      itemBuilder: (context, index) {
                        final size = widget.sizes[index];
                        return Container(
                          width: 250.0, // Width for each card
                          margin: const EdgeInsets.all(8.0),
                          child: Card(
                            color: Color.fromRGBO(245, 245, 245, 1.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Size ${size['size']}',style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w500)),
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
                                Text('KES ${size['price_per_person']}/Person',style: TextStyle(fontSize: 15 , fontWeight: FontWeight.w400)),

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
                                Text('Up to ${size['max_number']} people',style: TextStyle(fontSize: 15 , fontWeight: FontWeight.w400)),
                                          
                                    ],
                                  ),

                                  SizedBox(height: 5,),
                                  Row(
                                    children: [

                                      size['status'] == 'Active'
                              ? Container(
                                  width: 30.0,
                                  height: 30.0,
                                  decoration: BoxDecoration(shape: BoxShape.circle,),
                                  child: Image.asset('icons/Home22.png', fit: BoxFit.cover),
                                )
                              : Icon(size:40 ,color: Colors.red,Icons.cancel_outlined),                               
                             const SizedBox(width: 3,),
                             Text(size['status'],style: TextStyle(fontSize: 15 , fontWeight: FontWeight.w400)),
                                      
                                    ],
                                  ),

                                  SizedBox(height: 10,),

                                   Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             ElevatedButton(
                              onPressed: () { 
                                   if(size['status'] == 'Active'){
                                    openDialog();
                                    selectSize(size);
                                    
                                   }else{

                                   }                    
                              },
                              child: Text('Reserve',style: TextStyle(color: Colors.white),),
                              style: CustomButtonStyle.buttonStyle3(),
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