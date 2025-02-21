import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/asset_widget/common_button.dart';
import '../../../core/asset_widget/common_textfield.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/service/api_service/api_service.dart';
import '../../../core/text/app_text_widget.dart';
import '../controller/forgot_password_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final formKey = GlobalKey<FormState>();

  final ForgotPasswordScreenController controller =
      Get.put(ForgotPasswordScreenController());

  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            backgroundColor: Colors.grey[200],
            surfaceTintColor: Colors.transparent,
          ),
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: Form(
              key: formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextWidget.titleText(AppStrings.forgotPassword),
                    SizedBox(
                      height: 50.h,
                    ),
                    AppTextWidget.NormalText(
                        AppStrings.forgotPasswordScreenDescription),
                    SizedBox(
                      height: 15.h,
                    ),
                    UiTextFieldWidget(
                      isObscure: false,
                      keyboardType: TextInputType.text,
                      hintText: AppStrings.email,
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r"^(?!.*\s)[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+(?!.*\s)")
                                .hasMatch(value)) {
                          if (value == '') {
                            return "Please Enter Email";
                          } else {
                            return "Please provide a valid email address";
                          }
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    CommonButton(
                        text: AppStrings.send,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            controller.clearTextInput();
                            Get.toNamed(Routes.login);
                          }
                        }),
                  ]),
            ),
          )),
    );
  }
}
