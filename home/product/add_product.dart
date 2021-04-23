import 'package:flutter/material.dart';
import 'package:flutter_course/app/dashboard/constants.dart';
import 'package:flutter_course/app/dashboard/constants.dart';
import 'package:flutter_course/app/home/Models/product.dart';
import 'package:flutter_course/app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'image_picker.dart';

class AddProduct extends StatefulWidget {

  const AddProduct({Key key,@required this.database}) : super(key: key);
  final Database database;

  static Future<void> show(BuildContext context) async {
    final databse = Provider.of<Database>(context, listen: false);
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddProduct(database: databse,),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  File _imageFile;
  String downloadUrl;
  FirebaseStorage storage;
  bool _upload =false;
  Reference reference;
  final images = ImagePicker();
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
  String documentIdFromCurrentDate() => DateTime.now().toIso8601String();
  Future<void> uploadImage() async{
    storage = FirebaseStorage.instance;
    reference = storage.ref().child(documentIdFromCurrentDate());
    UploadTask uploadTask = reference.putFile(_imageFile);
    await uploadTask.whenComplete(() async{
      downloadUrl= await reference.getDownloadURL();
      print("URL UPLOAD");
     // print("${downloadUrl}");
      setState(() {
        _upload =true;
      });
    }).catchError((onError){
      print(onError);
      print('Error');
    });
  }

  final _formKey =GlobalKey<FormState>();
  String _name;
  String _specification;
  String _address;
  int _contact;
  int _price;
  //String _imgUrl;

  bool _validateAndSaveForm(){
    final form = _formKey.currentState;
    if(form.validate()){
      form.save();
      return true;
    }
    return false;
  }

  Future<void> _submit()async{
    if(_validateAndSaveForm()){
      final product = Product(name: _name, contact: _contact, price:_price ,specification: _specification, address: _address , imgUrl : downloadUrl);
      await widget.database.createProduct(product);
      Navigator.of(context).pop();
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
          title : Text('AddProduct'),
              actions: <Widget>[
                FlatButton(onPressed: _submit, child: Text('save',style: TextStyle(fontSize: 18,color: Colors.white),
      ))
        ],
      ),
      body: _buildContents(),
      backgroundColor: Colors.grey[300],
    );
  }

 Widget _buildContents() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(

          children: [Card(

            child:Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildForm(),
            ),

          ),
          ]
        ),
      ),
    );
 }

  Widget _buildForm() {

    return Form(
        key: _formKey,
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: _buildFormChildren(),
    ));
  }

  List<Widget> _buildFormChildren() {
    return [
      TextFormField(
        decoration: InputDecoration(labelText: 'Product name'),
        onSaved: (value) => _name=value,
        validator: (value) =>value.isNotEmpty ? null : 'name can\'t be Empty',
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Specifications'),
        onSaved: (value) => _specification=value,
        validator: (value) =>value.isNotEmpty ? null : 'Specifications can\'t be Empty',
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Address'),
        onSaved: (value) => _address=value,
        validator: (value) =>value.isNotEmpty ? null : 'Address can\'t be Empty',
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Price'),
        keyboardType: TextInputType.number,
        onSaved: (value) => _price=int.tryParse(value) ?? 0,
        validator: (value) =>value.isNotEmpty ? null : 'Price can\'t be Empty',
      ),

      TextFormField(
        decoration: InputDecoration(labelText: 'Contact No'),
        keyboardType: TextInputType.numberWithOptions(signed: false,decimal: false),
        onSaved: (value) => _contact=int.tryParse(value) ?? 0 ,
        //validator: (value) =>value.isNotEmpty ? null : 'contact can\'t be Empty',
        validator: validateMobile,
      ),
      SizedBox(height: 20,),
      Text('Upload Machine Image',style: TextStyle(fontSize: 18),),
      SizedBox(height: 10,),
      Row(

            children: <Widget>[
              RaisedButton.icon(onPressed:  () async => await _getImage(true), icon: Icon(Icons.photo_camera , color: ksecond,), label: Text('Camera')),
              SizedBox(width: 10,),
              RaisedButton.icon(onPressed:  () async => await _getImage(false), icon: Icon(Icons.photo, color:ksecond,), label: Text('Gallery',)),

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
          _upload ==true ? Center(child: Text('Image uploaded')) :Container(),



    ];

  }
  String validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length != 10)
      return 'Mobile Number must be of 10 digit';
    else
      return null;
  }

}
