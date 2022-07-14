import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/core/utils/styles.dart';

class DarkLightModeViewBody extends StatefulWidget {
  const DarkLightModeViewBody({Key? key}) : super(key: key);

  @override
  State<DarkLightModeViewBody> createState() => _DarkLightModeViewBodyState();
}

class _DarkLightModeViewBodyState extends State<DarkLightModeViewBody> {
  double _toggleXAlign = -1;
  final double _leftToggleAlign = -1;
  final double _rightToggleAlign = 1;

  late Color _leftDescriptionColor;
  late Color _rightDescriptionColor;

  Color activeTextColor = kLightColor;
  Color inactiveTextColor = kPrimaryColor;

  @override
  void initState() {
    super.initState();

    _leftDescriptionColor = activeTextColor;
    _rightDescriptionColor = inactiveTextColor;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: kPrimaryColor),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Change Theme',
          style: TextStyle(
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
        backgroundColor: kBackgroundColor,
        foregroundColor: kPrimaryColor,
        shadowColor: kBackgroundColor,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          width: 300.0,
          height: 50.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(50.0),
            ),
            border: Border.all(color: Colors.grey),
          ),
          child: Stack(
            children: [
              AnimatedAlign(
                alignment: Alignment(_toggleXAlign, 0),
                duration: Duration(milliseconds: 300),
                child: Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    color: itemColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(
                    () {

                       Get.changeTheme(ThemeData.light());

                      _toggleXAlign = _leftToggleAlign;

                      _leftDescriptionColor = inactiveTextColor;
                      _rightDescriptionColor = activeTextColor;

                    },
                  );

                  // widget.onRightToggleActive();
                },
                child: Align(
                  alignment: Alignment(-1, 0),
                  child: Container(
                    width: 150,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Text(
                      'Light Mode',
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(
                    () {
                      Get.changeTheme(ThemeData.dark());
                      _toggleXAlign = _rightToggleAlign;

                      _leftDescriptionColor = activeTextColor;
                      _rightDescriptionColor = inactiveTextColor;
                    },
                  );

                  // widget.onLeftToggleActive();
                },
                child: Align(
                  alignment: Alignment(1, 0),
                  child: Container(
                    width: 150,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Text(
                      'Dark Mode',
                      style: TextStyle(
                          color: kLightColor,
                          fontWeight: FontWeight.bold,
                      ),
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
