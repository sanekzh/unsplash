import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unsplash_app/models/pictures.dart';
import 'package:unsplash_app/viewmodels/pictures.dart';
import 'package:unsplash_app/compponents/pictureslist.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  new Scaffold(
        appBar: AppBar(
            title: Text("Unsplash")
        ),
        body: new MainPageList()
    );
  }
}


class MainPageList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var unsplashListView = Provider.of<PicListView>(context);
    return FutureBuilder<List<Pictures>>(
      future: unsplashListView.getList(),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? PicturesList(pictures: snapshot.data)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
