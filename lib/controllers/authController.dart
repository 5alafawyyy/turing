import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:turing/controllers/control_view.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/data/helper/binding.dart';
import 'package:turing/presentation/auth/login/login_view.dart';

import '../data/models/user.dart';

class AuthController extends GetxController {

  // AuthController.instance..
  static AuthController instance = Get.find();

  //email, pass, name ...
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;


  @override
  void onInit() async{
    await getUserData();
    super.onInit();
  }
  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _isLoggedIn);
  }

  _isLoggedIn(User? user) {
    if (user == null) {
      Get.offAll(() => LoginView());
    } else {
      Get.offAll(() => ControlView(), binding: Binding());
    }
  }

  Future<void> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser
        ?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    UserCredential userCredential = await auth.signInWithCredential(credential);
    User? user = userCredential.user;
    FirebaseFirestore.instance.collection('userData').doc(user?.uid).set({
      "email": user?.email,
      "uid": user?.uid,
      "displayName": user?.displayName,
      "photoUrl": user?.photoURL,
      "joined": '${DateTime.now().day} ${DateTime.now().month} ${DateTime.now().year}',
    });
    update();

  }


  Future<void> register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      ).then((value) {
        FirebaseFirestore.instance.collection('userData')
            .doc(value.user?.uid)
            .set({
          "email": value.user?.email,
          "uid": value.user?.uid,
          "displayName": value.user?.displayName,
          "photoUrl": value.user?.photoURL,
          "joined": '${DateTime.now().day} ${DateTime.now().month} ${DateTime.now().year}',
        });
        // prefs.setString('userID', value.user?.uid);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
          "About User",
          "User message",
          backgroundColor: kPrimaryColor,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "Account creation failed",
            style: TextStyle(
              color: kBackgroundColor,
            ),
          ),
          messageText: const Text(
            'The password provided is too weak.',
            style: TextStyle(
              color: kBackgroundColor,
            ),
          ),

        );
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          "About User",
          "User message",
          backgroundColor: kPrimaryColor,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "User already exists",
            style: TextStyle(
              color: kBackgroundColor,
            ),
          ),
          messageText: const Text(
            'The account already exists for that email.',
            style: TextStyle(
              color: kBackgroundColor,
            ),
          ),

        );

        print('The account already exists for that email.');
      } else {
        Get.snackbar(
          "About User",
          "User message",
          backgroundColor: kPrimaryColor,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "Account creation failed",
            style: TextStyle(
              color: kBackgroundColor,
            ),
          ),
          messageText: Text(
            e.toString(),
            style: const TextStyle(
              color: kBackgroundColor,
            ),
          ),

        );
      }
    } catch (e) {
      Get.snackbar(
        "About User",
        "User message",
        backgroundColor: kPrimaryColor,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          "Account creation failed",
          style: TextStyle(
            color: kBackgroundColor,
          ),
        ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(
            color: kBackgroundColor,
          ),
        ),

      );
    }
  }

  Future<void> login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        // prefs.setString('userID', value.user?.uid);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          "About Login",
          "Login message",
          backgroundColor: kPrimaryColor,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "Login failed",
            style: TextStyle(
              color: kBackgroundColor,
            ),
          ),
          messageText: const Text(
            'No user found for that email.',
            style: TextStyle(
              color: kBackgroundColor,
            ),
          ),

        );
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          "About Login",
          "Login message",
          backgroundColor: kPrimaryColor,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "Login failed",
            style: TextStyle(
              color: kBackgroundColor,
            ),
          ),
          messageText: const Text(
            'Wrong password provided for that user.',
            style: TextStyle(
              color: kBackgroundColor,
            ),
          ),

        );
        print('Wrong password provided for that user.');
      } else {
        Get.snackbar(
          "About Login",
          "Login message",
          backgroundColor: kPrimaryColor,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "Login failed",
            style: TextStyle(
              color: kBackgroundColor,
            ),
          ),
          messageText: Text(
            e.toString(),
            style: const TextStyle(
              color: kBackgroundColor,
            ),
          ),

        );
      }
    } catch (e) {
      Get.snackbar(
        "About Login",
        "Login message",
        backgroundColor: kPrimaryColor,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          "Login failed",
          style: TextStyle(
            color: kBackgroundColor,
          ),
        ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(
            color: kBackgroundColor,
          ),
        ),

      );
    }
    update();

  }

  Future<void> forgetPass(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          "About reset password",
          "Forget password message",
          backgroundColor: kPrimaryColor,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "Reset failed",
            style: TextStyle(
              color: kBackgroundColor,
            ),
          ),
          messageText: const Text(
            'No user found for that email.',
            style: TextStyle(
              color: kBackgroundColor,
            ),
          ),

        );
        print('No user found for that email.');
      }
      else {
        Get.snackbar(
          "About reset password",
          "Forget password message",
          backgroundColor: kPrimaryColor,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            "Reset failed",
            style: TextStyle(
              color: kBackgroundColor,
            ),
          ),
          messageText: Text(
            e.toString(),
            style: const TextStyle(
              color: kBackgroundColor,
            ),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> logout() async {
    await auth.signOut();
    AuthController.instance.currentData = UserModel(
      uid: null.toString(),
      displayName: null.toString(),
      photoUrl: null.toString(),
      email: null.toString(),
    );
    update();

    // await prefs.remove('userID');
  }




  late UserModel currentData;

  Future<UserModel> getUserData() async{
    UserModel userModel;
    var value =  await FirebaseFirestore.instance
        .collection('userData')
        .doc(auth.currentUser?.uid)
        .get();
    if (value.exists){
      userModel = UserModel(
        uid: value.get("uid"),
        displayName: value.get("displayName"),
        photoUrl: value.get("photoUrl"),
        email: value.get("email"),
      );
      currentData = userModel;
      update();
      return currentData;
    }
    else{
      return UserModel(
        uid: null.toString(),
        displayName: null.toString(),
        photoUrl: null.toString(),
        email: null.toString(),
      );
    }


  }

  void updateUserData({
    required User currentUser,
    required String displayName,
    required String photoUrl,
    required String email,
  }) async{
    await FirebaseFirestore.instance
        .collection("userData")
        .doc(auth.currentUser?.uid)
        .set(
        {
          "displayName": displayName,
          "photoUrl": photoUrl,
          "email": email,
        }
        , SetOptions( merge: true));

  }
}