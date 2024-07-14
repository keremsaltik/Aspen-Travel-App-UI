import 'package:flutter/material.dart';

import '../text/text.dart';

Widget buildDefaultCardContent(
    BuildContext context, Map<String, dynamic>? data) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Image.asset(data?['image']),
          Card(
            child: TextWidget(
              text: '4N/5D',
              fontSize: 10,
            ),
            color: Color.fromRGBO(58, 84, 79, 100),
          ),
        ],
      ),
      Padding(padding: EdgeInsets.only(top: 6)),
      TextWidget(
        text: data?['title'],
        textColor: Color(0xff232323),
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      Row(
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
          ),
        ],
      ),
    ],
  );
}
