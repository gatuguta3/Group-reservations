// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:group_reservations/Components/scaffold_messenger.dart';
import 'package:group_reservations/Config/themes.dart';

class SelectedInsuranceScreen extends StatefulWidget {
  final int id;
  final String title;
  final String subtitle;
  final String image;
  final String description;
  final String provider;
  final List plans;
  const SelectedInsuranceScreen({
    
    required this.id,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.description,
    required this.provider,
    required this.plans,
  });

  @override
  State<SelectedInsuranceScreen> createState() => _SelectedInsuranceScreenState();
}

class _SelectedInsuranceScreenState extends State<SelectedInsuranceScreen> {


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
                  get_policy = true;
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


bool get_policy = false;

 final TextEditingController Name_controller = TextEditingController();
 final TextEditingController National_id_controller = TextEditingController();
 TextEditingController relationship_controller = TextEditingController();
   List<String> relationships = ['Child', 'Partner', 'Parent'];
  String? selected_relationship;

  final List selected_policy_members = [];
  


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
                onTap: (){},
                child: Icon(Icons.cancel_sharp,size: 20,),
              )
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
               TextField(   
                controller: relationship_controller,           
              readOnly: true,
              decoration: InputDecoration(
                hintText: "Child",                
                suffixIcon:  GestureDetector(
                  onTap: (){
                    showMenu(
                      context: context,
                      position: RelativeRect.fromLTRB(100, 100, 0, 0), // Position the menu
                      items: relationships.map((relationship) {
                        return PopupMenuItem<String>(
                          value: relationship,
                          child: Text(relationship),
                        );
                      }).toList(),
                    ).then((value) {
                      if (value != null) {
                        setState(() {
                          selected_relationship = value; 
                                                 
                        });
                      }    });     
                  },
                  child: Icon(Icons.arrow_drop_down, color: Colors.grey ) ),
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
                Navigator.of(context).pop();
                selected_policy_members.add(Name_controller);
                                
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

}

void payment_options_dialog () {

}

void make_claim_dialog () {

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
                        

                        
                        get_policy == false
                        ? Column(
                          children: [
                            Row(children: [
                              Text('Insurance Plans:', style: TextStyle(fontWeight: FontWeight.w400 , fontSize: 18)),
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
                                  Text(  'More info:', style: TextStyle(fontWeight: FontWeight.w400), ),
                                  Text(plan['more_info'],style: TextStyle(fontSize: 13 , fontWeight: FontWeight.w300)),
                                  SizedBox(height: 2,),
                                  Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  ElevatedButton( 
                                    onPressed: () {   select_reservation_type_Dialog();  },
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
                        : Column(children: [
                          ElevatedButton( 
                              onPressed: () {   },
                              child: Text('Submit for Evaluation',style: TextStyle(color: Colors.white),),
                              style: CustomButtonStyle.buttonStyle3(),
                          ),   
                          OutlinedButton(
                            onPressed: () { },
                              child: Text("Cancle Policy" ,style: TextStyle(color: primarycolor)),
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
                                    child: Icon(Icons.person_add_alt_1_outlined ),
                                   ),
                                   SizedBox(width: 10,),
                                   GestureDetector(
                                    onTap: (){},
                                    child: Icon(Icons.edit ),
                                   ),
                                   
                                   

                                   ],)),
                          SizedBox(height: 10),

                     ],
              ),
                        ],)
            ),
          ]
),       
                    
                   ));         
                                                   
                   

         
  }
}