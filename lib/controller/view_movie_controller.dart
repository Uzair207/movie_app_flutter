import 'package:get/get.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/services/http_client_service.dart';


class ViewMovieController extends GetxController{
  RxList<MovieModel> moviesList = RxList();
  RxList<MovieModel> searchResults = RxList();
  RxBool status = false.obs;

@override
  void onInit()  {
    super.onInit();
     populateMoviesList();
  }

   onSearch(String query){
    searchResults.value=query.isEmpty?moviesList:moviesList.where((value) => value.title.toLowerCase().contains(query.toLowerCase())).toList();
  }

  void searchTapped(){
  if(status.value==false){
    status.value = true;
  }
  else{
    status.value = false;
  }
}


Future<void> populateMoviesList() async {
  moviesList.value=await HttpClientService().fetchAllMovies();
}

   showDetailScreen(MovieModel movie){
    Get.toNamed('/movie_details',arguments: movie);
  }
  void goBack(){
  Get.back();
  }

}