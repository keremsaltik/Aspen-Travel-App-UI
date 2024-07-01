import 'package:travel_app/views/MainScreen/data/mainscreen_data.dart';

List<Map<String, dynamic>> initializePopularPlacesDatas() {
  return popularPlacesDatas;
}

List<Map<String, dynamic>> initializeRecommendedPlacesDatas() {
  return recommendedPlacesDatas;
}

List<String> getImages(Map<String, dynamic> items) {
  List<String> images;
  if (items['image'] != null) {
    if (items['image'] is List) {
      images = List<String>.from(items['image']);
    } else {
      images = [items['image']];
    }
  } else {
    images = ['assets/png/WelcomePageImage.png']; // Default image
  }
  return images;
}

List<Map<String, dynamic>> initiializeCategories() {
  return categories;
}
