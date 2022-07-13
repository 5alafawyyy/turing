import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:turing/controllers/authController.dart';
import 'package:turing/data/models/user.dart';



final usersCollectionRef = FirebaseFirestore.instance.collection("userData");


// // User
// List names = [
//   'Ahmed Khallaf',
//   'Mohammed El-Kholy',
//   'Wahdan',
//   'Momo Abaset',
//   'Badawy',
//   'Ahmed Taher',
//   'Agamy',
//   'Samir',
//   'Mamdouh',
//   'Jimmy',
//   'Abdelwahab',
//   'Yahia Emam',
//   'Hisham',
//   'Mohammed Foaad',
//   'Mostafa',
//   'Khalil',
//   'Ahmed Khallaf',
//   'Momo Abaset',
//   'Badawy',
//   'Ahmed Taher',
// ];

// List userData = List.generate(
//   20,
//       (index) => {
//     'name': names[index],
//     'username': '@${names[index].toString().split(' ')[0].toLowerCase()}',
//     'profileImage': 'assets/images/cat${index % 10 + 1}.jpg',
//     'followers': '0',
//     'following': '0',
//     'lastAccessTime': '${index + 10}m',
//     'isNewUser': random.nextBool(),
//   },
// );

// MyProfile
dynamic profileData = {
  'name': AuthController.instance.currentData.displayName,
  'username': AuthController.instance.currentData.uid,
  'profileImage': AuthController.instance.currentData.photoUrl,
  'lastAccessTime': '0m',
};

// Room
// List roomData = List.generate(
//   10,
//       (index) => {
//     'title': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit? ❤🏠🏠',
//     "users": List.generate(20, (index) => UserModel.fromJson(userData[index]))
//       ..shuffle(),
//     'speakerCount': 4,
//   },
// );



// List<UserModel> users = List.generate(20, (index) => UserModel.fromFirestore(userData[index]));
UserModel myProfile = UserModel.fromFirestore(profileData);