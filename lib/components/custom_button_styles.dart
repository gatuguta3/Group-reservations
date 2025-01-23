

import 'package:flutter/material.dart';
import 'package:group_reservations/constants/colors.dart';

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
      foregroundColor: Colors.white, backgroundColor: AppColors.primary, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),        

      ), 
      minimumSize: Size(280, 40),
    );
  }

  static ButtonStyle buttonStyle3() {
    return ElevatedButton.styleFrom(
      foregroundColor: Colors.white, backgroundColor: AppColors.primary, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),        

      ), 
      minimumSize: Size(200, 30),
    );
  }

  static ButtonStyle buttonStyle4() {
    return ElevatedButton.styleFrom(
      foregroundColor: Colors.white, backgroundColor: AppColors.primary, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),        

      ), 
      minimumSize: Size(80, 40),
    );
  }

  static ButtonStyle outlinedButtonStyle() {
    return OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5), 
      ),      
      minimumSize: Size(90, 40),
      side: const BorderSide(color: AppColors.primary), 
      textStyle: const TextStyle(
        fontSize: 16,         
        color: AppColors.primary, 
      ),
    );
  }
}