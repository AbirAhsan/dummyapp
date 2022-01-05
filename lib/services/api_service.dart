import 'dart:convert';

import 'package:dummyapp/model/lucky_place_model.dart';
import 'package:http/http.dart' as http;

class APIService {
  String host = "textgears-textgears-v1.p.rapidapi.com";
  String apiKey = "17f9aec40bmshd4757b5019880f4p1fb992jsndc58678e6688";
  Future<String> getCorrectText() async {
    var response = await http.post(
        Uri.parse("https://textgears-textgears-v1.p.rapidapi.com/readability"),
        headers: {
          'content-type': 'application/x-www-form-urlencoded',
          "x-rapidapi-host": host,
          "x-rapidapi-key": apiKey,
        });

    print('API Status Code ${response.statusCode}\n ');
    print("API Response ${json.decode(response.body)}");

    if (response.statusCode == 200) {
      return jsonDecode(response.body)["text"];
    } else {
      throw Exception("${jsonDecode(response.body)["message"]}");
    }
  }

  Future<List<LuckyPlace>> getLuckyPlace() async {
    var response =
        await http.get(Uri.parse("https://jsonkeeper.com/b/7YA6"), headers: {
      'content-type': 'application/x-www-form-urlencoded',
    });

    print('API Status Code ${response.statusCode}\n ');
    print("API Response ${json.decode(response.body)}");

    if (response.statusCode == 200) {
      var jsonResponse = response.body;
      var decoded = json.decode(jsonResponse);
      var mapdatalist = decoded['middle']
          .map<LuckyPlace>((b) => LuckyPlace.fromJson(b))
          .toList();
      print("Map List $mapdatalist");

      return mapdatalist;
    } else {
      throw Exception("${jsonDecode(response.body)["message"]}");
    }
  }
}
