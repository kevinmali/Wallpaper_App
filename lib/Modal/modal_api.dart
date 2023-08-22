class Wallpaper {
  int views;
  String largeImageURL;
  int likes;

  Wallpaper(
      {required this.views, required this.largeImageURL, required this.likes});

  factory Wallpaper.fromJson({required Map data}) {
    return Wallpaper(
        views: data['views'],
        largeImageURL: data['largeImageURL'],
        likes: data['likes']);
  }
}
