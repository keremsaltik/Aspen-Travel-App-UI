import 'package:flutter/material.dart';

import '../../../components/button/textButton.dart';
import '../../../components/text/text.dart';
import '../../../utilities/screen_utilities.dart';
import '../../MainScreen/view/main_screen_view.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final String _WelcomePageImage = 'assets/png/WelcomePageImage.png';
  final String textAspen = 'Aspen';
  final String textPlanYour = 'Plan your';
  final String textLuxurious = 'Luxurious Vacation';
  @override
  Widget build(BuildContext context) {
    double width = ScreenUtils.screenWidth(context);
    double height = ScreenUtils.screenHeight(context);

    return Scaffold(
      body: Stack(
        //Widgets coming
        children: <Widget>[
          SizedBox(
            width: ScreenUtils.scaleWidth(context, 1),
            height: ScreenUtils.scaleHeight(context, 1),
            child: Image.asset(
              _WelcomePageImage,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: ScreenUtils.scaleWidth(context, 0.15),
            top: ScreenUtils.scaleWidth(context, 0.2),
            child: TextWidget(
              text: textAspen,
              fontFamily: 'Hiatus',
              fontSize: 150,
            ),
          ),
          Container(
            //color: Colors.red,
            width: 320,
            height: 175,
            margin: EdgeInsets.only(
              top: ScreenUtils.scaleHeight(context, 0.65),
              left: ScreenUtils.scaleWidth(context, 0.04),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: textPlanYour,
                  fontSize: 24.0,
                ),
                TextWidget(
                  text: textLuxurious,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: ScreenUtils.scaleHeight(context, 0.88),
                left: ScreenUtils.scaleWidth(context, 0.05)),
            width: ScreenUtils.scaleWidth(context, 0.9),
            height: ScreenUtils.scaleHeight(context, 0.06),
            child: ButtonWidget(
              isSelected: false,
              buttonTextColor: Colors.white,
              buttonText: 'Explore Now',
              page: MainScreenPage(),
            ),
          )
        ],
      ),
    );
  }
}
