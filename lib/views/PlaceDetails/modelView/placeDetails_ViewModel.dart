import '../../MainScreen/data/mainscreen_data.dart';

late Map<String, dynamic> card;
late List<String> images;
List<String> fetchCardDetails(widget) {
  card = popularPlacesDatas.firstWhere((place) => place['id'] == widget.cardId);

  return images = card['image'] != null
      ? card['image'] is List
          ? List<String>.from(card['image'])
          : [card['image']]
      : ['assets/png/WelcomePageImage.png'];
}
