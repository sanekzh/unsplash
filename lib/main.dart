import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unsplash_app/pages/detail.dart';
import 'package:unsplash_app/viewmodels/pictures.dart';
import 'package:unsplash_app/pages/home.dart';

void main() => runApp(UnsplashApp());

class UnsplashApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(builder: (context) => PicListView()),
        ],
        child: MaterialApp(
            title: 'Unsplash',
            theme: ThemeData(primarySwatch: Colors.blueGrey,
            ),
            initialRoute: '/',
            routes: {
              '/': (context) => HomePage(),
              '/detail': (context) => PictureDetailScreen(),
            }
        )
    );
  }
}