import 'package:flutter/cupertino.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/core/widgets/body_text.dart';
import 'package:turing/core/widgets/title_text.dart';

Widget articleItem ({
  required VoidCallback onTap,
  required String imgUrl,
  required String titleText,
  required String description,


}){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kLightColor,
      ),
      // margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TitleText(
                    color: kPrimaryColor,
                    text: titleText,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  BodyText(
                    color: kPrimaryColor,
                    text: description,
                    size: 13,
                    maxLines: 3,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                ],
              ),
            ),
          ),
          // Image Section
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kForegroundColor,
              image: DecorationImage(
                opacity: 0.8,
                fit: BoxFit.cover,
                image: AssetImage(imgUrl),
              ),
            ),
          ),

        ],
      ),
    ),
  );
}
