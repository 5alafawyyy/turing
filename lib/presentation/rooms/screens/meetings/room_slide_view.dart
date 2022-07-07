import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/controllers/meeting_controller.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/core/widgets/body_text.dart';
import 'package:turing/data/models/static_room_data.dart';

class RoomSlideView extends GetView<MeetingController> {
  int index;
  RoomSlideView({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.clear,
            color: Colors.black.withOpacity(0.7),
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          '${roomPages[index].title}',
          style: TextStyle(color: Colors.black.withOpacity(0.7)),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: kForegroundColor,
      ),
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: roomPages[index].image,
                fit: BoxFit.cover,
              ),
            ),
            child: Text(''),
          ),
          const SizedBox(
            height: 2.0,
          ),
          Expanded(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
              child: SingleChildScrollView(
                child: BodyText(
                  color: Colors.black.withOpacity(0.7),
                  text: roomPages[index].body,
                  size: 17,
                  overflow: TextOverflow.visible,
                  maxLines: 30,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 0.0,
          ),
          ElevatedButton(
            onPressed: () {
              //TODO: Join Function
              MeetingController.instance.createRoom(
                isAudioMuted: true,
                isVideoMuted: true,
                roomName: roomPages[index].title,
              );
            },
            child: Text('Join Room 🤞'),
            style: ElevatedButton.styleFrom(
              primary: kPrimaryColor,
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
              textStyle: TextStyle(
                fontSize: 18,
              )
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
