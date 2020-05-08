import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';



// final FirebaseAuth _auth = FirebaseAuth.instance;

class UploaderPage extends StatefulWidget {
  UploaderPage({Key key}) : super(key: key);

  @override
  UploaderPageState createState()  => UploaderPageState();
 
}

class UploaderPageState extends State<UploaderPage> {
FirebaseUser currentUser;
 final StorageReference storageReference = FirebaseStorage().ref().child("gs://${DateTime.now().second.toString()}");
   void _startUpload() async {

    /// Unique file name for the file
    var file  = await ImagePicker.pickImage(source: ImageSource.gallery,maxWidth:500,maxHeight:500,imageQuality:50);
    if(file!= null)
     storageReference.putFile(file);
  }


  @override
  Widget build(BuildContext context) {
    return RaisedButton(onPressed: _startUpload,child:Icon(Icons.file_upload));
  }
}