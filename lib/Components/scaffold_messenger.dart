
// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:group_reservations/Components/themes.dart';
import 'package:group_reservations/Constants/colors.dart';

class CustomSnackbar {
  /// Displays a reusable ScaffoldMessenger with a dismiss action.
  static void show(BuildContext context, String message, {Color backgroundColor = Colors.blue}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white)),
        backgroundColor: backgroundColor,
        action: SnackBarAction(
          label: 'Dismiss',
          textColor: AppColors.orangecolor,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar(); // Dismiss the snackbar
          },
        ),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(
          bottom: 30, // Raise the snackbar higher
          left: 16,
          right: 16,
        ),
        duration: const Duration(seconds: 1), // Snackbar visibility duration
      ),
    );
  }
}
