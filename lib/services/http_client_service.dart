import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_app/model/movie_model.dart';

class HttpClientService{

  HttpClientService._internal();
  factory HttpClientService() {
    return _instance;
  }
  static final HttpClientService _instance= HttpClientService._internal();



  Future<List<MovieModel>> fetchAllMovies() async {

    List<MovieModel> moviesList=[];
    String _apiKey = '95d46f300bb34f26a1ba12f03ea58bc9';
    String _url = "https://api.themoviedb.org/3/trending/all/day?api_key=$_apiKey";
    Response res = await get(Uri.parse(_url));
    Map<String,dynamic> response=jsonDecode(res.body);
    List movies = response["results"];
    for(int i=0;i<movies.length;i++){
      moviesList.add(MovieModel.fromJson(movies[i]));
    }


    return moviesList;
  }

  Future<MovieModel> fetchMovie(int movieId) async {
    MovieModel movie;
    String _apiKey = '95d46f300bb34f26a1ba12f03ea58bc9';
    String _url = "https://api.themoviedb.org/3/movie/$movieId?api_key=$_apiKey";
    Response res = await get(Uri.parse(_url));
    Map<String,dynamic> response = jsonDecode(res.body);
    movie = MovieModel.fromJson(response);
    return movie;
  }






}