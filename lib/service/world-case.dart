import 'package:covid_app/Modal/WorldCase.dart';
import 'package:http/http.dart' as http;

class WorldCaseService {
  static const String url =
      "https://api-covid-21.herokuapp.com/api/v1/detail-covid/world";

  static Future<List<WorldCase>> getWorldCase() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = worldCaseFromJson(response.body);
        return data;
      } else {
        return List<WorldCase>();
      }
    } catch (e) {
      return List<WorldCase>();
    }
  }
}
