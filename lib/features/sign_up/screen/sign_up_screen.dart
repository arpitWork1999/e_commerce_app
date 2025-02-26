import 'package:e_commerce_app/core/asset_widget/common_button.dart';
import 'package:e_commerce_app/core/asset_widget/common_image_widget.dart';
import 'package:e_commerce_app/core/asset_widget/common_textfield.dart';
import 'package:e_commerce_app/core/constants/app_strings.dart';
import 'package:e_commerce_app/core/text/app_text_widget.dart';
import 'package:e_commerce_app/core/utils/image_resources.dart';
import 'package:e_commerce_app/features/loader/controller/loader_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/service/api_service/api_service.dart';
import '../controller/sign_up_screen_controller.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final formKey = GlobalKey<FormState>();

  final SignUpScreenController controller = Get.put(SignUpScreenController());

  ApiService apiService = ApiService();
  final LoaderController loaderController = Get.find<LoaderController>();

  Future<void> signUp() async {
    if (formKey.currentState!.validate()) {
      loaderController.showLoader();
      try {
        final response = await apiService.signUpApi(
          userName: controller.nameController.text.trim(),
          email: controller.emailController.text.trim(),
          password: controller.passController.text.trim(),
        );
        if (response.statusCode == 201) {
          controller.clearTextInput();
          Fluttertoast.showToast(msg: response.data!.message ?? '');
          Get.toNamed(Routes.login);
        }
      } catch (error) {
        Fluttertoast.showToast(
            msg: error.toString());
      } finally {
        loaderController.hideLoader(); // Stop Loading
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          surfaceTintColor: Colors.transparent,
          leading:
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextWidget.titleText(AppStrings.signUp),
                      SizedBox(
                        height: 50.h,
                      ),
                      UiTextFieldWidget(
                        controller: controller.nameController,
                        keyboardType: TextInputType.name,
                        hintText: AppStrings.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppStrings.enterEmail;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      UiTextFieldWidget(
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        hintText: AppStrings.email,
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r"^(?!.*\s)[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+(?!.*\s)")
                                  .hasMatch(value)) {
                            if (value == '') {
                              return AppStrings.enterEmail;
                            } else {
                              return AppStrings.provideEmailAddress;
                            }
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    UiTextFieldWidget(
                            controller: controller.passController,
                            keyboardType: TextInputType.text,
                            isObscure: true,
                            hintText: AppStrings.password,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppStrings.enterPassword;
                              }
                              return null;
                            },
                          ),
                      SizedBox(
                        height: 8.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.clearTextInput();
                          Get.offAllNamed(Routes.login);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AppTextWidget.NormalText(
                                AppStrings.alreadyHaveAnAccount),
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
                          //isShowIndicator: controller.isLoading.value,
                          text: AppStrings.signUp,
                          onPressed: () {
                            signUp();
                          }),
                      SizedBox(
                        height: 80.h,
                      ),
                      Center(
                          child: AppTextWidget.NormalText(
                              AppStrings.signUpOptions)),
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
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
