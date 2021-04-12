import 'package:covid_app/Modal/Province.dart';
import 'package:covid_app/Modal/VietNamCase.dart';
import 'package:http/http.dart' as http;

class VietNamCaseService {
  static const String url =
      "https://api-covid-21.herokuapp.com/api/v1/detail-covid/country/vn";

  static Future<List<VietNamCase>> getListCase() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = vietNamCaseFromJson(response.body);
        return data;
      } else {
        return List<VietNamCase>();
      }
    } catch (e) {
      return List<VietNamCase>();
    }
  }
}
