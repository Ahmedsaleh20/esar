import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class FireBaseProvider {

  final storageRef = FirebaseStorage.instance.ref();
  //create a collection in a firebase 

  CollectionReference items = FirebaseFirestore.instance.collection('items');
  Future<String> sendToDB({required File imageUpload}) async {
    //get the image name from the device.
    final nameImage = basename(imageUpload.path);
    //prepare the image path to firestore
    final ref = storageRef.child('images').child(nameImage);
    //upload the image to firestore
    await ref.putFile(imageUpload);

    return await ref.getDownloadURL();
  }
}
