import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'core/routes/app_routes.dart';
import 'features/loader/controller/loader_screen_controller.dart';
import 'features/loader/screen/loader_screen.dart';

void main() {
  Get.put(LoaderController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.grey[200],
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ));

    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => GetMaterialApp(
              builder: (context, child) {
                return Stack(
                  children: [
                    MediaQuery(
                      data: MediaQuery.of(context).copyWith(
                        boldText: false,
                        textScaler: TextScaler.linear(1.0),
                      ),
                      child: child ?? const SizedBox.shrink(),
                    ),
                    const GlobalLoader(),
                  ],
                );
              },
              debugShowCheckedModeBanner: false,
              getPages: Routes.appPages(),
              initialRoute: Routes.signUp,
              theme: ThemeData(
                  // fontFamily: CommonStrings.satoshi,
                  ),
            ));
  }
}
