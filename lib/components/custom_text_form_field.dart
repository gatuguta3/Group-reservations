import 'package:flutter/material.dart';
import 'package:group_reservations/constants/colors.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.textEditingController,
    required this.label,
    required this.hintText,
    required this.failedValidationText,
    this.suffixIcon,
    this.obscureText,
    this.prefix,
    this.requiredAsterisk,
    this.keyboardType,
    this.onTap,
    this.readOnly = false, // Default value for readOnly
  });

  final TextEditingController textEditingController;
  final String label;
  final String hintText;
  final String failedValidationText;
  final Widget? suffixIcon;
  final bool? obscureText;
  final Widget? prefix;
  final String? requiredAsterisk;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;
  final bool readOnly; // Add this line

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                widget.label,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                ' *', // widget.requiredAsterisk == null ? '' :
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ),
          const SizedBox(height: 5),
          TextFormField(
            controller: widget.textEditingController,
            keyboardType: widget.keyboardType, //keyboardType: widget.readOnly ? TextInputType.none : widget.keyboardType, // Prevent keyboard if readOnly
            readOnly: widget.readOnly, // Set readOnly based on the parameter
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(color: const Color.fromARGB(255, 190, 189, 189)),
              suffixIcon: widget.suffixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primary),
              ),
            ),
            onTap: () {
              if (widget.onTap != null) {
                widget.onTap!();
              }
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return widget.failedValidationText;
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
