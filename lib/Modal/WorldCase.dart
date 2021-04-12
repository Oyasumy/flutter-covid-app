// To parse this JSON data, do
//
//     final worldCase = worldCaseFromJson(jsonString);

import 'dart:convert';

List<WorldCase> worldCaseFromJson(String str) =>
    List<WorldCase>.from(json.decode(str).map((x) => WorldCase.fromJson(x)));

String worldCaseToJson(List<WorldCase> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WorldCase {
  WorldCase({
    this.detailCases,
    this.activeCases,
    this.closeCases,
  });

  DetailCases detailCases;
  ActiveCases activeCases;
  CloseCases closeCases;

  factory WorldCase.fromJson(Map<String, dynamic> json) => WorldCase(
        detailCases: DetailCases.fromJson(json["detailCases"]),
        activeCases: ActiveCases.fromJson(json["activeCases"]),
        closeCases: CloseCases.fromJson(json["closeCases"]),
      );

  Map<String, dynamic> toJson() => {
        "detailCases": detailCases.toJson(),
        "activeCases": activeCases.toJson(),
        "closeCases": closeCases.toJson(),
      };
}

class ActiveCases {
  ActiveCases({
    this.currentlyInfectedPatients,
    this.inMildCondition,
    this.serious,
  });

  String currentlyInfectedPatients;
  List<String> inMildCondition;
  List<String> serious;

  factory ActiveCases.fromJson(Map<String, dynamic> json) => ActiveCases(
        currentlyInfectedPatients: json["currentlyInfectedPatients"],
        inMildCondition:
            List<String>.from(json["inMildCondition"].map((x) => x)),
        serious: List<String>.from(json["Serious"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "currentlyInfectedPatients": currentlyInfectedPatients,
        "inMildCondition": List<dynamic>.from(inMildCondition.map((x) => x)),
        "Serious": List<dynamic>.from(serious.map((x) => x)),
      };
}

class CloseCases {
  CloseCases({
    this.outcome,
    this.recovered,
    this.deaths,
  });

  String outcome;
  List<String> recovered;
  List<String> deaths;

  factory CloseCases.fromJson(Map<String, dynamic> json) => CloseCases(
        outcome: json["outcome"],
        recovered: List<String>.from(json["Recovered"].map((x) => x)),
        deaths: List<String>.from(json["Deaths"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "outcome": outcome,
        "Recovered": List<dynamic>.from(recovered.map((x) => x)),
        "Deaths": List<dynamic>.from(deaths.map((x) => x)),
      };
}

class DetailCases {
  DetailCases({
    this.total,
    this.dead,
    this.recovered,
  });

  String total;
  String dead;
  String recovered;

  factory DetailCases.fromJson(Map<String, dynamic> json) => DetailCases(
        total: json["total"],
        dead: json["dead"],
        recovered: json["Recovered"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "dead": dead,
        "Recovered": recovered,
      };
}
