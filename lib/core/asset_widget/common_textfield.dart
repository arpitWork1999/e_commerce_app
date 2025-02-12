import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class UiTextFieldWidget extends StatelessWidget {
  final String? titleText;
  final TextInputType? keyboardType;
  final bool? isObscure;
  final FormFieldValidator<String>? validator;
  final TextAlign? titleTextAlign;
  final bool? isPassword;
  final String? hintText;
  final TextEditingController? controller;

  const UiTextFieldWidget(
      {super.key,
        this.titleText,
        this.keyboardType,
        this.isObscure,
        this.validator,
        this.titleTextAlign,
        this.isPassword,
        this.hintText,
        this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isObscure??false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: GoogleFonts.plusJakartaSans(
          textStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: Colors.grey[400],
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
