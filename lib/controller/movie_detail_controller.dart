import 'package:get/get.dart';
import 'package:movie_app/model/movie_model.dart';

class MovieDetailController extends GetxController{
Rx<MovieModel> movie = MovieModel.empty().obs;
@override
  void onInit() {
    super.onInit();
    movie.value = Get.arguments;
  }


}