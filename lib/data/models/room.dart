
import 'package:turing/data/models/user.dart';

class Room {
  final String title;
  final List<User> users;
  final int speakerCount;

  Room({
    required this.title,
    required this.speakerCount,
    required this.users,
  });

  factory Room.fromJson(json) {
    return Room(
      title: json['title'],
      users: json['users'],
      speakerCount: json['speakerCount'],
    );
  }
}