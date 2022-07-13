import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/controllers/meeting_controller.dart';
import 'package:turing/core/utils/dimension.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/core/widgets/body_text.dart';
import 'package:turing/core/widgets/title_text.dart';
import '../../../../data/models/static_room_data.dart';
import 'new_meeting.dart';
import 'room_slide_view.dart';

class RoomsSlider extends StatefulWidget {
  @override
  State<RoomsSlider> createState() => _RoomsSliderState();
}

class _RoomsSliderState extends State<RoomsSlider> {
  final PageController pageController = PageController(viewportFraction: 0.89);
  double _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Dimensions.pageView,
          // color: kMainColor,
          child: PageView.builder(
            controller: pageController,
            itemCount: roomPages.length + 1,
            itemBuilder: (context, index) {
              return _buildPageItem(index);
            },
            physics: const BouncingScrollPhysics(),
          ),
        ),
        DotsIndicator(
          dotsCount: roomPages.length + 1,
          position: _currentPageValue,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            activeColor: kPrimaryColor,
            color: itemColor,
          ),
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else {
      var currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    return GetBuilder<MeetingController>(
      init: MeetingController(),
      builder: (controller) =>GestureDetector(
        onTap: () {
          print(index);
          index == roomPages.length
              ? Get.to(() => NewMeeting())
              : Get.to(() => RoomSlideView(
                    index: index,
                  ));
        },
        child: Transform(
          transform: matrix,
          child: Stack(
            children: [
              Container(
                height: _height,
                margin: const EdgeInsets.only(
                  left: 5,
                  right: 5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: index.isEven ? kBackgroundColor : kForegroundColor,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: index == roomPages.length
                        ? AssetImage('assets/images/add-new-image.png')
                        : NetworkImage(roomPages[index]['image'])
                            as ImageProvider,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: Dimensions.pageViewTextContainer,
                  margin: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: kBackgroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        // spreadRadius: 1,
                        blurRadius: 3.0,
                        offset: const Offset(0, 5), // changes position of shadow
                      ),
                      const BoxShadow(
                        color: kBackgroundColor,
                        offset: Offset(-5, 0), // changes position of shadow
                      ),
                      const BoxShadow(
                        color: kBackgroundColor,
                        offset: Offset(5, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 15,
                      right: 15,
                    ),
                    width: double.infinity,
                    child: index == roomPages.length
                        ? Center(
                            child: TitleText(
                            text: 'Create new meeting',
                            color: kPrimaryColor,
                          ))
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitleText(
                                text: roomPages[index]['title'],
                                color: kPrimaryColor,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              BodyText(
                                text: roomPages[index]['body'],
                                color: kPrimaryColor.withOpacity(0.8),
                                maxLines: 3,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
