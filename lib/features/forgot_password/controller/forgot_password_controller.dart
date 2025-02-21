import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreenController extends GetxController {
  final TextEditingController emailController = TextEditingController();

  clearTextInput() {
    emailController.clear();
  }
}
