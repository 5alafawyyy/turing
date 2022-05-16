import 'package:flutter/material.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/core/widgets/body_text.dart';
import 'package:turing/core/widgets/icon_and_text.dart';
import 'package:turing/core/widgets/title_text.dart';

class  communitiesItem extends StatelessWidget {
  VoidCallback onTap;
  String imgUrl;
  String titleText;
  String description;
  int noPeople;
  int noPopularity;

  communitiesItem(
      {Key? key,
        required this.onTap,
        required this.imgUrl,
        required this.titleText,
        required this.description,
        this.noPeople = 650,
        this.noPopularity = 12,
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
                  image: AssetImage(imgUrl),
                ),
              ),
            ),

            // Text Container
            Expanded(
              child: Container(
                height: 90,
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
                        maxLines: 1, color: kPrimaryColor,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconAndText(
                            icon: Icons.people_alt_outlined,
                            iconSize: 20,
                            iconColor: kPrimaryColor,
                            text: '$noPeople',
                            textSize: 14,
                            color: kPrimaryColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const IconAndText(
                            icon: Icons.add_comment_outlined,
                            iconSize: 20,
                            iconColor: kPrimaryColor,
                            text: '1.2K',
                            textSize: 14,
                            color: kPrimaryColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          IconAndText(
                            icon: Icons.arrow_circle_up_outlined,
                            iconSize: 20,
                            iconColor: kPrimaryColor,
                            text: '${noPopularity}K',
                            textSize: 14,
                            color: kPrimaryColor,
                          ),
                        ],
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
