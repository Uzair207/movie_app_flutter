class MovieModel{
  int movieId = -1;
  String url = "";
  String title = "";
  String tagLine = "";
  String releaseDate = "";
  String language = "";
  String overView = "";
  double rating= 0.0;
  List<String> genres = [];
  List<String> productionCompanies = [];

  MovieModel.empty();

  MovieModel.fromJson(Map<String,dynamic> json){

    movieId = json['id']??-1;
    String tempPath = json['poster_path']??"";
    tempPath!=""?url="https://image.tmdb.org/t/p/w500"+tempPath:"";
    title = json['title']??"No Title Found";
    tagLine = json['tagline']??"No TagLine Found";
    releaseDate = json['release_date']??"No Release Date Found";
    language = json['original_language']??"No Language Found";
    overView = json['overview']??"No Summary Found";
    rating = json['vote_average']??-1;

  }
}