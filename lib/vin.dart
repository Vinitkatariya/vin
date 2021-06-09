import 'dart:io';

import 'package:flutter/material.dart';
import 'package:freemar_image_picker/freemar_image_picker.dart';
import 'package:intl/intl.dart';

class Abc extends StatefulWidget {
  Abc({@required this.title});

  final String title;

  @override
  _AbcState createState() => _AbcState();
}

class _AbcState extends State<Abc> {
  List<ImageObject> _imgObjs = [];

  @override
  Widget build(BuildContext context) {
    var configs = ImagePickerConfigs();
    configs.appBarTextColor = Colors.black;
    configs.translateFunc = (name, value) => Intl.message(value, name: name);
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GridView.builder(
                shrinkWrap: true,
                itemCount: _imgObjs.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                    childAspectRatio: 1),
                itemBuilder: (BuildContext context, int index) {
                  var image = _imgObjs[index];
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Image.file(File(image.modifiedPath),
                        height: 80, fit: BoxFit.cover),
                  );
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Get max 5 images
          List<ImageObject> objects = await Navigator.of(context)
              .push(PageRouteBuilder(pageBuilder: (context, animation, __) {
            return ImagePicker(maxCount: 5);
          }));

          if (objects.length > 0) {
            setState(() {
              _imgObjs = objects;
            });
          }
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
