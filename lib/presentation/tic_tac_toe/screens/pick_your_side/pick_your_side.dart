import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/presentation/tic_tac_toe//screens/New_Game/NewGame2P.dart';
import '../../widgets/button.dart';
import '../../widgets/oh.dart';
import '../../widgets/x.dart';

class PickYourSide extends StatefulWidget {
  bool ai = true;

  PickYourSide({Key? key, required this.ai}) : super(key: key);

  @override
  State<PickYourSide> createState() => _PickYourSideState();
}

class _PickYourSideState extends State<PickYourSide> {
  bool IsOh = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        leading:  IconButton(
          icon:  const Icon(Icons.arrow_back_ios, color: kPrimaryColor),
          onPressed: () => Get.back(),
        ),
        backgroundColor: kBackgroundColor,
        foregroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Container(
                    child: Text(
                        'Choose First Player',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: kPrimaryColor,
                          // fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 80),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              IsOh = true;
                            });
                          },
                          child: Container(
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: IsOh ? itemColor.withOpacity(0.6) : kLightColor,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                OH(size: 120, color: kPrimaryColor)
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              IsOh = false;
                            });
                          },
                          child: Container(
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: IsOh ? kLightColor :itemColor.withOpacity(0.6),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [EX(size: 120, height: 20)],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                MyButton(
                    text: "Continue",
                    onTap: () {
                      Get.to(() => NewGameTwoPlayers(OHTurn: IsOh,));
                    }),
              ]),
        ),
      ),
    );
  }
}
