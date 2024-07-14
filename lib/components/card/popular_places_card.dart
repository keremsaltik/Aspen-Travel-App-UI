import 'package:flutter/material.dart';

import '../../utilities/screen_utilities.dart';
import '../text/text.dart';

Widget buildPopularPlaceCardContent(
    BuildContext context, Map<String, dynamic>? data) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(
          top: ScreenUtils.scaleHeight(context, 0.2),
          left: 10,
        ),
        width: 90,
        height: 23,
        decoration: BoxDecoration(
          color: Color.fromRGBO(72, 86, 82, 1),
          borderRadius: BorderRadius.circular(59),
        ),
        child: Center(
          child: TextWidget(
            // Card title
            text: data?['title'],
            fontSize: 12,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5, right: 25),
        child: data != null
            ? Container(
                width: 52,
                height: 24,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(72, 86, 82, 1),
                  borderRadius: BorderRadius.circular(59),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      size: 16,
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    TextWidget(
                      text: data['point'],
                      fontSize: 10,
                    )
                  ],
                ),
              )
            : Row(
                children: [
                  Icon(
                    Icons.trending_up,
                    size: 9,
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  TextWidget(
                    text: 'Hot deal',
                    textColor: Colors.black,
                    fontSize: 10,
                  )
                ],
              ),
      ),
    ],
  );
}
