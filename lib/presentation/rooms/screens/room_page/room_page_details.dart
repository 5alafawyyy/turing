import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/core/utils/appId.dart';
import 'package:turing/core/utils/data.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/core/utils/temp_token.dart';
import 'package:turing/core/widgets/round_button.dart';
import 'package:turing/core/widgets/round_image.dart';
import 'package:turing/presentation/profile/screens/profile_page/profile_page.dart';
import 'package:turing/presentation/rooms/screens/room_page/widgets/room_profile.dart';
import 'package:turing/presentation/rooms/screens/video_call/video_call.dart';

import '../../../../controllers/authController.dart';
import '../../../../core/utils/channel.dart';
import '../../../../data/models/room_model.dart';

class RoomPage extends StatefulWidget {

  final Room room;
  final ClientRole role;

  const RoomPage({ required this.room, required this.role}) ;

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  final List _users = [];

  bool muted = false;
  late RtcEngine _engine;

  @override
  void initState() {
    super.initState();
    // Initialize Agora SDK
    initialize();
  }

  @override
  void dispose() {
    // Clear users
    _users.clear();
    // Destroy sdk
    _engine.leaveChannel();
    _engine.destroy();
    super.dispose();
  }

  /// Create Agora SDK instance and initialize
  Future<void> initialize() async {
    await _initAgoraRtcEngine();
    _addAgoraEventHandlers();
    await _engine.joinChannel(Token, channelName, null, 0);
  }

  Future<void> _initAgoraRtcEngine() async {
    _engine = await RtcEngine.create(appId);
    await _engine.enableAudio();
    await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await _engine.setClientRole(widget.role);
  }

  /// Add Agora event handlers

  void _addAgoraEventHandlers() {
    _engine.setEventHandler(RtcEngineEventHandler(
      error: (code) {
        setState(() {
          print('onError: $code');
        });
      },
      joinChannelSuccess: (channel, uid, elapsed) {
        print('onJoinChannel: $channel, uid: $uid');
      },
      leaveChannel: (stats) {
        setState(() {
          print('onLeaveChannel');
          _users.clear();
        });
      },
      userJoined: (uid, elapsed) {
        print('userJoined: $uid');
        setState(() {
          _users.add(uid);
        });
      },
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              iconSize: 30,
              icon: const Icon(Icons.keyboard_arrow_down),
              onPressed: () {
                Get.back();
              },
            ),
            const Text(
              'All rooms',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Get.to(() =>ProfilePage(
                  displayName: 'AuthController.instance.currentData.displayName',
                  photoUrl: 'AuthController.instance.currentData.photoUrl',
                ),
                );
              },
              child: RoundImage(
                url: AuthController.instance.currentData.photoUrl,
                width: 40,
                height: 40,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
        ),
        decoration: const BoxDecoration(
          color: kBackgroundColor,
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(
                bottom: 80,
                top: 20,
              ),
              child: Column(
                children: [
                  buildTitle(widget.room.title),
                  const SizedBox(
                    height: 30,
                  ),
                  buildSpeakers(widget.room.users.sublist(0, widget.room.speakerCount)),
                  buildOthers(widget.room.users.sublist(widget.room.speakerCount)),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: buildBottom(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Text(
            title,
            style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          child: IconButton(
            onPressed: () {},
            iconSize: 30,
            icon: Icon(Icons.more_horiz),
          ),
        ),
      ],
    );
  }

  Widget buildSpeakers(List<User> users) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 150,
      ),
      itemCount: users.length,
      itemBuilder: (context, index) {
        return RoomProfile(
          user: users[index],
          isModerator: index == 0,
          isMute: index == 3,
          size: 80,
        );
      },
    );
  }

  Widget buildOthers(List<User> users) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(
            bottom: 16,
            left: 5,
          ),
          child: Text(
            'Others in the room',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: kSecondaryColor,
            ),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisExtent: 100,
          ),
          itemCount: users.length,
          itemBuilder: (gc, index) {
            return RoomProfile(
              user: users[index],
              size: 50,
            );
          },
        ),
      ],
    );
  }

  Widget buildBottom(BuildContext context) {
    return Container(
      child:RoundButton(
        onPressed: () {
          Get.back();
          // Get.to(() => VideoCall());
        },
        color: kPrimaryColor,
        child: const Text(
          'Leave Quietly 👋',
          style: TextStyle(
            color: kWhiteColor,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
