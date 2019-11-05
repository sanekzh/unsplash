import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:unsplash_app/services/pictures.dart';
import 'package:unsplash_app/models/pictures.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PicListView extends ChangeNotifier {
  PicListView();

  Future<List<Pictures>> getList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    return fetchPictures(http.Client(), token);
  }
}
