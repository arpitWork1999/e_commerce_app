import 'package:get/get.dart';

class LoaderController extends GetxController {
  var isloading = false.obs;

  void showLoader(){
    isloading.value = true;
  }
  void hideLoader(){
    isloading.value = false;
  }
}
