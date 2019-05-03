import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

void main() => runApp(new CameraApp());

class CameraApp extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  File image;
  File image2;

//  To use Gallery or File Manager to pick Image
//  Comment Line No. 19 and uncomment Line number 20
  picker() async {
    print('Picker is called');
    File img = await ImagePicker.pickImage(source: ImageSource.camera);
   
    if (img != null) {
      image2 = null;
      image = img;
      setState(() {});
    }
  
  }

  picker2() async {
    print('Picker is called');
   
    File img2 = await ImagePicker.pickImage(source: ImageSource.gallery);
  
    if (img2 != null) {
      image = null;
      image2 = img2;
      setState(() {});
    }

  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Image Picker'),
        ),
        body: new Column(
          children: <Widget>[
              Container(      
              child: new Center(
              child: image == null
                ? new Text('No Image to Show ')
                : new Image.file(image,height:200, width: 200, ),
          ),
        ),
        Container(      
              child: new Center(
                
              child: image2 == null
                ? new Text('No Image to Show ')
                : new Image.file(image2,height:200.0 ,),
          ),
        ), 
        FloatingActionButton(
          onPressed: picker,
          child: new Icon(Icons.camera_alt),
        ),
        FloatingActionButton(
          onPressed: picker2,
          child: new Icon(Icons.image),
        ),
        ],
        ),    
      ),
    );
  }
}
