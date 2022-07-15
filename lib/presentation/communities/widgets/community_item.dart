import 'package:flutter/material.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/core/widgets/body_text.dart';
import 'package:turing/core/widgets/title_text.dart';

class  communitiesItem extends StatelessWidget {
  VoidCallback onTap;
  String imgUrl;
  String titleText;
  String description;
  int noPeople;

  communitiesItem(
      {Key? key,
        required this.onTap,
        required this.imgUrl,
        required this.titleText,
        required this.description,
        this.noPeople = 0,
      }) : super(key: key) ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
        child: Row(
          children: [
            // Image Section
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kForegroundColor,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    imgUrl,
                  ),
                ),
              ),
            ),

            // Text Container
            Expanded(
              child: Container(
                height: 100,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: kBodyColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TitleText(
                        text: titleText,
                        color: kPrimaryColor,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      BodyText(
                        text: description,
                        maxLines: 2,
                        color: kPrimaryColor,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
