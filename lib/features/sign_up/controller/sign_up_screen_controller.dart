import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreenController extends GetxController{

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  var isLoading = false.obs;

  clearTextInput(){
    nameController.clear();
    emailController.clear();
    passController.clear();
  }
}