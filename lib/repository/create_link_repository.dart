import 'dart:convert';
import 'package:flutter_url_shortener/config/config.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_url_shortener/models/link_model.dart';

class CreateLinkRepository {
  static Future<Link> createShortLink(String title) async {
    final response = await http.post(
      Uri.parse(Config.url),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Config.token}'
      },
      body: json.encode(
        <String, String>{
          "long_url": title,
          "domain": "bit.ly",
        },
      ),
    );
    try {
      if (response.body.isNotEmpty) {
        return Link.fromJson(json.decode(response.body));
      } else {
        throw Exception("Failed to create a link");
      }
    } catch (e, s) {
      print("exception $e");
      print("stack trace $s");
      rethrow;
    }
  }
}
