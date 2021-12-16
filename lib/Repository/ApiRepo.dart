
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ApiRepo{

  String url = "https://teletraan.co/api/service-provider-profile?pagination=true&user_detail=true&is_approved=approved&filter_by_top_providers=true&filter_by_service=drain-repair&zip=10501&from_explore=true";


  Future<Map<String, dynamic>?> fetchData() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse =
      convert.jsonDecode(response.body) as Map<String, dynamic>;
      // print(convert.jsonEncode(jsonResponse["data"][0]));
      // print("end");
      // print(jsonResponse["data"][0]);
      return jsonResponse;
    } else {
      print('Request failed with status: ${response
          .statusCode}.');
      return null;
    }
  }

}