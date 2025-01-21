// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:group_reservations/Components/scaffold_messenger.dart';
import 'package:group_reservations/Components/themes.dart';
import 'package:group_reservations/Components/themes.dart';
import 'package:group_reservations/Models_demo/policy_claims_model.dart';
import 'package:group_reservations/Models_demo/policy_members_model.dart';

class SelectedInsuranceScreen extends StatefulWidget {
  final int id;
  final String title;
  final String subtitle;
  final String image;
  final String description;
  final String provider;
  final List plans;
  final List payments;
  
  const SelectedInsuranceScreen({
    
    required this.id,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.description,
    required this.provider,
    required this.plans,
    required this.payments,
    
  });

  @override
  State<SelectedInsuranceScreen> createState() => _SelectedInsuranceScreenState();
}

class _SelectedInsuranceScreenState extends State<SelectedInsuranceScreen> {

   Map<String, dynamic>? selectedPlan;

  void selectPlan(Map<String, dynamic> plan) {
    setState(() {
      selectedPlan = plan; // Update the selected plan
    });
  }


void select_reservation_type_Dialog() {   
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Select Plan Type', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400), ),
            ],
          ),
          content: Text('Is this plan for an individual or Chama ?', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),           
          actions: [
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop(); 
                setState(() {
                  selected_plan_details = true;
                  get_policy = true;
                  plans = false;
                });
                 CustomSnackbar.show( context,
                'Operation successful !',
                backgroundColor: primarycolor, // Optional: Custom background color
              );
                
              },
              child: Text("Chama" ,style: TextStyle(color: primarycolor)),
              style: CustomButtonStyle.outlinedButtonStyle(),
            ),
            ElevatedButton(
              onPressed: () {                
                Navigator.of(context).pop();
                setState(() {
                  get_policy = true;
                  selected_plan_details = true;
                  plans = false;
                });
                CustomSnackbar.show( context,
                'Operation successful !',
                backgroundColor: primarycolor, // Optional: Custom background color
              );
                
              },
              child: Text("Individual",style: TextStyle(color: Colors.white),),
              style: CustomButtonStyle.buttonStyle4(),
            ),
          ],
        );
      },
    );
  }




bool plans =true;
bool selected_plan_details = false ;
bool get_policy = false;
bool make_payment = false;
bool make_payment_button = false;
bool all_payments = false;
bool is_policy_claimed = false;
bool show_claimed_policy = false;

 final TextEditingController Name_controller = TextEditingController();
 final TextEditingController National_id_controller = TextEditingController();
 TextEditingController relationship_controller = TextEditingController();
   List<String> relationships = ['Child', 'Partner', 'Parent'];
  String? selected_relationship;

  final List<Member> selected_policy_members = [];
  final List<Policy_Claims> policy_claims = [];
  


void new_policy_member_dialog () {

   showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('New policy member', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400), ),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pop(); 
                  clear_controllers ();
                },
              child: Icon(Icons.close, color: Colors.black54, size: 25, ),)
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            
            children: [

              SizedBox(height: 5,),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Full name', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500), ),
                ],
              ),

              TextField(
                controller: Name_controller,
                decoration: InputDecoration(
                hintText: "Edwin Wafula",
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5), // Rounded corners
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5), // Rounded corners
                  borderSide: BorderSide(color: Colors.grey), // Default border color
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5), // Rounded corners
                  borderSide: BorderSide(color: primarycolor, width: 2), // Focused border color and width
                ),
              ),
              ),

              SizedBox(height: 5,),


              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Relationship', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500), ),
                ],
              ),

              DropdownButtonFormField<String>(
                value: selected_relationship,
                decoration: const InputDecoration(                  
                  border: OutlineInputBorder(),
                ),
                items: [
                  'Child',
                  'Partner',
                  'Parent',
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      selected_relationship = newValue;
                    });
                  }
                },
              ),
               

              

              SizedBox(height: 5,),


              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('National Id (optional)', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500), ),
                ],
              ),

              TextField(
                controller: National_id_controller,
                decoration: InputDecoration(
                hintText: "10235409",
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5), // Rounded corners
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5), // Rounded corners
                  borderSide: BorderSide(color: Colors.grey), // Default border color
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5), // Rounded corners
                  borderSide: BorderSide(color: primarycolor, width: 2), // Focused border color and width
                ),
              ),
              ),

              SizedBox(height: 15,),
              Divider(thickness: 1, color: primarycolor,),
              SizedBox(height: 5,),             
            

            ],
          ),
          
          actions: [ 

           Row(
            children: [
               OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop();                
                
              },
              child: Text("Cancel" ,style: TextStyle(color: primarycolor)),
              style: CustomButtonStyle.outlinedButtonStyle(),
            ),
            SizedBox(width: 5,),
            ElevatedButton(
              onPressed: () {                
                if (Name_controller.text.isNotEmpty  && National_id_controller.text.isNotEmpty &&  selected_relationship!= null ) {
                  Navigator.of(context).pop();
                  setState(() {
                    // Add the member to the list
                    selected_policy_members.add(Member(name: Name_controller.text));
                    clear_controllers ();// Clear the TextField
                    selected_relationship = null;
                  });
                } else {
                  // Show a snackbar if the TextField is empty
                  CustomSnackbar.show( context,
                'Missing fields',
                backgroundColor: Colors.red, // Optional: Custom background color
              );
                 
                }
                                
              },
              child: Text("Add member",style: TextStyle(color: Colors.white),),
              style: CustomButtonStyle.buttonStyle4(),
            ),
            ],
           )
           
           
          ],
          
        );
      },
    );

}



void submit_evaluation_dialog () {


   showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Submit for Evaluation', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400), ),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pop(); 
                },
                child: Icon(Icons.cancel_sharp,size: 20,),
              )
            ],
          ),
          content: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('By proceeding you wont be able to modify this policy (adding beneficiaries or owner details)',  style: TextStyle(fontSize: 11), ),
                   ),
          actions: [ 

           Row(
            children: [
               OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop();                
                
              },
              child: Text("Cancel" ,style: TextStyle(color: primarycolor)),
              style: CustomButtonStyle.outlinedButtonStyle(),
            ),
            SizedBox(width: 25,),
            ElevatedButton(
              onPressed: () {     
                Navigator.of(context).pop();     
                setState(() {
                  make_payment = true;
                  make_payment_button = true;
                  get_policy = false ;                  
                });                     
                                
              },
              child: Text("Submit",style: TextStyle(color: Colors.white),),
              style: CustomButtonStyle.buttonStyle4(),
            ),
            ],
           )
           
           
          ],
          
        );
      },
    );



}

String? _selectedOption = 'M-Pesa';

void payment_options_dialog() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      String? _dialogSelectedOption = _selectedOption; // Local copy of the selected option
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setDialogState) {
          void _handleDialogRadioValueChange(String? value) {
            setDialogState(() {
              _dialogSelectedOption = value;
            });
            setState(() {
              _selectedOption = value; // Update the main state
            });
          }

          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Make policy payment',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Choose payment method:',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 3),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Radio<String>(
                            value: 'M-Pesa',
                            activeColor: primarycolor,
                            groupValue: _dialogSelectedOption,
                            onChanged: _handleDialogRadioValueChange,
                          ),
                          const Text('M-Pesa'),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Wallet',
                            activeColor: primarycolor,
                            groupValue: _dialogSelectedOption,
                            onChanged: _handleDialogRadioValueChange,
                          ),
                          const Text('Wallet'),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Bank',
                            activeColor: primarycolor,
                            groupValue: _dialogSelectedOption,
                            onChanged: _handleDialogRadioValueChange,
                          ),
                          const Text('Bank'),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Card',
                            activeColor: primarycolor,
                            groupValue: _dialogSelectedOption,
                            onChanged: _handleDialogRadioValueChange,
                          ),
                          const Text('Card'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            actions: [
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  CustomSnackbar.show(
                    context,
                    'Operation cancelled!',
                    backgroundColor: primarycolor,
                  );
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(color: primarycolor),
                ),
                style: CustomButtonStyle.outlinedButtonStyle(),
              ),
              SizedBox(width: 25,),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  //make_claim_dialog();
                 setState(() {
                  make_payment_button = false;
                   all_payments = true;
                   is_policy_claimed = true;
                 });
                 
                },
                child: Text(
                  "Pay",
                  style: TextStyle(color: Colors.white),
                ),
                style: CustomButtonStyle.buttonStyle4(),
              ),
            ],
          );
        },
      );
    },
  );
}


void make_claim_dialog () {

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            
            children: [
              Text('Make Claim', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), ),
            ],
          ),
          content: Text('Are you sure you want to make claim on this policy ?', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),           
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop(); 
                setState(() {
                  //
                });
                 CustomSnackbar.show( context,
                'Operation successful !',
                backgroundColor: primarycolor, // Optional: Custom background color
              );
                
              },
              child: Text("Cancel" ,style: TextStyle(color: primarycolor)),
              style: CustomButtonStyle.outlinedButtonStyle(),
            ),
            
            ElevatedButton(
              onPressed: () {                
                Navigator.of(context).pop();
                setState(() {
                  show_claimed_policy = true;
                });
                policy_claims.add(Policy_Claims(owner: 'Edwin Wafula' , daterequested: DateTime.now() , status : 'Requested'));
                CustomSnackbar.show( context,
                'Operation successful !',
                backgroundColor: primarycolor, // Optional: Custom background color
              );
                
              },
              child: Text("Proceed",style: TextStyle(color: Colors.white),),
              style: CustomButtonStyle.buttonStyle4(),
            ),
              ],
            ),
          ],
        );
      },
    );

}

void clear_controllers () {
   Name_controller.clear();
   National_id_controller.clear();
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
            Padding( padding: const EdgeInsets.symmetric(horizontal: 16.0),
                   child: Column(
                    children: [
                      Row(children: [
                        Text(widget.title, style: TextStyle(fontWeight: FontWeight.w400 , fontSize: 18)),
                      ],),
                      SizedBox(height: 5),
                      

                      selected_plan_details == false

                      ? Column(
                        children: [
                          const Divider(thickness: 1),
                      Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Column(crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text('Subtitle'),
                                       Text(  widget.subtitle, style: TextStyle(fontSize: 11, color: Color.fromARGB(125, 0, 0, 0)),  ),        ],  ),
                             Column( crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [ Text('Provider'),
                                                 Text( widget.provider, style: TextStyle(fontSize: 11, color: Color.fromARGB(125, 0, 0, 0)),
                                                      ), ],),
                                                      
                                                      
                                                      ],),

                        const Divider(thickness: 1),

                        Text( widget.description, style: TextStyle(fontSize: 11),),
                        const Divider(thickness: 1),
                        const SizedBox(height: 10),
                        ],
                      )
                      : Column(
                        children: [
                          const Divider(thickness: 1),
                      Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Column(crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                      Text(  widget.provider, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),  ),
                                      Text('Providers' , style: TextStyle(fontSize: 11, color: Color.fromARGB(125, 0, 0, 0)),),        ],  ),
                                       
                                       
                              Column(crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [                                       
                                       Text(  '${selectedPlan!['name']}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),  ),  
                                       Text('${selectedPlan!['name']} - ${selectedPlan!['claims']}' , style: TextStyle(fontSize: 11, color: Color.fromARGB(125, 0, 0, 0)),),      ],  ),
                             Column( crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [ 
                                                 Text( '${selectedPlan!['status']}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400), ), 
                                                      Text('Status' , style: TextStyle(fontSize: 11, color: Color.fromARGB(125, 0, 0, 0)),),
                                                      ],),
                                                      
                                                      
                                                      ],),

                        const Divider(thickness: 1),
                        Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Column(crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text('${selectedPlan!['cost_to_cover']}' , style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                       Text(  'Cover', style: TextStyle(fontSize: 11, color: Color.fromARGB(125, 0, 0, 0)),  ),        ],  ),
                             Column( crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [ Text('Ksh ${selectedPlan!['price_per_person']}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                                 Text( '${selectedPlan!['name']}', style: TextStyle(fontSize: 11, color: Color.fromARGB(125, 0, 0, 0)),        ), ],),

                              Column( crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [ Text('${selectedPlan!['max_members']}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                                 Text( 'Max members',   style: TextStyle(fontSize: 11, color: Color.fromARGB(125, 0, 0, 0)),      ), ],),
                                                                                                      
                                                      ],),

                        
                        Divider(thickness: 1),

                        Text( widget.description, style: TextStyle(fontSize: 11),),
                        const Divider(thickness: 1),
                        const SizedBox(height: 10),
                        ],
                      ),

                        
                        plans == true

                        ? Column(
                          children: [
                            Row(children: [
                              Text('Experience Plans:', style: TextStyle(fontWeight: FontWeight.w400 , fontSize: 18)),
                            ],),
                         SizedBox(height: 5),
                         SizedBox(
                    height: 250.0, // Adjust height as needed
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal, // Horizontal scrolling
                      itemCount: widget.plans.length,
                      itemBuilder: (context, index) {
                        final plan = widget.plans[index];
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
                                  Text(' ${plan['name']} - ${plan['claims']}',
                                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 5), 
                                  Row(
                                  children: [
                                  Container(
                                        width: 20.0,
                                        height: 20.0,
                                        decoration: BoxDecoration(shape: BoxShape.circle,),
                                        child: Image.asset('icons/Vector5.png', fit: BoxFit.cover),
                                      ),
                                  const SizedBox(width: 3,),
                                  Text('cover up to KES ${plan['cost_to_cover']}',style: TextStyle(fontSize: 13 , fontWeight: FontWeight.w300)),
                                ],
                                ), 
                                SizedBox(height: 2),                                  
                                  Row(
                                  children: [
                                  Container(
                                        width: 20.0,
                                        height: 20.0,
                                        decoration: BoxDecoration(shape: BoxShape.circle,),
                                        child: Image.asset('icons/Vector5.png', fit: BoxFit.cover),
                                      ),
                                  const SizedBox(width: 3,),
                                  Text('Pay only KES ${plan['price_per_person']} per person',style: TextStyle(fontSize: 13 , fontWeight: FontWeight.w300)),
                                ],
                                ),  
                                SizedBox(height: 2),
                                 Row(
                                  children: [
                                  Container(
                                        width: 20.0,
                                        height: 20.0,
                                        decoration: BoxDecoration(shape: BoxShape.circle,),
                                        child: Image.asset('icons/Vector5.png', fit: BoxFit.cover),
                                      ),
                                  const SizedBox(width: 3,),
                                  Text('Cover up to ${plan['max_members']} members',style: TextStyle(fontSize: 13 , fontWeight: FontWeight.w300)),
                                ],
                                ),                                  
                                  
                                  const SizedBox(height: 2),
                                  Text(  'Additional info:', style: TextStyle(fontWeight: FontWeight.w400), ),
                                  Text(plan['more_info'],style: TextStyle(fontSize: 13 , fontWeight: FontWeight.w300)),
                                  SizedBox(height: 2,),
                                  Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  ElevatedButton( 
                                    onPressed: () {   
                                      select_reservation_type_Dialog();
                                      selectPlan(plan);   },
                                    child: Text('Get Plan',style: TextStyle(color: Colors.white),),
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
                        )
                        : SizedBox(height: 5,),


                        get_policy == true

                        ? Column(children: [
                          ElevatedButton( 
                              onPressed: () { 
                                if(selected_policy_members.isEmpty){
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.red,
                                      content: const Text(
                                        'Please select a beneficiaries before proceeding.',
                                        style: TextStyle(fontSize: 13, color: Colors.white),
                                      ),
                                    ),
                                  );
                                }else{
                                  submit_evaluation_dialog (); 
                                }
                                 },
                              child: Text('Submit for Evaluation',style: TextStyle(color: Colors.white),),
                              style: CustomButtonStyle.buttonStyle3(),
                          ),   
                          OutlinedButton(
                            onPressed: () { 
                              setState(() {
                                get_policy == false;
                              });
                            },
                              child: Text("Cancel Policy" ,style: TextStyle(color: primarycolor)),
                              style: CustomButtonStyle.outlinedButtonStyle(),
                            ),

                          SizedBox(height: 20,),
                          Container(
                              width: 350,
                              height: 45,                                               
                              decoration: BoxDecoration(
                              color: greycardcolor,
                              ),                        
                            child: Row(                              
                              
                              children: [
                                  SizedBox(width: 10,),
                                   Text('Beneficiaries',style: TextStyle(color: Colors.white)),
                                   SizedBox(width: 150,),
                                    GestureDetector(
                                    onTap: (){
                                      new_policy_member_dialog ();
                                    },
                                    child: Icon(Icons.person_add_alt_1_outlined , color: Colors.white,),
                                   ),
                                   SizedBox(width: 10,),
                                   GestureDetector(
                                    onTap: (){},
                                    child: Icon(Icons.edit_note_outlined , color: Colors.white, ),
                                   ),
                                   
                                   

                                   ],)),
                          SizedBox(height: 10),

                                      SizedBox(
                    height: 50, // Set a fixed height for horizontal ListView
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: selected_policy_members.length,
                      itemBuilder: (context, index) {
                        final member = selected_policy_members[index];
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
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    
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
                                selected_policy_members.removeAt(index);
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),

                     ],
              )
                        : SizedBox(height: 1,),
                       
                       make_payment_button == true
                       ?   ElevatedButton( 
                              onPressed: () { payment_options_dialog ();  },
                              child: Text('Make Payment',style: TextStyle(color: Colors.white),),
                              style: CustomButtonStyle.buttonStyle3(),
                          )
                       :SizedBox(height: 1,),

                       make_payment ==true 

                       ? Column(children: [
                        

                          SizedBox(height: 20,),
                          Container(
                              width: 350,
                              height: 45,                                               
                              decoration: BoxDecoration(
                              color: greycardcolor,
                              ),                        
                            child: Row(                              
                              
                              children: [
                                  SizedBox(width: 10,),
                                   Text('Beneficiaries',style: TextStyle(color: Colors.white)),
                                   SizedBox(width: 150,),
                                    GestureDetector(
                                    onTap: (){
                                      
                                    },
                                    child: Icon(Icons.person_add_alt_1_outlined ),
                                   ),
                                   SizedBox(width: 10,),
                                   GestureDetector(
                                    onTap: (){},
                                    child: Icon(Icons.edit ),
                                   ),
                                   
                                   

                                   ],)),
                          SizedBox(height: 10),

                          SizedBox(
                    height: 50, // Set a fixed height for horizontal ListView
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: selected_policy_members.length,
                      itemBuilder: (context, index) {
                        final member = selected_policy_members[index];
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
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
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
                                selected_policy_members.removeAt(index);
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),

                                           SizedBox(height: 20,),
                          Container(
                              width: 350,
                              height: 45,                                               
                              decoration: BoxDecoration(
                              color: greycardcolor,
                              ),                        
                            child: Row(                              
                              
                              children: [
                                  SizedBox(width: 10,),
                                   Text('Policy Payments',style: TextStyle(color: Colors.black)),
                                                                  
                                   ],)),
                         
                          if(all_payments)
                          SizedBox(
                    height: 250.0, // Adjust height as needed
                    child: ListView.builder(
                      scrollDirection: Axis.vertical, // Horizontal scrolling
                      itemCount: widget.payments.length,
                      itemBuilder: (context, index) {
                        final payment = widget.payments[index];
                        return Container(
                          width: 250.0, // Width for each card
                          margin: const EdgeInsets.all(8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              
                              borderRadius: BorderRadius.circular(4 ),

                            ),
                            elevation: 0,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [


                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text('Transaction_Ref', style: TextStyle(fontWeight: FontWeight.w100, fontSize: 10, ), ),
                                          Text('  ${payment['Transaction_Ref']}', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, ), ),

                                        ],
                                      ),
                                      Column(
                                        children: [
                                           Text('Amount', style: TextStyle(fontWeight: FontWeight.w100, fontSize: 10, ), ),
                                          Text('Ksh:  ${payment['amount']}', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, ), ),


                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 3,),
                                  Divider(thickness: 1,),
                                  SizedBox(height: 3,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                           Text('Date Paid', style: TextStyle(fontWeight: FontWeight.w100, fontSize: 10, ), ),
                                          Text('  ${payment['date:paid']}', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, ), ),

                                        ],
                                      ),
                                      Column(
                                        children: [
                                           Text('status', style: TextStyle(fontWeight: FontWeight.w100, fontSize: 10, ), ),
                                          Text('  ${payment['status']}', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, ), ),
                                          
                                        ],
                                      )
                                    ],
                                  ),

                                  
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
               

                       

                          


                       ],)
                       : SizedBox(height: 2,),


                       is_policy_claimed == true
                       ? Column(
                        children: [

                          SizedBox(height: 20,),
                          Container(
                              width: 350,
                              height: 45,                                               
                              decoration: BoxDecoration(
                              color: greycardcolor,
                              ),                        
                            child: Row(                              
                              
                              children: [
                                  SizedBox(width: 10,),
                                   Text('Policy Claims',style: TextStyle(color: Colors.black)),
                                   SizedBox(width: 180,),                                 
                                   
                                   GestureDetector(
                                    onTap: (){
                                      make_claim_dialog();
                                    },
                                    child: Icon(Icons.add ,size: 30, color: Colors.white, ),
                                   ),
                                   
                                   

                                   ],)),
                          SizedBox(height: 10),
                          
                        ],
                       )
                       : SizedBox(height: 2,),

                       show_claimed_policy == true
                       ?  SizedBox(
                    height: 150, // Set a fixed height for horizontal ListView
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: policy_claims.length,
                      itemBuilder: (context, index) {
                        final claim = policy_claims[index];
                        return GestureDetector(
                          onTap:(){},
                          child: Container(
                          width: 330.0, // Width for each card
                          margin: const EdgeInsets.all(8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              
                              borderRadius: BorderRadius.circular(4 ),

                            ),
                            elevation: 0,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text('Policy owner', style: TextStyle(fontWeight: FontWeight.w100, fontSize: 10, ), ),
                                          Text('  ${claim.owner}', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13, ), ),

                                        ],
                                      ),
                                      Column(
                                        children: [
                                           Text('Date', style: TextStyle(fontWeight: FontWeight.w100, fontSize: 10, ), ),
                                          Text('${claim.daterequested}', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13, ), ),


                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 3,),
                                  Divider(thickness: 1,),
                                  SizedBox(height: 3,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                           Text('Status', style: TextStyle(fontWeight: FontWeight.w100, fontSize: 10, color: orangecolor ), ),
                                          Text('  ${claim.status}', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13, ), ),

                                        ],
                                      ),
                                      
                                    ],
                                  ),

                                  
                                ],
                              ),
                            ),
                          ),
                        )
                        );
                      },
                    ),
                  )

                       :SizedBox(height: 1,),


                                       


                        ],)
            ),
          ]
),       
                    
                   ));         
                                                   
                   

         
  }
}