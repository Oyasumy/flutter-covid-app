import 'package:covid_app/config/palette.dart';
import 'package:covid_app/config/spacing.dart';
import 'package:covid_app/config/styles.dart';
import 'package:covid_app/data/data.dart';
import 'package:covid_app/widgets/modal_hospital.dart';
import 'package:covid_app/widgets/widgets.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _country = 'USA';

  @override
  Widget build(BuildContext context) {
    //

    //

    final _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomeAppBar(),
      body:
          CustomScrollView(physics: ClampingScrollPhysics(), slivers: <Widget>[
        _buildHeader(_screenHeight),
        _buildPreventTip(_screenHeight),
        _buildYourOwnTest(_screenHeight)
      ]),
    );
  }

  SliverToBoxAdapter _buildHeader(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 20),
        decoration: BoxDecoration(
            color: Palette.primaryColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Covid 21',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                CountriesDropdown(
                    // countries: ['CN', 'FR', 'IN', 'IT', 'UK', 'USA', "VI"],
                    countries: ['USA', "VN"],
                    country: _country,
                    onchange: (value) => setState(() {
                          _country = value;
                          if (value.toLowerCase() != "usa") {
                            EasyLocalization.of(context).locale =
                                Locale("vi", "VN");
                          } else {
                            EasyLocalization.of(context).locale =
                                Locale("en", "USA");
                          }
                        })),
              ],
            ),
            SizedBox(height: Spacing.SPACING * 2),
            Text(
              // 'Are you feeling sick ?',
              'home-title'.tr().toString(),
              style: Styles.textTitleStyle,
            ),
            SizedBox(
              height: Spacing.SPACING,
            ),
            Text(
              'home-subtitle'.tr().toString(),
              style: Styles.textSubTitleStyle,
              // textAlign: TextAlign.center,
              maxLines: 2,
              softWrap: true,
            ),
            SizedBox(
              height: Spacing.SPACING,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton.icon(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  onPressed: () => showCupertinoModalBottomSheet(
                    elevation: 20,
                    context: context,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(500.0)),
                    builder: (context) => ModalHospital(),
                  ),
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  icon: Icon(
                    Icons.phone,
                    color: Colors.white,
                  ),
                  label: Text(
                    'home-button-text'.tr().toString(),
                    style: Styles.buttonTextStyle,
                    textAlign: TextAlign.center,
                    maxLines: 4,
                    softWrap: true,
                  ),
                  textColor: Colors.white,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

SliverToBoxAdapter _buildPreventTip(double screenHeight) {
  return SliverToBoxAdapter(
    child: Container(
      // color: Colors.orange,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('home-title-prevention'.tr().toString(),
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
          SizedBox(
            height: Spacing.SPACING,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: prevention
                .map((e) => Column(
                      children: <Widget>[
                        Image.asset(
                          e.keys.first,
                          height: screenHeight * .12,
                        ),
                        SizedBox(
                          height: Spacing.SPACING,
                        ),
                        Text(
                          '${e.values.first}'.tr().toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ))
                .toList(),
          )
        ],
      ),
    ),
  );
}

SliverToBoxAdapter _buildYourOwnTest(double screenHeight) {
  return SliverToBoxAdapter(
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      padding: EdgeInsets.all(20),
      // height: screenHeight * 0.2,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xffad9fe4), Palette.primaryColor])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Image.asset(
            'assets/images/own_test.png',
            height: 100,
            // color: Colors.amber,
          ),
          Container(
            // color: Colors.orange,
            // width: '100%',
            constraints:
                BoxConstraints(minWidth: 100, maxWidth: screenHeight * .2),
            // decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'home-title-test'.tr().toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: Spacing.SPACING,
                ),
                Text(
                  'home-subtitle-test'.tr().toString(),
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
