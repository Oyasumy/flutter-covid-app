import 'package:covid_app/Modal/Country.dart';
import 'package:covid_app/config/palette.dart';
import 'package:covid_app/service/country_service.dart';
import 'package:covid_app/widgets/custome_app_bar.dart';
import 'package:covid_app/widgets/widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CountriesScreen extends StatefulWidget {
  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  String _country = 'USA';

  List<Country> listCaseCountry = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callApiLoadData(_country);
  }

  callApiLoadData(String country) async {
    if (_country != null) {
      await CountryCasesService.getListCase(country).then((value) {
        setState(() {
          print('object ${value}');
          listCaseCountry = value;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      appBar: CustomeAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          _buildHead(listCaseCountry.length > 0 ? listCaseCountry[0] : null),
          _buildSizeBox20(),
          _buildConten(
              height, listCaseCountry.length > 0 ? listCaseCountry[0] : null),
          _buildSizeBox20(),
          _buildChart(
              width, listCaseCountry.length > 0 ? listCaseCountry[0] : null),
          _buildSizeBox20(),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildHead(Country listCases) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: listCases != null
                  ? Image.network(
                      listCases.countryInfo.flag,
                      width: 100,
                    )
                  : null,
            ),
            CountriesDropdown(
                // countries: ['CN', 'FR', 'IN', 'IT', 'UK', 'USA', "VI"],
                countries: ['USA', "VN", "FR", "IN", "IT", "UK"],
                country: _country,
                onchange: (value) => setState(() {
                      _country = value;
                      callApiLoadData(value);
                    })),
          ],
        ),
      ),
    );
  }
}

SliverToBoxAdapter _buildSizeBox20() {
  return SliverToBoxAdapter(
    child: SizeBoxHeight20(),
  );
}

SliverToBoxAdapter _buildConten(height, Country listCaes) {
  return SliverToBoxAdapter(
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: height * .25,
      child: Column(
        children: <Widget>[
          Flexible(
              child: Row(
            children: <Widget>[
              BuildStateCard(
                  "Population",
                  listCaes == null
                      ? "Loading"
                      : NumberFormat.compact()
                          .format(listCaes.population.toDouble())
                          .toString(),
                  Colors.blue),
            ],
          )),
          Flexible(
              child: Row(
            children: <Widget>[
              BuildStateCard(
                  "Active",
                  listCaes == null
                      ? "Loading"
                      : NumberFormat.compact()
                          .format(listCaes.active.toDouble())
                          .toString(),
                  Colors.green),
              BuildStateCard(
                  "Critical",
                  listCaes == null
                      ? "Loading"
                      : NumberFormat.compact()
                          .format(listCaes.critical.toDouble())
                          .toString(),
                  Colors.orange),
            ],
          )),
        ],
      ),
    ),
  );
}

SliverToBoxAdapter _buildChart(width, Country listCase) {
  return SliverToBoxAdapter(
    child: Center(
      child: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.centerLeft,
        height: 350,
        width: width * .9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Column(
          children: <Widget>[
            Text(
              'Daily New Cases',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            new ChartColumnDouble(listCase)
          ],
        ),
      ),
    ),
  );
}
