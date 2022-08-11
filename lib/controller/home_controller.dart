import 'package:get/get.dart';


class HomeController extends GetxController{

  @override
  void onInit() {
    super.onInit();
  }
  void goToViewMoviesScreen(){

    Get.toNamed('/view_screen');
  }

}