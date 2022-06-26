import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/SentAna.dart';

class APIService {
  static const String _baseURL =
      'https://twinword-emotion-analysis-v1.p.rapidapi.com/analyze/';
  static const String api_key =
      '224cf07078mshc78587be9054adfp1ab163jsn0735dcad1ee1';
  static const Map<String, String> _headers = {
    'content-type': 'application/x-www-form-urlencoded',
    'x-rapidapi-host': 'twinword-emotion-analysis-v1.p.rapidapi.com',
    'x-rapidapi-key': api_key,
    'useQueryString': 'true',
  };

  Future<SentAna> post({
    required Map<String, String> query,
  }) async {
    final response = await http.post(
      Uri(path: _baseURL),
      headers: _headers,
      body: query,
    );

    if (response.statusCode == 200) {
      print('success' + response.body);
      return SentAna.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception(
        'Failed to load json data',
      );
    }
  }
}
