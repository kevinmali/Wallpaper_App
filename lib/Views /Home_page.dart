import 'package:api_call/Modal/Compamentos/helper_modal.dart';
import 'package:api_call/Modal/modal_api.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  TextEditingController search_Controller = TextEditingController();
  String searchString = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              'Wall Paper',
              textStyle: const TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
              speed: const Duration(milliseconds: 1000),
            ),
          ],
          displayFullTextOnTap: true,
          repeatForever: true,
        ),
      ),
      body: FutureBuilder(
          future:
              Api_Helper.api_helper.GetWallpaperData(search_data: searchString),
          builder: (ctx, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              List<Wallpaper>? wallpaper = snapshot.data as List<Wallpaper>?;
              print("===================");
              print("===================");
              print(wallpaper);
              print("===================");

              return Column(
                children: [
                  Container(
                    height: 70,
                    child: SearchBarAnimation(
                      buttonWidget: Icon(Icons.search_rounded),
                      secondaryButtonWidget: Icon(Icons.search),
                      textEditingController: search_Controller,
                      isOriginalAnimation: true,
                      trailingWidget: Icon(Icons.search),
                      onFieldSubmitted: (String value) {
                        setState(() {
                          searchString = value;
                        });
                        search_Controller.clear();
                      },
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: wallpaper!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                            mainAxisExtent: 350,
                            crossAxisCount: 2),
                        itemBuilder: (ctx, i) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, 'detils',
                                  arguments: wallpaper[i]);
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                  image:
                                      NetworkImage(wallpaper[i].largeImageURL),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              );
            }
            return Container(
              height: 100,
              width: 360,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(""),
                ),
              ),
            );
          }),
    );
  }
}
