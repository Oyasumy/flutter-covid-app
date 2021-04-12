// To parse this JSON data, do
//
//     final province = provinceFromJson(jsonString);

import 'dart:convert';

List<Province> provinceFromJson(String str) =>
    List<Province>.from(json.decode(str).map((x) => Province.fromJson(x)));

String provinceToJson(List<Province> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Province {
  Province({
    this.province,
    this.provinceCase,
    this.positive,
  });

  String province;
  int provinceCase;
  List<double> positive;

  factory Province.fromJson(Map<String, dynamic> json) => Province(
        province: json["province"],
        provinceCase: json["case"],
        positive: List<double>.from(json["positive"].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "province": province,
        "case": provinceCase,
        "positive": List<dynamic>.from(positive.map((x) => x)),
      };
}
