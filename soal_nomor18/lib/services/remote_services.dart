import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:soal_nomor18/models/people_model.dart';

class RemoteServices {
  static var client = http.Client();

  // Future<PeopleModel?> fetchPeople() async {
  //   var response = await client.get(Uri.parse(
  //       'https://swapi.dev/api/people/'));
  //   if (response.statusCode == 200) {
  //     var jsonString = response.body;
  //     return peopleModelFromJson(jsonString);
  //   } else {
  //     //show error message
  //     return null;
  //   }
  // }

  Future<PeopleModel> fetchPeople() async {
    final response = await http.get(Uri.parse('https://swapi.dev/api/people/'));
    if (response.statusCode == 200) {
      return PeopleModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}