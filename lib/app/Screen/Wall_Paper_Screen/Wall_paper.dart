import 'package:api_call/Modal/modal_api.dart';
import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/material.dart';

class detils extends StatefulWidget {
  const detils({super.key});

  @override
  State<detils> createState() => _detilsState();
}

class _detilsState extends State<detils> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    Wallpaper wallpaper =
        ModalRoute.of(context)!.settings.arguments as Wallpaper;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Set WallPaper"),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: h,
            width: w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(wallpaper.largeImageURL),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://img.freepik.com/free-vector/hand-painted-watercolor-pastel-sky-background_23-2148902771.jpg?w=2000"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "VIEWS:${wallpaper.views}",
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://img.freepik.com/free-vector/hand-painted-watercolor-pastel-sky-background_23-2148902771.jpg?w=2000"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "LIKES:${wallpaper.likes}",
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              await AsyncWallpaper.setWallpaper(
                url: wallpaper.largeImageURL,
                wallpaperLocation: AsyncWallpaper.BOTH_SCREENS,
                goToHome: true,
              );
            },
            child: Container(
              height: 40,
              width: 260,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: NetworkImage(
                        "https://img.freepik.com/free-vector/hand-painted-watercolor-pastel-sky-background_23-2148902771.jpg?w=2000"),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  "Set WallPaper",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
