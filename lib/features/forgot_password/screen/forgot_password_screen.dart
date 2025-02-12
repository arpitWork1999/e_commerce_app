import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/asset_widget/common_button.dart';
import '../../../core/asset_widget/common_textfield.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/text/app_text_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            backgroundColor: Colors.grey[200],
          ),
          body: Padding(
            padding: const EdgeInsets.all(12),
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              AppTextWidget.titleText(AppStrings.forgotPassword),
              SizedBox(
                height: 50.h,
              ),
              AppTextWidget.NormalText(AppStrings.forgotPasswordScreenDescription),
              SizedBox(
                height: 15.h,
              ),
              UiTextFieldWidget(
                isObscure: false,
                keyboardType: TextInputType.text,
                hintText: AppStrings.email,
              ),

              SizedBox(
                height: 30.h,
              ),
              CommonButton(text: AppStrings.send, onPressed: () {}),

            ]),
          )),
    );
  }
}
