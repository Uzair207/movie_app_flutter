import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/util/screen_bindings.dart';
import 'package:movie_app/view/home_screen.dart';
import 'package:movie_app/view/movie_detail_screen.dart';
import 'package:movie_app/view/view_movies_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: '/', page: ()=>HomeScreen(),binding: ScreenBindings()),
        GetPage(name: '/view_screen', page: ()=>const ViewMoviesScreen(),binding: ScreenBindings()),
        GetPage(name: '/movie_details', page: ()=>MovieDetailScreen(),binding: ScreenBindings())
      ],
      initialRoute: '/',
      initialBinding: ScreenBindings(),
    );
  }
}
