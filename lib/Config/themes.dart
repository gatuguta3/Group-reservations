
import 'package:flutter/material.dart';

const primarycolor = Color(0xFF00563B);

const secondarycolor =Color(0xFF018749);

const orangecolor = Color.fromARGB(255, 226, 161, 64);


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
      foregroundColor: Colors.white, backgroundColor: Color.fromARGB(255, 212, 174, 4), 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5), 
      ), 
      minimumSize: Size(200, 50),
    );
  }

  static ButtonStyle outlinedButtonStyle() {
    return OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5), 
      ),      
      side: const BorderSide(color: Color.fromARGB(206, 255, 255, 255)), 
      textStyle: const TextStyle(
        fontSize: 16, 
        fontWeight: FontWeight.bold, 
        color: Colors.white, 
      ),
    );
  }
}