import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:resume_web/data/models/profile.dart';

abstract class ProfileDatasource {
  Future<Profile> getProfile();
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
}
