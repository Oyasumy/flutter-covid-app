import 'package:covid_app/Modal/Country.dart';
import 'package:covid_app/Modal/VietNamCase.dart';
import 'package:http/http.dart' as http;

class CountryCasesService {
  static const String url =
      "https://api-covid-21.herokuapp.com/api/v1/detail-covid/country/";

  static Future<List<Country>> getListCase(tag) async {
    // try {
    print('urlllllllllll $url$tag');
    final response = await http.get('$url$tag');
    // print('res ${response.body}');
    if (response.statusCode == 200) {
      print("st1");
      var data = countryFromJson(response.body);
      print('okkk $data');
      return data;
    } else {
      return List<Country>();
    }
    // } catch (e) {
    //   return List<Country>();
    // }
  }
}
