import 'package:covid_app/Modal/VietNamCase.dart';
import 'package:covid_app/Modal/WorldCase.dart';
import 'package:covid_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class StatusGrid extends StatefulWidget {
  final int index;
  final VietNamCase vietNamCase;
  final WorldCase worldCase;

  StatusGrid({Key key, this.index, this.vietNamCase, this.worldCase})
      : super(key: key);

  @override
  _StatusGridState createState() => _StatusGridState();
}

class _StatusGridState extends State<StatusGrid> {
  @override
  Widget build(BuildContext context) {
    var total = widget?.index == 0
        ? widget.vietNamCase != null
            ? NumberFormat.compact()
                .format(double.parse(widget?.vietNamCase?.cases.toString()))
            : "Loading"
        : widget.worldCase != null
            ? NumberFormat.compact()
                .format(double.parse(widget?.worldCase?.detailCases?.total))
                .toString()
            : "Loading";
    var dead = widget?.index == 0
        ? widget.vietNamCase != null
            ? NumberFormat.compact()
                .format(double.parse(widget?.vietNamCase?.deaths.toString()))
            : "Loading"
        : widget.worldCase != null
            ? NumberFormat.compact()
                .format(double.parse(widget?.worldCase?.detailCases?.dead))
            : "Loading";
    var recovered = widget?.index == 0
        ? widget.vietNamCase != null
            ? NumberFormat.compact()
                .format(double.parse(widget?.vietNamCase?.recovered.toString()))
            : "loading"
        : widget.worldCase != null
            ? NumberFormat.compact()
                .format(double.parse(widget?.worldCase?.detailCases?.recovered))
            : "Loading";
    var active = widget?.index == 0
        ? widget.vietNamCase != null
            ? NumberFormat.compact()
                .format(double.parse(widget?.vietNamCase?.active.toString()))
            : "Loading"
        : widget.worldCase != null
            ? NumberFormat.compact().format(double.parse(
                widget?.worldCase?.activeCases?.currentlyInfectedPatients))
            : "Loading";
    var critial = widget?.index == 0
        ? widget.vietNamCase != null
            ? NumberFormat.compact()
                .format(double.parse(widget?.vietNamCase?.critical.toString()))
            : "Loading"
        : widget.worldCase != null
            ? NumberFormat.compact().format(
                double.parse(widget?.worldCase?.activeCases?.serious[0]))
            : "Loading";

    return Container(
      height: MediaQuery.of(context).size.height * .25,
      // color: Colors.yellow,
      child: Column(
        children: <Widget>[
          Flexible(
              child: Row(
            children: <Widget>[
              BuildStateCard(
                  "status-total".tr().toString(), total, Colors.orange),
              BuildStateCard("status-dead".tr().toString(), dead, Colors.red),
            ],
          )),
          Flexible(
              child: Row(
            children: <Widget>[
              BuildStateCard(
                  "status-recovered".tr().toString(), recovered, Colors.green),
              BuildStateCard(
                  "status-active".tr().toString(), active, Colors.lightBlue),
              BuildStateCard(
                  "status-critical".tr().toString(), critial, Colors.purple),
            ],
          ))
        ],
      ),
    );
  }
}