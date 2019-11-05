import 'package:flutter/material.dart';
import 'package:unsplash_app/models/pictures.dart';


class PictureDetailScreen extends StatelessWidget {
  final Pictures picture;

  PictureDetailScreen({Key key, @required this.picture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
          return Scaffold(
              body: Center(
                child: Image.network(
                  picture.fullPic,
                  fit: BoxFit.cover,
                  loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              )
          );
  }
}