import 'dart:convert';
import 'package:api_call/Modal/modal_api.dart';
import 'package:http/http.dart' as http;

class Api_Helper {
  Api_Helper._();

  static Api_Helper api_helper = Api_Helper._();

  Future<List<Wallpaper>?> GetWallpaperData(
      {required String search_data}) async {
    String HostName = "https://pixabay.com";
    String Apikey = "38985341-7b8274a101e1481f09c5f7af7";
    String SearchData = search_data;
    String Api = "$HostName/api/?key=$Apikey&q=$SearchData&image_type=photo";
    var responce = await http.get(
      Uri.parse(Api),
    );
    if (responce.statusCode == 200) {
      String JsonData = responce.body;

      Map DecodedData = jsonDecode(JsonData);

      List mapData = DecodedData['hits'];

      List<Wallpaper> wallpaper_data =
          mapData.map((e) => Wallpaper.fromJson(data: e)).toList();

      return wallpaper_data;
    } else {
      return null;
    }
  }
}
