import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/core/widgets/round_button.dart';
import 'package:turing/presentation/rooms/controllers/room_controller.dart';
import 'package:turing/presentation/rooms/screens/room_page/room_page_details.dart';
import 'package:turing/presentation/rooms/widgets/new_room_text_form_field.dart';
import 'package:turing/presentation/rooms/widgets/room_card.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';



class RoomsViewBody extends StatelessWidget {
  RoomController controller = Get.put(RoomController());

  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    controller.refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    controller.refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SmartRefresher(
          enablePullDown: true,
          controller: controller.refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: ListView.builder(
            padding: const EdgeInsets.only(
              // bottom: 80,
              left: 15,
              right: 15,
            ),
            itemBuilder: (context, index) {

              return buildRoomCard();
            },
            itemCount: 1,
          ),
        ),
        buildStartRoomButton(context),
      ],
    );
  }

  Widget buildRoomCard() {
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(
          RoomPage(),
          enableDrag: true,
          backgroundColor: kLightColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              )),
          clipBehavior: Clip.antiAlias,
          // isScrollControlled: true,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: RoomCard(),
      ),
    );
  }

  Widget buildStartRoomButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: RoundButton(
        onPressed: () {
          Get.bottomSheet(
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(
                  top: 10,
                  right: 20,
                  left: 20,
                  bottom: 20,
                ),
                child: Column(
                  children: [
                    Container(
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        '+ Add a Topic',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Form(
                      key: controller.formKey,
                      child: newRoomTextFormField(
                        controller: controller.newRoomTitleController,
                        keyboardType: TextInputType.text,
                        hintText: '',
                        color: kPrimaryColor,
                        fillColor: kLightColor,
                        errorColor: itemColor,
                        maxLine: 2,
                        validate: controller.validate,
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      height: 40,
                      indent: 20,
                      endIndent: 20,
                      color: itemColor.withOpacity(0.3),
                    ),
                    const Text(
                      'Start a new room for everyone',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RoundButton(
                      color: kSecondaryColor,
                      onPressed: (){
                        controller.createRoom();
                      },
                      text: '🎉 Let\'s go',
                    )
                  ],
                ),
              ),
            ),
            enableDrag: true,
            backgroundColor: kLightColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
                side: const BorderSide(width: 1, color: kWhiteColor)),
            clipBehavior: Clip.antiAlias,
          );
        },
        color: kSecondaryColor,
        text: '+ Start a room',
      ),
    );
  }
}
