import 'package:api_call/Modal/Compamentos/helper_modal.dart';
import 'package:api_call/Modal/modal_api.dart';
import 'package:flutter/material.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Api"),
      ),
      body: Column(
        children: [
          Container(
            height: 70,
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search_rounded),
                hintText: "search here ......",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: Api_Helper.api_helper.GetWallpaperData(search_data: ""),
                builder: (ctx, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("${snapshot.error}"),
                    );
                  } else if (snapshot.hasData) {
                    List<Wallpaper>? wallpaper =
                        snapshot.data as List<Wallpaper>?;
                    print("===================");
                    print("===================");
                    print(wallpaper);
                    print("===================");
                    return GridView.builder(
                        shrinkWrap: true,
                        itemCount: wallpaper!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                            mainAxisExtent: 300,
                            crossAxisCount: 2),
                        itemBuilder: (ctx, i) {
                          return Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.all(5),
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                image: NetworkImage(wallpaper[i].largeImageURL),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        });
                  }
                  return Container(
                    height: 100,
                    width: 360,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(""))),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
