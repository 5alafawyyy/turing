import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/core/widgets/body_text.dart';
import 'package:turing/core/widgets/title_text.dart';
import 'package:turing/presentation/communities/communities_view.dart';
import 'package:turing/presentation/communities/widgets/communities_list.dart';

import '../meetings/rooms_slider.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  RoomsSlider(), // Rooms Slider Section with Dots Indicator
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        TitleText(text: 'Popular', color: kPrimaryColor,),
                        const SizedBox(
                          width: 10,
                        ),
                        TitleText(text: '.', color: kPrimaryColor,),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          child: GestureDetector(
                            onTap: (){
                              Get.to(() => const CommunitiesView(),
                                duration: const Duration(milliseconds: 400),
                                transition: Transition.rightToLeft,

                              );
                            },
                            child: BodyText(
                              text: 'Communities',
                              size: 15,
                              textHeight: 2, color: kPrimaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ), // Popular text
                  const SizedBox(
                    height: 15,
                  ),
                                    CommunitiesList(),// Groups List
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
