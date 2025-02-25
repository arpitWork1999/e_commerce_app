import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../core/asset_widget/common_button.dart';
import '../../../core/asset_widget/common_image_widget.dart';
import '../../../core/asset_widget/common_textfield.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/service/api_service/api_service.dart';
import '../../../core/text/app_text_widget.dart';
import '../../../core/utils/image_resources.dart';
import '../../loader/controller/loader_screen_controller.dart';
import '../controller/login_screen_controlller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final LoginScreenController controller = Get.put(LoginScreenController());
  final ApiService apiService = ApiService();
  final LoaderController loaderController = Get.find<LoaderController>();

  Future<void> logIn() async {
    if (formKey.currentState!.validate()) {
      loaderController.showLoader();
      try {
        final response = await apiService
            .logInApi(
            email: controller.emailController.text.trim(),
                password: controller.passController.text.trim());
          if (response.statusCode == 200) {
            controller.clearTextInput();
            Fluttertoast.showToast(msg: response.data!.message ?? '');
            Get.toNamed(Routes.otpScreen);
            // await UserPreferences().saveUser(v);
            // Navigator.pushReplacement(
            //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
          }
      } catch (e) {
        Fluttertoast.showToast(msg: "An error occurred: $e");
      }finally {
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
            leading: IconButton(onPressed: () {
              Get.toNamed(Routes.signUp);
            }, icon: Icon(Icons.arrow_back_ios)),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextWidget.titleText(AppStrings.login),
                      SizedBox(
                        height: 50.h,
                      ),
                      UiTextFieldWidget(
                        isObscure: false,
                        controller: controller.emailController,
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
                        height: 10.h,
                      ),
                      UiTextFieldWidget(
                        controller: controller.passController,
                        isObscure: true,
                        keyboardType: TextInputType.text,
                        hintText: AppStrings.password,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Password";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      GestureDetector(
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
                            // if (formKey.currentState!.validate()) {
                            //   controller.clearTextInput();
                            //   Get.toNamed(Routes.homePage);
                            // }
                            logIn();
                          }),
                      SizedBox(
                        height: 140.h,
                      ),
                      Center(
                          child: AppTextWidget.NormalText(
                              AppStrings.loginOptions)),
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
