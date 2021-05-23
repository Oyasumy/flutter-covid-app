import 'package:covid_app/Modal/Province.dart';
import 'package:covid_app/Modal/USACase.dart';
import 'package:http/http.dart' as http;

class USACaseService {
  static const String url =
      "https://api-covid-21.herokuapp.com/api/v1/detail-covid/country/usa";

  static Future<List<UsaCase>> getListCase() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = usaCaseFromJson(response.body);
        return data;
      } else {
        return List<UsaCase>();
      }
    } catch (e) {
      return List<UsaCase>();
    }
  }
}
