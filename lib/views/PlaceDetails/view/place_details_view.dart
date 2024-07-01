import 'package:flutter/material.dart';

import '../../../components/button/textButton.dart';
import '../../../components/text/text.dart';
import '../../../utilities/screen_utilities.dart';
import '../../MainScreen/data/mainscreen_data.dart';
import '../../MainScreen/view/main_screen_view.dart';

class PlaceDetailsPage extends StatefulWidget {
  const PlaceDetailsPage({
    Key? key,
    required this.cardId,
  }) : super(key: key);
  final int cardId;

  @override
  State<PlaceDetailsPage> createState() => _PlaceDetailsPageState();
}

class _PlaceDetailsPageState extends State<PlaceDetailsPage> {
  late Map<String, dynamic> card;
  late List<String> images;

  @override
  void initState() {
    super.initState();
    fetchCardDetails();
  }

  void fetchCardDetails() {
    card =
        popularPlacesDatas.firstWhere((place) => place['id'] == widget.cardId);

    images = card['image'] != null
        ? card['image'] is List
            ? List<String>.from(card['image'])
            : [card['image']]
        : ['assets/png/WelcomePageImage.png'];
  }

  @override
  Widget build(BuildContext context) {
    double width = ScreenUtils.screenWidth(context);
    double height = ScreenUtils.screenHeight(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 20, vertical: ScreenUtils.scaleHeight(context, 0.05)),
          child: Column(
            children: [
              buildImageStack(context, width, height),
              buildTitleRow(),
              const SizedBox(height: 10),
              buildRatingRow(),
              const SizedBox(height: 16),
              TextWidget(
                text: card['description'] ?? 'No description',
                textColor: Colors.black,
              ),
              const SizedBox(height: 9),
              buildReadMoreButton(),
              const SizedBox(height: 37),
              buildFacilitiesSection(),
              const SizedBox(height: 33),
              buildPriceAndBookRow(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImageStack(BuildContext context, double width, double height) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: width,
            height: height * 0.44,
            child: Image.asset(
              images.length > 1 ? images[1] : images[0],
              fit: BoxFit.contain,
            ),
          ),
        ),
        buildBackButton(context),
        buildFavoriteButton(),
      ],
    );
  }

  Widget buildBackButton(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.of(context).pop(),
      icon: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(
          Icons.arrow_back_ios_new,
          size: 15,
          color: Color.fromRGBO(184, 184, 184, 100),
        ),
      ),
    );
  }

  Widget buildFavoriteButton() {
    return Padding(
      padding: EdgeInsets.only(top: 350, right: 34),
      child: Align(
        alignment: Alignment.bottomRight,
        child: IconButton(
          style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.white)),
          iconSize: 44,
          onPressed: () {},
          icon: Icon(Icons.favorite),
          color: Colors.red,
        ),
      ),
    );
  }

  Widget buildTitleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget(
          text: card['title'] ?? 'Unknown',
          textColor: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 24,
        ),
        TextWidget(
          text: 'Show Map',
          textColor: Color.fromRGBO(23, 111, 242, 100),
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }

  Widget buildRatingRow() {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Color.fromRGBO(223, 150, 82, 100),
        ),
        TextWidget(
          text:
              '${card['point'] ?? 'Data not available'} (${card['reviews']} reviews)',
          fontSize: 12,
          textColor: Color.fromRGBO(96, 96, 96, 100),
        ),
      ],
    );
  }

  Widget buildReadMoreButton() {
    return Align(
      child: TextButton(
        onPressed: () {
          print(card);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(
              text: 'Read more',
              textColor: Colors.blue,
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFacilitiesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: 'Facilities',
          textColor: Colors.black,
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: card['features']?.length ?? 0,
            itemBuilder: (context, index) {
              return buildFeatureCard(card['features'][index]);
            },
          ),
        ),
      ],
    );
  }

  Widget buildFeatureCard(Map<String, dynamic> feature) {
    IconData iconData = Icons.error;
    String? text;

    feature.forEach((key, value) {
      if (key.endsWith('Icon')) {
        iconData = value;
      } else {
        text = value;
      }
    });

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Icon(iconData),
            Text(text ?? ''),
          ],
        ),
      ),
    );
  }

  Widget buildPriceAndBookRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              text: 'Price',
              textColor: Colors.black,
              fontSize: 12,
            ),
            const SizedBox(height: 4),
            TextWidget(
              text: card['price'],
              textColor: Colors.green,
              fontSize: 29,
            ),
          ],
        ),
        SizedBox(
          width: 223,
          height: 56,
          child: ButtonWidget(
            isSelected: false,
            buttonTextColor: Colors.white,
            buttonText: 'Book Now',
            page: MainScreenPage(),
          ),
        ),
      ],
    );
  }
}
