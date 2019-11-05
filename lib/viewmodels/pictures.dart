import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:unsplash_app/services/pictures.dart';
import 'package:unsplash_app/models/pictures.dart';


class PicListView extends ChangeNotifier {
  PicListView();

  Future<List<Pictures>> getList() async {
    return fetchPictures();
  }
}
