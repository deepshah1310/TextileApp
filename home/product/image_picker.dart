//import 'dart:html';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class ImagePick extends StatefulWidget {
  @override
  _ImagePickState createState() => _ImagePickState();
}

class _ImagePickState extends State<ImagePick> {
  File _imageFile;
  String downloadUrl;
  FirebaseStorage storage;
  bool _upload =false;
  Reference reference;
  Future<void> _getImage(bool isCamera) async {
    File image;
    if (isCamera) {
      image = (await ImagePicker.pickImage(source: ImageSource.camera)) as File;
    } else {
      image =
      (await ImagePicker.pickImage(source: ImageSource.gallery)) as File;
    }
    setState(() {
      this._imageFile = image;
    });
  }

  Future<String> uploadImage() async{
    storage = FirebaseStorage.instance;
    reference = storage.ref().child("image1");

    UploadTask uploadTask = reference.putFile(_imageFile);
    uploadTask.whenComplete(() async{
       downloadUrl= await reference.getDownloadURL().toString();
       return downloadUrl;
     /* setState(() {
        _upload =true;
      });*/
    }).catchError((onError) {
      print(onError);
    });
  }
  /*Future downloadImage() async{

    setState(() {
      _downloadUrl = downloadUrl;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonBar(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.photo_camera),
              onPressed: () async => await _getImage(true),
              tooltip: 'Shoot picture',
            ),
            IconButton(
              icon: Icon(Icons.photo),
              onPressed: () async => await _getImage(false),
              tooltip: 'Pick from gallary',
            ),

          ],
        ),
        if (_imageFile == null)
          Container()
        else
          Image.file(
            _imageFile,
            height: 100,
            width: 100,
          ),
        _imageFile == null ? Container() : RaisedButton(child: Text('Upload'), onPressed: () {
          uploadImage();
        }),
        //_upload == false ? Container() : RaisedButton(child: Text("Download image"),onPressed: downloadImage),
       // _downloadUrl ==null ? Container() : Image.network(_downloadUrl,height: 100,width: 100,),

      ],
    );
  }


}
