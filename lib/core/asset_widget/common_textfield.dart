import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class UiTextFieldWidget extends StatefulWidget {
  final String? titleText;
  final TextInputType? keyboardType;
  final bool isObscure;
  final FormFieldValidator<String>? validator;
  final TextAlign? titleTextAlign;
  final bool? isPassword;
  final String? hintText;
  final TextEditingController? controller;

  const UiTextFieldWidget({
    super.key,
    this.titleText,
    this.keyboardType,
    this.isObscure = false,
    this.validator,
    this.titleTextAlign,
    this.isPassword,
    this.hintText,
    this.controller,
  });

  @override
  State<UiTextFieldWidget> createState() => _UiTextFieldWidgetState();
}

class _UiTextFieldWidgetState extends State<UiTextFieldWidget> {
  bool isObscured = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      isObscured = widget.isObscure;
    });
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: isObscured,
      onTapOutside: (event){
         FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        suffixIcon:
            widget.isObscure ?
        GestureDetector(
          onTap: () {
            setState(() {
              isObscured = !isObscured;
            });
          },
          child: Icon(
            !isObscured
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            size: 22.sp,
            color: Colors.grey[400],
          ),
        ) : SizedBox(),
        filled: true,
        fillColor: Colors.white,
        hintText: widget.hintText,
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
