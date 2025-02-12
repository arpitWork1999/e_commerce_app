import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLine;

  const AppTextWidget({
    Key? key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLine,
    );
  }

  static Widget NormalText(String text,
      {double fontSize = 14, FontWeight fontWeight = FontWeight.w400}) {
    return AppTextWidget(
      text: text,
      style: GoogleFonts.plusJakartaSans(
        textStyle: TextStyle(
            fontSize: fontSize.sp,
            fontWeight: fontWeight,
            color: Colors.black
        ),
      ),
      textAlign: TextAlign.center,
    );
  }

  static Widget titleText(String text,
      {double fontSize = 32,
        FontWeight fontWeight = FontWeight.w700,
        Color color = Colors.black}) {
    return AppTextWidget(
      text: text,
      style: GoogleFonts.plusJakartaSans(
        textStyle: TextStyle(
          fontSize: fontSize.sp,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
      textAlign: TextAlign.center,
    );
  }

  static Widget descriptionText(String text,
      {double fontSize = 14, FontWeight fontWeight = FontWeight.w400}) {
    return AppTextWidget(
      text: text,
      style: GoogleFonts.plusJakartaSans(
        textStyle: TextStyle(
            fontSize: fontSize.sp,
            fontWeight: fontWeight,
            color: Colors.grey[600]
        ),
      ),
      textAlign: TextAlign.center,
    );
  }
}
