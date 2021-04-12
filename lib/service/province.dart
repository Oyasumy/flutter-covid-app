import 'package:covid_app/Modal/Province.dart';
import 'package:http/http.dart' as http;

class ProvinceService {
  static const String url =
      "https://api-covid-21.herokuapp.com/api/v1/detail-covid/province";

  static Future<List<Province>> getProvinces() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final listProvince = provinceFromJson(response.body);
        return listProvince;
      } else {
        return List<Province>();
      }
    } catch (e) {
      return List<Province>();
    }
  }
}
