import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controller/view_movie_controller.dart';

class ViewMoviesScreen extends GetView<ViewMovieController> {
  const ViewMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(onPressed:controller.goBack,icon: const Icon(Icons.arrow_back,color: Colors.white,),),
        actions: [Container(
          color: Colors.red,
          width: Get.width*0.74,
          child:  Obx((){
            return Visibility(
              visible: controller.status.value,
              child: TextField(
                style: const TextStyle(color: Colors.white),
                onChanged: (value)=>controller.onSearch(value),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(top: 6,left: 10),
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.white),
                )
              ),
            );})
          ),
        IconButton(onPressed: (){controller.searchTapped();}, icon: const Icon(Icons.search,color: Colors.white,))],
      ),
      backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: Get.width,
                height: Get.height,
                child: Obx(() {
                  return controller.moviesList.isNotEmpty?ListView.builder(
                      itemCount: controller.searchResults.isNotEmpty?controller.searchResults.length:controller.moviesList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                            width: Get.width,
                            height: Get.height * 0.27,
                            child: Stack(
                              children: [
                                GestureDetector(
                                  onTap: ()=>controller.showDetailScreen(controller.searchResults.isNotEmpty?controller.searchResults[index]:controller.moviesList[index]),
                                  child: Card(
                                    color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(
                                              12)),
                                      child: Row(
                                          children: [
                                            SizedBox(
                                                width: Get.width * 0.32,
                                                height: Get.height * 0.27,
                                                child: ClipRRect(
                                                    borderRadius:
                                                    const BorderRadius
                                                        .only(
                                                        topLeft: Radius
                                                            .circular(
                                                            12),
                                                        bottomLeft: Radius
                                                            .circular(
                                                            12)),
                                                    child: Image.network(
                                                      controller.searchResults.isEmpty?controller.moviesList[index].url:controller.searchResults[index].url,
                                                      fit: BoxFit.fill,
                                                    ))),
                                            SizedBox(
                                              width: Get.width*0.5,
                                              child: Padding(
                                                padding: const EdgeInsets.only(top: 14, left: 10),
                                                child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.only(bottom: 3),
                                                        child: Text(
                                                          controller.searchResults.isEmpty?controller.moviesList[index].title:
                                                          controller.searchResults[index]
                                                              .title,
                                                          style: const TextStyle(
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        ),
                                                      ),
                                                      Text(
                                                        controller.searchResults.isEmpty?controller.moviesList[index].overView:
                                                        controller
                                                            .searchResults[index].overView,
                                                        maxLines: 4, overflow: TextOverflow.ellipsis,
                                                        style:
                                                        const TextStyle(
                                                            fontSize:
                                                            14,
                                                            color: Colors
                                                                .grey),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 18.0),
                                                        child: Align(alignment: Alignment.bottomLeft,child: Text(controller.searchResults.isEmpty?"Rating: ${controller.moviesList[index].rating.toString()}":"Rating: ${controller.searchResults[index].rating.toString()}",style: const TextStyle(fontWeight: FontWeight.bold),)),
                                                      )
                                                    ]
                                                ),
                                              ),
                                            ),

                                          ]
                                      )),
                                ),

                                Align(alignment: Alignment.bottomRight,child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: TextButton(onPressed:()=> controller.showDetailScreen(controller.searchResults.isNotEmpty?controller.searchResults[index]:controller.moviesList[index]), child: const Text("View More Details")),
                                ))
                              ],
                            )
                        );
                      }):Center(child: CircularProgressIndicator(),);
                }))));
  }
}
