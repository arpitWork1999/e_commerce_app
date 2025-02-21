import 'package:e_commerce_app/features/favorites/screen/favorites_screen.dart';
import 'package:e_commerce_app/features/home/controller/home_screen_controller.dart';
import 'package:e_commerce_app/features/home_page/screen/home_page.dart';
import 'package:e_commerce_app/features/otp_screen/controller/otp_screen_controller.dart';
import 'package:e_commerce_app/features/otp_screen/screen/otp_screen.dart';
import 'package:e_commerce_app/features/shop/screen/shop_screen.dart';
import 'package:e_commerce_app/features/sign_up/controller/sign_up_screen_controller.dart';
import '../../features/bag/controller/bag_screen_controller.dart';
import '../../features/bag/screen/bag_screen.dart';
import '../../features/favorites/controller/favorites_screen_controller.dart';
import '../../features/forgot_password/controller/forgot_password_controller.dart';
import '../../features/forgot_password/screen/forgot_password_screen.dart';
import '../../features/home_page/controller/home_page_controller.dart';
import '../../features/login/controller/login_screen_controlller.dart';
import '../../features/login/screen/login_screen.dart';
import '../../features/shop/controller/shop_screen_controller.dart';
import '../../features/sign_up/screen/sign_up_screen.dart';
import 'package:get/get.dart';

class Routes {
  Routes._();
  static const String signUp = "/signUp";
  static const String login = "/login";
  static const String forgotPassword = "/forgotPassword";
  static const String homePage = "/homePage";
  static const String home = "/home";
  static const String shop = "/shop";
  static const String bag = "/bag";
  static const String favorites = "/favorites";
  static const String profile = "/profile";
  static const String otpScreen = "/otpScreen";


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
            name: Routes.homePage,
            page: () => HomePageScreen(),
            binding: BindingsBuilder(() {
              Get.put<HomePageController>(HomePageController());
            })),
        GetPage(
            name: Routes.home,
            page: () => HomePageScreen(),
            binding: BindingsBuilder(() {
              Get.put<HomeScreenConroller>(HomeScreenConroller());
            })),
        GetPage(
            name: Routes.shop,
            page: () => ShopScreen(),
            binding: BindingsBuilder(() {
              Get.put<ShopScreenController>(ShopScreenController());
            })),
        GetPage(
            name: Routes.bag,
            page: () => BagScreen(),
            binding: BindingsBuilder(() {
              Get.put<BagScreenController>(BagScreenController());
            })),
        GetPage(
            name: Routes.favorites,
            page: () => FavoritesScreen(),
            binding: BindingsBuilder(() {
              Get.put<FavoritesScreenController>(FavoritesScreenController());
            })),
        GetPage(
            name: Routes.otpScreen,
            page: () => OtpScreen(),
            binding: BindingsBuilder(() {
              Get.put<OtpScreenController>(OtpScreenController());
            }))
      ];
}
