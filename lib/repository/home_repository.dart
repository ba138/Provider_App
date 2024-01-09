import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:provider_app/model/home_model.dart';

class HomeRepository {
  Future<HomeModel> fetchData() async {
    final url = Uri.parse('https://seedswild.exarth.com/api/v1/home/');
    final headers = {
      'accept': 'application/json',
      'X-CSRFToken':
          'XvrbeWlvNCE4Pv6eAbt9KLBi7jJwokhWrT5yL747aaTWp5dDR8aNdO1tKQZY1Sr0',
    };

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        return HomeModel.fromJson(jsonData);
      } else {
        throw Exception('Failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
