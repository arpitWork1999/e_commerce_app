import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/asset_widget/common_button.dart';
import '../../../core/asset_widget/common_image_widget.dart';
import '../../../core/asset_widget/common_textfield.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/text/app_text_widget.dart';
import '../../../core/utils/image_resources.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextWidget.titleText(AppStrings.login),
                    SizedBox(
                      height: 50.h,
                    ),
                    UiTextFieldWidget(
                      isObscure: false,
                      keyboardType: TextInputType.text,
                      hintText: AppStrings.email,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    UiTextFieldWidget(
                      isObscure: true,
                      keyboardType: TextInputType.text,
                      hintText: AppStrings.password,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.forgotPassword);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AppTextWidget.NormalText(
                              AppStrings.forgotYourPassword),
                          Icon(
                            Icons.arrow_right_alt,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    CommonButton(
                        text: AppStrings.login,
                        onPressed: () {
                          Get.toNamed(Routes.homeScreen);
                        }),
                    SizedBox(
                      height: 140.h,
                    ),
                    Center(
                        child:
                            AppTextWidget.NormalText(AppStrings.loginOptions)),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        containerCard(imagePath: ImageResource.appleImage),
                        SizedBox(
                          width: 20.w,
                        ),
                        containerCard(imagePath: ImageResource.googleImage),
                      ],
                    ),
                  ]),
            ),
          )),
    );
  }

  Widget containerCard({String? imagePath}) {
    return Card(
      color: Colors.white,
      child: SizedBox(
        height: 60.h,
        width: 90.w,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: AssetWidget(
            asset: Asset(
              path: imagePath ?? "",
              type: AssetType.svg,
            ),
            boxFit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
