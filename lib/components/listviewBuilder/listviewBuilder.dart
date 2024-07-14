import 'package:flutter/material.dart';
import 'package:travel_app/views/PlaceDetails/modelView/placeDetails_ViewModel.dart';

import '../../utilities/screen_utilities.dart';
import '../../views/MainScreen/data/mainscreen_data.dart';
import '../../views/MainScreen/modelView/mainscreen_viewmodel.dart';
import '../../views/PlaceDetails/view/place_details_view.dart';

import '../button/textButton.dart';
import '../card/popular_places_card.dart';
import '../card/recommended_places_card.dart';
import '../text/text.dart';

class Listviewbuilder extends StatelessWidget {
  final int? itemLength;
  final double? width;
  final List<Map<String, dynamic>>? items;

  Listviewbuilder({
    super.key,
    this.itemLength,
    this.items,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    var data;

    if (items == categories) {
      return Padding(
        padding: const EdgeInsets.only(top: 32),
        child: SizedBox(
          width: ScreenUtils.scaleWidth(context, 1),
          height: ScreenUtils.scaleHeight(context, 0.04),
          child: ListView.builder(
            //itemExtent: ScreenUtils.scaleWidth(context, 0.6),
            //padding: EdgeInsets.only(top: 32),
            scrollDirection: Axis.horizontal,
            itemCount: itemLength,
            itemBuilder: (context, index) {
              data = items?[index];
              bool isSelected = data['category'] == 'Location';
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ButtonWidget(
                  isSelected: true,
                  buttonColor: isSelected
                      ? Colors.blue.withOpacity(0.1)
                      : Colors.transparent,
                  buttonText: data['category'].toString() ?? '',
                  buttonTextColor: isSelected ? Colors.blue : Colors.grey,
                  overlayColor: WidgetStatePropertyAll(
                    Color.fromARGB(110, 223, 233, 241),
                  ),
                  fixedButtonSize: WidgetStatePropertyAll(
                    Size(100, 3),
                  ),
                  radius: 8.0,
                ),
              );
            },
          ),
        ),
      );
    } else {
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemLength ?? 0,
        itemBuilder: (context, index) {
          data = items?[index];

          return GestureDetector(
            onTap: () {
              int? tappedCardId = data?['id'];
              if (tappedCardId != null) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PlaceDetailsPage(
                    cardId: tappedCardId,
                  ),
                ));
              }
            },
            child: SizedBox(
              width: width,
              child: Card(
                color: Colors.transparent,
                shadowColor: Colors.transparent,
                child: Stack(
                  children: [
                    // Card image
                    Image.asset(getImages(data ?? {})[0]),
                    items == popularPlacesDatas
                        ? buildPopularPlaceCardContent(context, data)
                        : buildDefaultCardContent(context, data),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }
}
