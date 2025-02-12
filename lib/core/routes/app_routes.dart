import 'package:e_commerce_app/features/sign_up/controller/sign_up_screen_controller.dart';
import '../../features/forgot_password/controller/forgot_password_controller.dart';
import '../../features/forgot_password/screen/forgot_password_screen.dart';
import '../../features/home_screen/controller/home_screen_controller.dart';
import '../../features/home_screen/screen/home_screen.dart';
import '../../features/login/controller/login_screen_controlller.dart';
import '../../features/login/screen/login_screen.dart';
import '../../features/sign_up/screen/sign_up_screen.dart';
import 'package:get/get.dart';

class Routes {
  Routes._();
  static const String home = "/home";
  static const String signUp = "/signUp";
  static const String login = "/login";
  static const String forgotPassword = "/forgotPassword";
  static const String homeScreen = "/homeScreen";


  static List<GetPage> appPages() => [
        GetPage(
            name: Routes.signUp,
            page: () => SignUpScreen(),
            binding: BindingsBuilder(() {
              Get.put<SignUpScreenController>(SignUpScreenController());
            })),
        GetPage(
            name: Routes.login,
            page: () => LoginScreen(),
            binding: BindingsBuilder(() {
              Get.put<LoginScreenController>(LoginScreenController());
            })),
        GetPage(
            name: Routes.forgotPassword,
            page: () => ForgotPasswordScreen(),
            binding: BindingsBuilder(() {
              Get.put<ForgotPasswordScreenController>(
                  ForgotPasswordScreenController());
            })),
        GetPage(
            name: Routes.homeScreen,
            page: () => HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put<HomeScreenController>(
                  HomeScreenController());
            }))
      ];
}
