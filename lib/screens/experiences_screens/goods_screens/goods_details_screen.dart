// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, sort_child_properties_last, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:group_reservations/components/custom_button_styles.dart';
import 'package:group_reservations/components/custom_text_form_field.dart';
import 'package:group_reservations/components/themes.dart';
import 'package:group_reservations/constants/colors.dart';
import 'package:group_reservations/models_demo/goods_model.dart';
import 'package:group_reservations/screens/Main%20Screeens/payment_screeen.dart';
import 'package:group_reservations/screens/reservations_screens/reservation_view_screen.dart';
import 'package:intl/intl.dart';

class GoodsDetailsScreen extends StatefulWidget {
 final Good goods;

 const GoodsDetailsScreen({

  required this.goods
 });

  @override
  State<GoodsDetailsScreen> createState() => _SelectedGoodsScreenState();
}

class _SelectedGoodsScreenState extends State<GoodsDetailsScreen> {

  DateTime? selected;
  final TextEditingController _dateController = TextEditingController();
  String currentDate = DateFormat('EEE, MMM d').format(DateTime.now());

  Map<String, dynamic>? selectedSize;

  void selectSize(Map<String, dynamic> size) {
    setState(() {
      selectedSize = size; // Update the selected size
    });
  }




final TextEditingController reservationDateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


//! Select Reservation Date
  void _reserveDate(BuildContext context, Map<String, dynamic> size) {
    // Parse start and end dates
  DateTime startDate = DateFormat('dd-MM-yyyy').parse(widget.goods.start_date);
  DateTime endDate = DateFormat('dd-MM-yyyy').parse(widget.goods.end_date);
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
                            openReservationTypeDialog(context, size);

                            
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



void openReservationTypeDialog(BuildContext context, Map<String, dynamic> size) {   
    
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
                openExperienceCompletionDialog(context , size);
              },
              child: Text("Chama"),
              style: CustomButtonStyle.outlinedButtonStyle(),
            ),
            ElevatedButton(
              onPressed: () {                
                Navigator.of(context).pop();
                openExperienceCompletionDialog(context, size);
                
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

void openExperienceCompletionDialog(BuildContext context, Map<String, dynamic> size) async{   
    
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

             Icon(Icons.check_circle, size: 60 , color: AppColors.secondary),
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
                                                               title: widget.goods.name,
                                                                description: widget.goods.description,
                                                                package_type: selectedSize!['size'],
                                                                price: selectedSize!['price_per_person'],
                                                                payment_status: 'Not paid',
                                                                reservation_status: 'Expired',
                                                                date_created: currentDate,
                                                                reservation_date: widget.goods.end_date,
                                                                                                                              
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
                widget.goods.image_url,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5),

            Row(children: [ 
                  SizedBox(width: 5,),                 
                  Text(widget.goods.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400), ),
                 ],),
             Row(children: [ 
                  SizedBox(width: 5,),                 
                  Text(widget.goods.subtitle  ,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
                ),
                 ],),
            Row(children: [ 
                  SizedBox(width: 5,),                 
                  Text('Venue: ${widget.goods.venue}' ,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
                 ],),
            Row(children: [ 
                  SizedBox(width: 5,),                 
                  Text('Date: ${widget.goods.start_date} - ${widget.goods.end_date}' ,
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
                    child:Text(widget.goods.description ,
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
                      itemCount: widget.goods.sizes.length,
                      itemBuilder: (context, index) {
                        final size = widget.goods.sizes[index];
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
                                    //openDialog();
                                    //selectSize(size);
                                    _reserveDate(context, size);
                                    
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