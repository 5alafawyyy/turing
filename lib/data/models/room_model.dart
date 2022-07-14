import 'package:cloud_firestore/cloud_firestore.dart';

class Room {
  final String author;
  final String title;
  final List<User> users;
  final int speakerCount;

  Room({
    required this.author,
    required this.title,
    required this.speakerCount,
    required this.users,
  });

  factory Room.fromJson(json) {
    return Room(
      author: json['author'],
      title: json['title'],
      users: json['users'].map<User>((user) {
        return User(
          displayName: user['name'],
          email: user['username'],
          photoUrl: user['profileImage'],
          joined: user['joined'],
        );
      }).toList(),
      speakerCount: json['speakerCount'],
    );
  }

  factory Room.fromFirestore(
      dynamic snapshot,
      ) {
    final data = snapshot.data();
    return Room(
        author: data?['author'],
        title: data?['title'],
        speakerCount: data?['title'],
        users: data?['users']);
  }
}

class User {
  final String displayName;
  final String email;
  final String photoUrl;
  String? joined;
  String? uid;

  User({
    required this.displayName,
    required this.email,
    required this.photoUrl,
    this.joined,
    this.uid,
  });

  factory User.fromJson(json) {
    return User(
      displayName: json['name'],
      email: json['username'],
      photoUrl: json['profileImage'],
      joined: json['joined'],
      uid: json['uid']
    );
  }

  factory User.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      ) {
    final data = snapshot.data();
    return User(
      displayName: data?['displayName'],
      photoUrl: data?['photoUrl'],
      uid: data?['uid'],
      email: data?['email'],
      joined: data?['joined'],
    );
  }
}