import 'dart:math';

import 'package:turing/data/models/room.dart';
import 'package:turing/data/models/user.dart';

Random random = Random();

String dummyText =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit? ❤🏠🏠';

// User
List names = [
  'Ahmed Khallaf',
  'Mohammed El-Kholy',
  'Wahdan',
  'Momo Abaset',
  'Badawy',
  'Ahmed Taher',
  'Agamy',
  'Samir',
  'Mamdouh',
  'Jimmy',
  'Abdelwahab',
  'Yahia Emam',
  'Hisham',
  'Mohammed Foaad',
  'Mostafa',
  'Khalil',
  'Ahmed Khallaf',
  'Momo Abaset',
  'Badawy',
  'Ahmed Taher',
];

List userData = List.generate(
  20,
      (index) => {
    'name': names[index],
    'username': '@${names[index].toString().split(' ')[0].toLowerCase()}',
    'profileImage': 'assets/images/cat${index % 10 + 1}.jpg',
    'followers': '1k',
    'following': '1',
    'lastAccessTime': '${index + 10}m',
    'isNewUser': random.nextBool(),
  },
);

// MyProfile
dynamic profileData = {
  'name': 'Ahmed Khallaf',
  'username': '@5allaf',
  'profileImage': 'assets/images/ahmedkhallaf.jpeg',
  'followers': '1k',
  'following': '1',
  'lastAccessTime': '0m',
  'isNewUser': random.nextBool(),
};

// Room
List roomData = List.generate(
  10,
      (index) => {
    'title': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit? ❤🏠🏠',
    "users": List.generate(20, (index) => User.fromJson(userData[index]))
      ..shuffle(),
    'speakerCount': 4,
  },
);

List<Room> rooms = List.generate(
  10,
      (index) => Room.fromJson(roomData[index]),
);

List<User> users = List.generate(20, (index) => User.fromJson(userData[index]));
User myProfile = User.fromJson(profileData);