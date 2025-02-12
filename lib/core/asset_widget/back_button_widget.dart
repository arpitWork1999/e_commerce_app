import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common_image_widget.dart';

class BackButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String imagePath;

  const BackButtonWidget({Key? key, this.onPressed,required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: AssetWidget(asset: Asset(path: imagePath, type: AssetType.svg)),
      onPressed: onPressed ?? () => Get.back(),
    );
  }
}
