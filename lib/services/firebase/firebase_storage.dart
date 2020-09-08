import 'dart:io';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:my_words/services/firebase/remote_config_service.dart';

class StorageController {
  static Future<String> uploadFile(String userUid, File file) async {
    //print('StorageController uploadFile()');
    try {
      final RemoteConfig config = await setupRemoteConfig();
      final String value = config.getValue('storageBucket').asString();

      final FirebaseStorage theStorage = FirebaseStorage(
        storageBucket: value,
      );

      final StorageReference storageRef =
          theStorage.ref().child('users/$userUid/profile/avatar');
      final StorageUploadTask uploadTask = storageRef.putFile(file);
      final StorageTaskSnapshot completedTask = await uploadTask.onComplete;
      final String downloadUrl =
          await completedTask.ref.getDownloadURL() as String;
      return downloadUrl;
    } catch (e) {
      // ignore: avoid_print
      print('ERROR from StorageController uploadFile: \n$e');
    }
    return null;
  }

  static Future<String> getImageUrl(String userUid) async {
    try {
      final RemoteConfig config = await setupRemoteConfig();
      final String value = config.getValue('storageBucket').asString();

      final FirebaseStorage theStorage = FirebaseStorage(
        storageBucket: value,
      );
      final storageRef = await theStorage.ref().getPath();
      //print('storageRef: ${storageRef.toString()}');
      return storageRef;
    } catch (e) {
      // ignore: avoid_print
      print('ERROR from StorageController getImageUrl: \n$e');
    }
    return null;
  }
}
