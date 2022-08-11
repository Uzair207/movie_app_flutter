import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controller/movie_detail_controller.dart';

class MovieDetailScreen extends GetView<MovieDetailController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SizedBox(width: Get.width,height: Get.height,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,children: [
            SizedBox(width: Get.width,height: Get.height*0.4,child: Image.network(
              controller.movie.value.url,fit: BoxFit.fill,
            ),),

        SizedBox(height: Get.height*0.03,),
        Container(margin: EdgeInsets.only(left: 10),child: Text("⭐  Rating ${controller.movie.value.rating}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),)),

        SizedBox(height: Get.height*0.05,),

        Container(
          height: Get.height*0.2,
          color: Colors.red[900],
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(width: Get.width*0.4,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                      Text("Title: "+controller.movie.value.title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,overflow: TextOverflow.fade),),

                Text("Original Language: "+controller.movie.value.language.toUpperCase(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,overflow: TextOverflow.fade),),
                    ],),
                  ),
                ),
              ),

              Spacer(),

              Align(
                alignment:Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Container(width: Get.width*0.3,
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,crossAxisAlignment: CrossAxisAlignment.start,children: [
                      Text("Released On: "+controller.movie.value.releaseDate,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      Text(controller.movie.value.tagLine,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    ],),
                  ),
                ),
              )
            ],
          ),
        ),



          Container(
            color: Colors.black,height: Get.height*0.27,child: Padding(
            padding: const EdgeInsets.only(left: 16,top: 10),
            child: SingleChildScrollView(
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Text(
                "Description:",style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,fontSize: 18,fontWeight: FontWeight.bold),

              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                    controller.movie.value.overView,style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,fontSize: 16),

                ),
              ),
          ],
              ),
            ),
          ),)


        ],
        ),
        ),
      ),
    );
  }

}