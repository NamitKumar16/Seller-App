// https://firebasestorage.googleapis.com/v0/b/shop-app-b0a5b.appspot.com/o/products%2Flight1.gif?alt=media&token=be9b3740-453e-4821-932e-bd94ef41d660
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class UploadDownload {
  late UploadTask uploadTask;
  Reference ref = FirebaseStorage.instance.ref().child('products');
  UploadTask uploadImage(String fileName) {
    ref = ref.child("/" + fileName);
    print("File Name " + fileName);
    File file = File(fileName);
    print("File Object is $file");
    uploadTask = ref.putFile(File(fileName)); // Here Upload

    return uploadTask;
  }

  downloadImage() {}
}
