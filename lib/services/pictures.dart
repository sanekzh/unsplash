import 'dart:async';
import 'dart:convert';
import 'dart:convert' show utf8;
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:unsplash_app/models/pictures.dart';


Future<List<Pictures>> fetchPictures(http.Client client,
    String token) async {

  String authToken = 'cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0';
  final response = await http
      .get("https://api.unsplash.com/photos/?client_id=${authToken}");

  if (response.statusCode == 200) {
    return compute(parsePictures, utf8.decode(response.bodyBytes));
  } else {
    throw Exception('Failed to load recipe list');
  }
}


List<Pictures> parsePictures(String responseBody) {
  final parsed = json.decode(responseBody)
      .cast<Map<String, dynamic>>();
  return parsed.map<Pictures>((json) => Pictures.fromJson(json)).toList();
}