import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:turing/controllers/authController.dart';
import 'package:turing/core/utils/styles.dart';
import '../../../../controllers/meeting_controller.dart';

class NewMeeting extends StatefulWidget {
  @override
  _NewMeetingState createState() => _NewMeetingState();
}

class _NewMeetingState extends State<NewMeeting> {
  final serverText = TextEditingController();
  final roomText = TextEditingController(text: "Turing");
  final title = TextEditingController(text: "Meeting Title");
  final body = TextEditingController(text: "Meeting Description");
  final nameText = TextEditingController(
      text: "${AuthController.instance.currentData.displayName}");
  final emailText = TextEditingController(
      text: "${AuthController.instance.currentData.email}");
  final iosAppBarRGBAColor =
      TextEditingController(text: "#0080FF80"); //transparent blue
  bool? isAudioOnly = true;
  bool? isAudioMuted = true;
  bool? isVideoMuted = true;

  @override
  void initState() {
    super.initState();
    JitsiMeet.addListener(JitsiMeetingListener(
        onConferenceWillJoin: _onConferenceWillJoin,
        onConferenceJoined: _onConferenceJoined,
        onConferenceTerminated: _onConferenceTerminated,
        onError: _onError));
  }

  @override
  void dispose() {
    super.dispose();
    JitsiMeet.removeAllListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightColor,
      appBar: AppBar(
        title: const Text('Create new meeting'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: (){
            Get.back();
          },
        ),
        elevation: 0.5,
        foregroundColor: kPrimaryColor,
        backgroundColor: kBackgroundColor,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              TextField(
                controller: title,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: kLightColor,
                  labelText: "Title",
                  labelStyle: TextStyle(
                    color: kPrimaryColor,
                  ),
                  // prefixIcon: const Icon(Icons.title),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: kPrimaryColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                    borderSide: BorderSide(
                      width: 1,
                      color: kPrimaryColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                    borderSide: BorderSide(
                      width: 1,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 14.0,
              ),
              TextField(
                controller: body,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: kLightColor,
                  labelText: "Meeting Description",
                  labelStyle: TextStyle(
                    color: kPrimaryColor,
                  ),
                  // prefixIcon: const Icon(Icons.title),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: kPrimaryColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                    borderSide: BorderSide(
                      width: 1,
                      color: kPrimaryColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                    borderSide: BorderSide(
                      width: 1,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 14.0,
              ),
              TextField(
                controller: nameText,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: kLightColor,
                  labelText: "Display Name",
                  labelStyle: TextStyle(
                    color: kPrimaryColor,
                  ),
                  // prefixIcon: const Icon(Icons.title),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: kPrimaryColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                    borderSide: BorderSide(
                      width: 1,
                      color: kPrimaryColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                    borderSide: BorderSide(
                      width: 1,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 14.0,
              ),
              TextField(
                controller: emailText,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: kLightColor,
                  labelText: "Email Address",
                  labelStyle: TextStyle(
                    color: kPrimaryColor,
                  ),
                  // prefixIcon: const Icon(Icons.title),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: kPrimaryColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                    borderSide: BorderSide(
                      width: 1,
                      color: kPrimaryColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                    borderSide: BorderSide(
                      width: 1,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 14.0,
              ),
              CheckboxListTile(
                title: Text("Audio Only"),
                value: isAudioOnly,
                onChanged: _onAudioOnlyChanged,
                checkColor: kLightColor,
                activeColor: kPrimaryColor,
              ),
              SizedBox(
                height: 2.0,
              ),
              CheckboxListTile(
                title: Text("Audio Muted"),
                value: isAudioMuted,
                onChanged: _onAudioMutedChanged,
                checkColor: kLightColor,
                activeColor: kPrimaryColor,
              ),
              SizedBox(
                height: 2.0,
              ),
              CheckboxListTile(
                title: Text("Video Muted"),
                value: isVideoMuted,
                onChanged: _onVideoMutedChanged,
                checkColor: kLightColor,
                activeColor: kPrimaryColor,
              ),
              Divider(
                height: 48.0,
                thickness: 2.0,
              ),
              SizedBox(
                height: 64.0,
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    _joinMeeting();
                    addToRoomHistory(roomText.text);
                  },
                  child: Text(
                    "Create Meeting",
                    style: TextStyle(color: kLightColor),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => kPrimaryColor)),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onAudioOnlyChanged(bool? value) {
    setState(() {
      isAudioOnly = value;
    });
  }

  _onAudioMutedChanged(bool? value) {
    setState(() {
      isAudioMuted = value;
    });
  }

  _onVideoMutedChanged(bool? value) {
    setState(() {
      isVideoMuted = value;
    });
  }

  _joinMeeting() async {
    // Enable or disable any feature flag here
    // If feature flag are not provided, default values will be used
    // Full list of feature flags (and defaults) available in the README
    Map<FeatureFlagEnum, bool> featureFlags = {
      FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
    };
    featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
    // Define meetings options here
    var options = JitsiMeetingOptions(room: roomText.text)
      // ..serverURL = serverUrl
      ..subject = title.text
      ..userDisplayName = nameText.text
      ..userEmail = emailText.text
      ..audioOnly = isAudioOnly
      ..audioMuted = isAudioMuted
      ..videoMuted = isVideoMuted
      ..featureFlags.addAll(featureFlags)
      ..webOptions = {
        "roomName": roomText.text,
        "width": "100%",
        "height": "100%",
        "enableWelcomePage": true,
        "chromeExtensionBanner": null,
        "userInfo": {"displayName": nameText.text}
      };

    debugPrint("JitsiMeetingOptions: $options");
    await JitsiMeet.joinMeeting(
      options,
      listener: JitsiMeetingListener(
          onConferenceWillJoin: (message) {
            debugPrint("${options.room} will join with message: $message");
          },
          onConferenceJoined: (message) {
            debugPrint("${options.room} joined with message: $message");
          },
          onConferenceTerminated: (message) {
            debugPrint("${options.room} terminated with message: $message");
          },
          genericListeners: [
            JitsiGenericListener(
                eventName: 'readyToClose',
                callback: (dynamic message) {
                  debugPrint("readyToClose callback");
                }),
          ]),
    );
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

  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void addToRoomHistory(String roomName) async {
    try {
      await _fireStore
          .collection('userData')
          .doc(_auth.currentUser!.uid)
          .collection('staticRoomsHistory')
          .add({
        'roomsName': roomName,
        'title': title.text,
        'body': body.text,
        'image': 'https://firebasestorage.googleapis.com/v0/b/turing-d92dd.appspot.com/o/staticRooms%2Fno-image.png?alt=media&token=0a73d22f-4ccf-4436-8681-8c0df968c3e0',
        'createdAt': DateTime.now(),
      });

      await _fireStore.collection('staticRooms').add({
        'roomsName': roomName,
        'title': title.text,
        'body': body.text,
        'image': 'https://firebasestorage.googleapis.com/v0/b/turing-d92dd.appspot.com/o/staticRooms%2Fno-image.png?alt=media&token=0a73d22f-4ccf-4436-8681-8c0df968c3e0',
        'createdBy': _auth.currentUser!.uid,
        'displayName': _auth.currentUser!.displayName,
        'photoUrl': _auth.currentUser!.photoURL,
        'createdAt': DateTime.now(),
      });
    } catch (e) {
      print(e);
    }
    MeetingController.instance.getStaticRoomData();
  }
}
