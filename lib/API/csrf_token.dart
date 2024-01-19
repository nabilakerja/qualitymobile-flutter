// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;

class CSRFTokenHandler {
  String? csrfToken;

  CSRFTokenHandler();

  Future<void> fetchCSRFToken() async {
    // Replace this with your Django backend details
    const String baseUrl = 'http://10.0.2.2:8000';
    const String csrfTokenUrl = '$baseUrl/equality/get-csrf-token/';

    try {
      final response = await http.get(Uri.parse(csrfTokenUrl));
      print('CSRF Token Response: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        csrfToken = data['csrfToken'];
        print('CSRF Token: $csrfToken');
      } else {
        print(
            'Failed to fetch CSRF token. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching CSRF token: $error');
    }
  }
}
