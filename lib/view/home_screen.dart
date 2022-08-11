import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:movie_app/controller/home_controller.dart';

class HomeScreen extends GetView<HomeController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Center(
          child: ElevatedButton(onPressed:controller.goToViewMoviesScreen,
            child: const Text("Go to Movies Section"),

          ),
        ),
      ),
    );
  }




}