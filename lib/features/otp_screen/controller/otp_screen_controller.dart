import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OtpScreenController extends GetxController{
  final TextEditingController otpController = TextEditingController();

  clearTextInput() {
    otpController.clear();
  }
}