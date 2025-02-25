import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../text/app_text_widget.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  //final bool isShowIndicator;

  const CommonButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    //this.isShowIndicator = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40.h,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.r)),
        ),
        child: AppTextWidget(
          text: text,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
// child: isShowIndicator? SizedBox(
// width: 24,
// height: 24,
// child: CircularProgressIndicator(
// strokeWidth: 2,
// color: Colors.white,
// )): AppTextWidget(
// text: text,
// style: const TextStyle(
// color: Colors.white,
// fontSize: 16,
// fontWeight: FontWeight.w700),
// ),
