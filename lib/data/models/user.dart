import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String email;
  final String displayName;
  final String photoUrl;



  UserModel({
    required this.uid,
    required this.email,
    required this.displayName,
    required this.photoUrl,
  });

  factory UserModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      ) {
    final data = snapshot.data();
    return UserModel(
      displayName: data?['displayName'],
      photoUrl: data?['photoUrl'],
      uid: data?['uid'],
      email: data?['email'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (displayName != null) "displayName": displayName,
      if (photoUrl != null) "photoUrl": photoUrl,
    };
  }
}