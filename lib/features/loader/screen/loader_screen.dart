import 'package:e_commerce_app/features/loader/controller/loader_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class GlobalLoader extends StatelessWidget {
  const GlobalLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Get.find<LoaderController>().isloading.value? Center(
        child: Container(
          color: Colors.grey[200], // Background overlay
          child: Center(
            child: LoadingAnimationWidget.fourRotatingDots(
              color: Colors.red,
              size: 40,
            ),
          ),
        ),
      )
          : SizedBox.shrink();
    });
  }
}
