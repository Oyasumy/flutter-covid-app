import 'package:covid_app/data/data.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class ModalHospital extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width,
      // width: double.infinity,
      height: 550,
      child: Center(
        child: Scaffold(
            body: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Icon(
                  Icons.remove_rounded,
                  size: 46,
                ),
              ),
              Column(
                  children: dataHospital
                      .map((e) => ListBody(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          '${e.keys.first}',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '${e.values.first}',
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                    FloatingActionButton.extended(
                                      onPressed: () =>
                                          _launchURL(e.values.first),
                                      label: Text(
                                          'home-button-text'.tr().toString()),
                                      icon: const Icon(
                                          Icons.phone_enabled_outlined),
                                      backgroundColor: Colors.pink,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              )
                            ],
                          ))
                      .toList())
            ],
          ),
        )),
      ),
    );
  }

  Future _launchURL(phone) async => await canLaunch('tel:$phone')
      ? await launch('tel://$phone')
      : throw 'Could not launch tel:$phone';
}
