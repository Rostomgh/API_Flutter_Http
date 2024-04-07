import 'dart:convert';

import 'package:flutter_api_breaking_bad/Api/model/PersonModel.dart';
import 'package:http/http.dart' as http;

class PersonApi {
  List<Person> perList = <Person>[];
  Future<List<Person>> getPerson() async {
    final response = await http
        .get(Uri.parse("https://api.breakingbadquotes.xyz/v1/quotes/20"));

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      final data = jsonDecode(response.body);
      for (var i = 0; i < data.length; i++) {
        perList.add(Person.fromJson(data[i]));
      }
  return perList;
    } else {
      throw Exception('Failed to load person');
    }
  }
}
