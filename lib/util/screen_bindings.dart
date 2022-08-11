import 'package:get/get.dart';
import 'package:movie_app/controller/home_controller.dart';
import 'package:movie_app/controller/movie_detail_controller.dart';
import 'package:movie_app/controller/view_movie_controller.dart';

class ScreenBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ViewMovieController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => MovieDetailController());
  }


}