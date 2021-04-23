import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/app/dashboard/constants.dart';
import 'package:flutter_course/app/home/Models/job.dart';
import 'package:flutter_course/app/home/Models/product.dart';
import 'package:flutter_course/app/home/Models/shop.dart';
import 'package:flutter_course/app/services/database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddShopPage extends StatefulWidget {
  Database database;
  AddShopPage({this.database});
  static Future<void> show(BuildContext context) async {
    final databse = Provider.of<Database>(context, listen: false);
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddShopPage(database: databse,),
        fullscreenDialog: true,
      ),
    );
  }
  @override
  _AddShopPageState createState() => _AddShopPageState();
}

class _AddShopPageState extends State<AddShopPage> {

  // File _imageFile;
  // String downloadUrl;
  // FirebaseStorage storage;
  // bool _upload = false;
  // Reference reference;
  // final images = ImagePicker();
  // Future<void> _getImage(bool isCamera) async {
  //   File image;
  //   if (isCamera) {
  //     image = (await ImagePicker.pickImage(source: ImageSource.camera)) as File;
  //   } else {
  //     image =
  //         (await ImagePicker.pickImage(source: ImageSource.gallery)) as File;
  //   }
  //   setState(() {
  //     this._imageFile = image;
  //   });
  // }

  // String documentIdFromCurrentDate() => DateTime.now().toIso8601String();
  // Future<void> uploadImage() async {
  //   storage = FirebaseStorage.instance;
  //   reference = storage.ref().child(documentIdFromCurrentDate());
  //   UploadTask uploadTask = reference.putFile(_imageFile);
  //   await uploadTask.whenComplete(() async {
  //     downloadUrl = await reference.getDownloadURL();
  //     print("URL UPLOAD");
  //     // print("${downloadUrl}");
  //     setState(() {
  //       _upload = true;
  //     });
  //   }).catchError((onError) {
  //     print(onError);
  //     print('Error');
  //   });
  // }

  final _formKey = GlobalKey<FormState>();
  String _email;
  String _title;
  String _address;
  String _description;
  int _contact_no;
  bool _spareparts = false;
  bool _threads = false;
  //bool _spareparts;
  //int _salary;
  //String _imgUrl;

  bool _validateAndSaveForm() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> _submit() async {
    if (_validateAndSaveForm()) {
      final shop = Shop(
        title : _title,
        email : _email,
        contact_no :_contact_no,
        spareparts :_spareparts,
        threads : _threads,
        // 'no_employee' : no_employee,
        description :_description,
        address : _address,
        );
      print("${_title}");
      await widget.database.createShop(shop);
      Navigator.of(context).pop();
    }
  }

  // String dropdownValue = 'One';

  //List<String> spinnerItems = ['One', 'Two', 'Three', 'Four', 'Five'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text('Add Shop'),
        actions: <Widget>[
          FlatButton(
              onPressed: _submit,
              child: Text(
                'save',
                style: TextStyle(fontSize: 18, color: Colors.white),
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
        child: Column(children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildForm(),
            ),
          ),
        ]),
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
        decoration: InputDecoration(labelText: 'Shop Name'),
        onSaved: (value) => _title = value,
        validator: (value) => value.isNotEmpty ? null : 'title can\'t be Empty',
      ),
      TextFormField(
        //controller: _textEditingController,
        decoration: InputDecoration(labelText: 'Products Description'),
        textInputAction: TextInputAction.newline,
        keyboardType: TextInputType.multiline,
        onSaved: (value) => _description = value,
        validator: (value) => value.isNotEmpty ? null : 'title can\'t be Empty',
        maxLines: null,
      ),
    Row(
      children: [
        Checkbox(
              value: _spareparts,
              onChanged: (value) {
                setState(() {
                  _spareparts = true;
                });
              },

            ),
        Text("Spare parts"),
        SizedBox(width: 10,),
        Checkbox(
          value: _threads,
          onChanged: (value) {
            setState(() {
              _threads = true;
            });
          },

        ),
        Text("Threads"),
      ],

    ),

      TextFormField(
        decoration: InputDecoration(labelText: 'Address'),
        keyboardType: TextInputType.multiline,
        onSaved: (value) => _address = value,
        validator: (value) =>
        value.isNotEmpty ? null : 'Address can\'t be Empty',
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Email'),
        onSaved: (value) => _email = value,
        validator: (value) => value.isNotEmpty ? null : 'name can\'t be Empty',
      ),

      SizedBox(height: 10,),
      // DropdownButton<String>(
      //   //hint: Text("Employment-type"),
      //   isExpanded: true,
      //   value: dropdownValue,
      //   icon: Icon(Icons.arrow_drop_down),
      //   iconSize: 24,
      //   elevation: 16,
      //   style: TextStyle(color:Colors.grey, fontSize: 18),
      //   underline: Container(
      //     height: 1,
      //     color: Colors.grey,
      //   ),
      //   onChanged: (String data) {
      //     setState(() {
      //       dropdownValue = data;
      //     });
      //   },
      //   items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
      //     return DropdownMenuItem<String>(
      //       value: value,
      //       child: Text(value),
      //     );
      //   }).toList(),
      // ),
      TextFormField(

        decoration: InputDecoration(labelText: 'Contact No'),
        keyboardType:
        TextInputType.numberWithOptions(signed: false, decimal: false),
        onSaved: (value) => _contact_no = int.tryParse(value) ?? 0,
        validator: validateMobile,
      ),
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
