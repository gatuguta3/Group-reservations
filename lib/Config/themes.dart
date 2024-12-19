
import 'package:flutter/material.dart';

const primarycolor = Color(0xFF00563B);

const secondarycolor =Color(0xFF018749);

const orangecolor = Color.fromARGB(255, 226, 161, 64);

const cardcolor = Color.fromARGB(255, 235, 245, 243);

const  greycardcolor = Color.fromARGB(134, 158, 158, 158);

const whitecolor = Color.fromARGB(28, 221, 221, 221);


class CustomButtonStyle {
  static ButtonStyle buttonStyle() {
    return ElevatedButton.styleFrom(
      foregroundColor: Colors.white, backgroundColor: const Color.fromARGB(255, 89, 179, 253), shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),         
      ), 
      minimumSize: Size(250, 40),
    );
  }

  static ButtonStyle buttonStyle2() {
    return ElevatedButton.styleFrom(
      foregroundColor: Colors.white, backgroundColor: primarycolor, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),        

      ), 
      minimumSize: Size(290, 40),
    );
  }
  static ButtonStyle buttonStyle3() {
    return ElevatedButton.styleFrom(
      foregroundColor: Colors.white, backgroundColor: primarycolor, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),        

      ), 
      minimumSize: Size(200, 30),
    );
  }

  static ButtonStyle buttonStyle4() {
    return ElevatedButton.styleFrom(
      foregroundColor: Colors.white, backgroundColor: primarycolor, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),        

      ), 
      minimumSize: Size(80, 30),
    );
  }

  static ButtonStyle outlinedButtonStyle() {
    return OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5), 
      ),      
      minimumSize: Size(80, 30),
      side: const BorderSide(color: primarycolor), 
      textStyle: const TextStyle(
        fontSize: 16,         
        color: primarycolor, 
      ),
    );
  }
}