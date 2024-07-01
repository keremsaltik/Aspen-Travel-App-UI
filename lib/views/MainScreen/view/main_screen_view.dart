import 'package:flutter/material.dart';
import 'package:travel_app/components/button/textButton.dart';
import 'package:travel_app/components/listviewBuilder/listviewBuilder.dart';
import 'package:travel_app/views/MainScreen/modelView/mainscreen_viewmodel.dart';

import '../../../components/bottomNavigationBar/bottomNavigation.dart';
import '../../../components/text/text.dart';
import '../../../components/textFormField/textFormField.dart';
import '../../../utilities/screen_utilities.dart';
import '../../PlaceDetails/view/place_details_view.dart';
import '../data/mainscreen_data.dart';

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({super.key});

  @override
  State<MainScreenPage> createState() => _MainScreenViewState();
}

class _MainScreenViewState extends State<MainScreenPage> {
  final String _alleyPalaceLocation = 'assets/png/AlleyPalace.png';
  final String _ceurdesAlpes = 'assets/png/CeurdesAlpes.png';
  final String _exploreAspen = 'assets/png/ExploreAspen.png';
  String _selectedLocation = 'Aspen, USA';

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    double width = ScreenUtils.screenWidth(context);
    double height = ScreenUtils.screenHeight(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 44, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: 'Explore',
                        textColor: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: ScreenUtils.scaleHeight(context, 0.01),
                          ),
                          child: TextWidget(
                            text: 'Aspen',
                            textColor: Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  DropdownButton<String>(
                    value: _selectedLocation,
                    icon: const Icon(Icons.arrow_drop_down, color: Colors.blue),
                    iconSize: 24,
                    elevation: 16,
                    underline: Container(
                      height: 2,
                      color: Colors.transparent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedLocation = newValue!;
                      });
                    },
                    items: <String>['Aspen, USA', 'Other Location']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.blue),
                            SizedBox(width: 8),
                            Text(value, style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: ScreenUtils.scaleWidth(context, 0.04),
                ),
              ),
              searchField(),
              Listviewbuilder(
                itemLength: categories.length,
                items: categories,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: TextWidget(
                    text: 'Popular',
                    textColor: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                width: ScreenUtils.scaleWidth(context, 0.9),
                height: ScreenUtils.scaleHeight(context, 0.3),
                child: Listviewbuilder(
                  width: 220,
                  itemLength: popularPlacesDatas.length,
                  items: popularPlacesDatas,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 32)),
              Align(
                alignment: Alignment.centerLeft,
                child: TextWidget(
                  text: 'Recommended',
                  textColor: Colors.black,
                ),
              ),
              SizedBox(
                width: ScreenUtils.scaleWidth(context, 1),
                height: ScreenUtils.scaleHeight(context, 0.18),
                child: Listviewbuilder(
                  width: 160,
                  itemLength: recommendedPlacesDatas.length,
                  items: recommendedPlacesDatas,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }
}
