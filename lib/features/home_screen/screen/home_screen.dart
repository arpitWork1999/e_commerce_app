import 'package:e_commerce_app/features/home_screen/controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import '../../forgot_password/screen/forgot_password_screen.dart';
import '../../login/screen/login_screen.dart';
import '../../sign_up/screen/sign_up_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeScreenController navController = Get.put(HomeScreenController());

  final TextStyle unselectedLabelStyle =
      TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 12);

  final TextStyle selectedLabelStyle =
      TextStyle(color: Colors.red, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationValue(context, navController) {
    return Obx(() => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 40,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: unselectedLabelStyle,
          selectedLabelStyle: selectedLabelStyle,
          onTap: navController.changeTabIndex,
          currentIndex: navController.tabIndex.value,
          items: [
            BottomNavigationBarItem(
              icon: navController.tabIndex.value == 0
                  ? Icon(Symbols.home,
                      fill: 1,
                      weight: 100,
                      grade: 200,
                      opticalSize: 48,
                      color: Colors.red)
                  : Icon(Symbols.home,
                      weight: 100,
                      grade: 200,
                      opticalSize: 48,
                      color: Colors.grey),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: navController.tabIndex.value == 1
                  ? Icon(Symbols.shopping_cart,
                      fill: 1,
                      weight: 100,
                      grade: 200,
                      opticalSize: 48,
                      color: Colors.red)
                  : Icon(Symbols.shopping_cart,
                      weight: 100,
                      grade: 200,
                      opticalSize: 48,
                      color: Colors.grey),
              label: 'Shop',
            ),
            BottomNavigationBarItem(
              icon: navController.tabIndex.value == 2
                  ? Icon(Symbols.shopping_bag,
                      fill: 1,
                      weight: 100,
                      grade: 200,
                      opticalSize: 48,
                      color: Colors.red)
                  : Icon(Symbols.shopping_bag,
                      weight: 100,
                      grade: 200,
                      opticalSize: 48,
                      color: Colors.grey),
              label: 'Bag',
            ),
            BottomNavigationBarItem(
              icon: navController.tabIndex.value == 3
                  ? Icon(Symbols.favorite,
                      fill: 1,
                      weight: 100,
                      grade: 200,
                      opticalSize: 48,
                      color: Colors.red)
                  : Icon(Symbols.favorite,
                      weight: 100,
                      grade: 200,
                      opticalSize: 48,
                      color: Colors.grey),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: navController.tabIndex.value == 4
                  ? Icon(Symbols.person_outline,
                      fill: 1,
                      weight: 100,
                      grade: 200,
                      opticalSize: 48,
                      color: Colors.red)
                  : Icon(Symbols.person_outline,
                      weight: 100,
                      grade: 200,
                      opticalSize: 48,
                      color: Colors.grey),
              label: 'Profile',
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: navController.tabIndex.value,
            children: [
              SignUpScreen(),
              LoginScreen(),
              ForgotPasswordScreen(),
            ],
          )),
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
          ),
          child: buildBottomNavigationValue(context, navController)),
    );
  }
}
