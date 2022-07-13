import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jitsi_meet/jitsi_meet.dart';

import '../data/models/static_room_data.dart';

class MeetingController extends GetxController {
  static final MeetingController instance = MeetingController();

  @override
  void onInit() {
    super.onInit();
    JitsiMeet.addListener(JitsiMeetingListener(
        onConferenceWillJoin: _onConferenceWillJoin,
        onConferenceJoined: _onConferenceJoined,
        onConferenceTerminated: _onConferenceTerminated,
        onError: _onError));

    getStaticRoomData();
  }

  @override
  void onClose() {
    super.onClose();
    JitsiMeet.removeAllListeners();
  }

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> get roomsHistory => _fireStore
      .collection('userData')
      .doc(_auth.currentUser!.uid)
      .collection('staticRoomsHistory')
      .snapshots();

  // get static room from firebase fireStore

  CollectionReference roomRef = FirebaseFirestore.instance.collection('staticRooms');
  getStaticRoomData() async {
    QuerySnapshot querySnapshot = await roomRef.get();
    roomPages.clear();
    querySnapshot.docs.forEach((element) {
      roomPages.add(element.data());
    });
    update();
  }
  void addToRoomHistory(String roomName) async {
    try {
      await _fireStore
          .collection('userData')
          .doc(_auth.currentUser!.uid)
          .collection('staticRoomsHistory')
          .add({
        'roomsName': roomName,
        'createdAt': DateTime.now(),
      });

      await _fireStore.collection('staticRoomsHistory').add({
        'roomsName': roomName,
        'createdBy': _auth.currentUser!.uid,
        'displayName': _auth.currentUser!.displayName,
        'photoUrl': _auth.currentUser!.photoURL,
        'createdAt': DateTime.now(),
      });
    } catch (e) {
      print(e);
    }
  }

  void createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String userName = '',
  }) async {
    try {
      Map<FeatureFlagEnum, bool> featureFlags = {
        FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
      };
      featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;

      var options = JitsiMeetingOptions(
        room: roomName,
      )
        ..userDisplayName = _auth.currentUser?.displayName
        ..userEmail = _auth.currentUser?.email
        ..userAvatarURL = _auth.currentUser?.photoURL
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;

      addToRoomHistory(roomName);

      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      print("error: $error");
    }

    /*
  bool? isAudioOnly = true;
  bool? isAudioMuted = true;
  bool? isVideoMuted = true;
  onAudioOnlyChanged(bool? value) {
      isAudioOnly = value;
      update();
  }

  onAudioMutedChanged(bool? value) {
      isAudioMuted = value;
      update();
  }

  onVideoMutedChanged(bool? value) {
      isVideoMuted = value;
      update();
  }*/
  }

  void _onConferenceWillJoin(message) {
    debugPrint("_onConferenceWillJoin broadcasted with message: $message");
  }

  void _onConferenceJoined(message) {
    debugPrint("_onConferenceJoined broadcasted with message: $message");
  }

  void _onConferenceTerminated(message) {
    debugPrint("_onConferenceTerminated broadcasted with message: $message");
  }

  _onError(error) {
    debugPrint("_onError broadcasted: $error");
  }
}
