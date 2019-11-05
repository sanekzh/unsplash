import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:unsplash_app/models/pictures.dart';
import 'package:unsplash_app/pages/detail.dart';

class PicturesList extends StatelessWidget {
  final List<Pictures> pictures;

  PicturesList({Key key, this.pictures}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pictures.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      MaterialButton(
                        child: Image.network(
                          pictures[index].smallPic,
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                          loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PictureDetailScreen(
                                  picture: pictures[index]),
                            ),
                          );
                        },
                      ),

                      Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "${pictures[index]?.description ?? pictures[index]?.altDescription ?? ""} ",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "Автор: ${pictures[index].autor}",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
