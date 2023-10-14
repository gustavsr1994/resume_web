import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:resume_web/data/models/profile.dart';

abstract class ProfileDatasource {
  Future<Profile> getProfile();
  Future<String> getPhotoProfile();
}

class ProfileDataSourceImp implements ProfileDatasource {
  @override
  Future<Profile> getProfile() async {
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref().child('profile');
    var data = await databaseReference.once();
    var response =
        Profile.fromJson(jsonDecode(jsonEncode(data.snapshot.value)));
    return response;
  }

  @override
  Future<String> getPhotoProfile() async {
    final storageRef =
        FirebaseStorage.instance.ref().child("my_gallery/1696860774126.jpg");
    final linkResult = await storageRef.getDownloadURL();
    return linkResult;
  }
}
