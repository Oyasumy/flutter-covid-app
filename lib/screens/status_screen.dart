import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:covid_app/Modal/USACase.dart';
import 'package:covid_app/Modal/VietNamCase.dart';
import 'package:covid_app/Modal/WorldCase.dart';
import 'package:covid_app/config/palette.dart';
import 'package:covid_app/config/styles.dart';
import 'package:covid_app/service/usa_case.dart';
import 'package:covid_app/service/viet_nam_case.dart';
import 'package:covid_app/service/world-case.dart';
import 'package:covid_app/widgets/custome_app_bar.dart';
import 'package:covid_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class StatusScreen extends StatefulWidget {
  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  List<UsaCase> listCaseUSA = [];
  List<VietNamCase> listCaseVietNam = [];

  int _initTab = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    callApiLoadData();
  }

  callApiLoadData() async {
    if (_initTab == 0) {
      await VietNamCaseService.getListCase().then((value) {
        setState(() {
          listCaseVietNam = value;
        });
      });
    } else {
      await USACaseService.getListCase().then((value) {
        setState(() {
          listCaseUSA = value;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      appBar: CustomeAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildHeader(),
          _buildRegionTabBar(),
          _buildSizeBox(),
          _buildStatusTabBar(
              _initTab,
              listCaseVietNam.length > 0 ? listCaseVietNam[0] : null,
              listCaseUSA.length > 0 ? listCaseUSA[0] : null)
        ],
      ),
    );
  }

  SliverPadding _buildHeader() {
    return SliverPadding(
      padding: EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: Text(
          "status-title".tr().toString(),
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildRegionTabBar() {
    return SliverToBoxAdapter(
      child: DefaultTabController(
          length: 2,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white24, borderRadius: BorderRadius.circular(25)),
            child: TabBar(
              indicator: BubbleTabIndicator(
                  tabBarIndicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: Colors.white,
                  indicatorHeight: 40),
              labelStyle: Styles.TabTextStyle,
              labelColor: Colors.black,
              tabs: <Widget>[Text('Viet Nam'), Text('USA')],
              onTap: (index) {
                setState(() {
                  _initTab = index;
                  callApiLoadData();
                });
              },
            ),
          )),
    );
  }
}

SliverPadding _buildStatusTabBar(
    int index, VietNamCase vietNamCase, UsaCase usaCase) {
  return SliverPadding(
    padding: EdgeInsets.all(20),
    sliver: SliverToBoxAdapter(
      child:
          StatusGrid(index: index, vietNamCase: vietNamCase, usaCase: usaCase),
    ),
  );
}

SliverToBoxAdapter _buildSizeBox() {
  return SliverToBoxAdapter(
    child: SizedBox(
      height: 40,
    ),
  );
}
