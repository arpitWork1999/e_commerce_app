import 'package:e_commerce_app/features/otp_screen/controller/otp_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../core/asset_widget/common_button.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/service/api_service/api_service.dart';
import '../../../core/text/app_text_widget.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});

  final formKey = GlobalKey<FormState>();

  final OtpScreenController controller = Get.put(OtpScreenController());

  final ApiService apiService = ApiService();

  Future<void> otpVerify() async {
    if (formKey.currentState!.validate()) {
      try {
        final response =
            await apiService.otpApi(otp: controller.otpController.text.toString());
        if (response.statusCode == 200) {
          controller.clearTextInput();
          Fluttertoast.showToast(msg: response.data!.message ?? '');
          Get.toNamed(Routes.homePage);
          // await UserPreferences().saveUser(v);
          // Navigator.pushReplacement(
          //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
        }
      } catch (e) {
        Fluttertoast.showToast(msg: "An error occurred: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: FocusManager.instance.primaryFocus?.unfocus,
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            backgroundColor: Colors.grey[200],
            surfaceTintColor: Colors.transparent,
          ),
          body: Padding(
            padding: const EdgeInsets.all(25),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  AppTextWidget.titleText(AppStrings.otpScreen),
                  SizedBox(height: 10.h),
                  AppTextWidget.NormalText(AppStrings.otpScreenDescription),
                  SizedBox(height: 10.h),
                  //AppTextWidget.descriptionText(AppStrings.otpScreenDescription),
                  PinCodeTextField(
                    length: 6,
                    appContext: context,
                    autoFocus: true,
                    backgroundColor: Colors.transparent,
                    keyboardType: TextInputType.number,
                    enableActiveFill: true,
                    controller: controller.otpController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter OTP";
                      }
                      return null;
                    },
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8),
                      fieldHeight: 55.h,
                      fieldWidth: 45.w,
                      activeColor: Colors.white,
                      inactiveColor: Colors.white,
                      selectedColor: Colors.white,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                    ),
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                  SizedBox(height: 30.h),
                  CommonButton(
                      text: AppStrings.verify,
                      onPressed: () {
                        otpVerify();
                        // if (formKey.currentState!.validate()) {
                        //   controller.clearTextInput();
                        //   Get.toNamed(Routes.login);
                        // }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
