import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/presentation/profile/profile_page.dart';
import 'package:turing/presentation/search/widgets/roomViewFromSearch.dart';
import '../../controllers/search_controller.dart';
import '../articles/screens/article_details/article_details_view.dart';
import '../communities/screens/community_details/community_details_view.dart';
import '../../controllers/community_details_controller.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController searchController = TextEditingController();
  late QuerySnapshot snapshotData;

  @override
  Widget build(BuildContext context) {
    Widget searchedData() {
      return GetBuilder<SearchController>(
        init: SearchController(),
        builder: (controller) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () async {
                    await SearchController.instance
                        .articleData(searchController.text)
                        .then((value) {
                      snapshotData = value;
                      controller.searchPressed();
                    });
                    controller.changeArticlesStates();
                  },
                  child: Text(
                    'Articles',
                    style: controller.articlesButton
                        ? TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                          )
                        : TextStyle(
                            fontSize: 16,
                            color: kSecondaryColor,
                          ),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    await SearchController.instance
                        .communitiesData(searchController.text)
                        .then((value) {
                      snapshotData = value;
                      controller.searchPressed();
                    });
                    controller.changeCommunitiesStates();
                  },
                  child: Text(
                    'Communities',
                    style: controller.communitiesButton
                        ? TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                          )
                        : TextStyle(
                            fontSize: 16,
                            color: kSecondaryColor,
                          ),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    await SearchController.instance
                        .roomData(searchController.text)
                        .then((value) {
                      snapshotData = value;
                      controller.searchPressed();
                    });
                    controller.changeRoomsStates();
                  },
                  child: Text(
                    'Rooms',
                    style: controller.roomsButton
                        ? TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                          )
                        : TextStyle(
                            fontSize: 16,
                            color: kSecondaryColor,
                          ),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    await SearchController.instance
                        .usersData(searchController.text)
                        .then((value) {
                      snapshotData = value;
                      controller.searchPressed();
                    });
                    controller.changeUsersStates();
                  },
                  child: Text(
                    'Users',
                    style: controller.usersButton
                        ? TextStyle(
                            fontSize: 18,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                          )
                        : TextStyle(
                            fontSize: 16,
                            color: kSecondaryColor,
                          ),
                  ),
                ),
              ],
            ),
            Divider(
              height: 0.5,
              thickness: 0.4,
              color: kPrimaryColor,
            ),
            Expanded(
              child: controller.articlesButton
                  ? ListView.builder(
                      itemCount: snapshotData.docs.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(
                              () => const ArticleDetailsView(),
                              arguments: {
                                'titleText': snapshotData.docs[index]['title'],
                                'description': snapshotData.docs[index]['desc'],
                                'likes': snapshotData.docs[index]['likes'],
                                'author': snapshotData.docs[index]['author'],
                              },
                              duration: const Duration(milliseconds: 500),
                              transition: Transition.rightToLeft,
                            );
                          },
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  snapshotData.docs[index]['photoUrl']),
                            ),
                            title: Text(
                              snapshotData.docs[index]['title'],
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 20.0,
                              ),
                            ),
                            subtitle: Text(
                              snapshotData.docs[index]['desc'],
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        );
                      })
                  : (controller.communitiesButton
                      ? ListView.builder(
                          itemCount: snapshotData.docs.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                CommunityDetailsController.instance
                                    .setDocId(snapshotData.docs[index].id);
                                Get.to(
                                  () => const CommunityPageDetailsView(),
                                  arguments: {
                                    'communityId': snapshotData.docs[index].id,
                                  },
                                  duration: const Duration(milliseconds: 500),
                                  transition: Transition.downToUp,
                                );
                                print(snapshotData.docs[index].id);
                              },
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      snapshotData.docs[index]['imgUrl']),
                                ),
                                title: Text(
                                  snapshotData.docs[index]['titleText'],
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20.0,
                                  ),
                                ),
                                subtitle: Text(
                                  snapshotData.docs[index]['description'],
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            );
                          })
                      : (controller.roomsButton
                          ? ListView.builder(
                              itemCount: snapshotData.docs.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      () => RoomViewFromSearch(
                                        index: index,
                                        title: snapshotData.docs[index]
                                            ['title'],
                                        body: snapshotData.docs[index]['body'],
                                        imageUrl: snapshotData.docs[index]
                                            ['image'],
                                      ),
                                      duration:
                                          const Duration(milliseconds: 500),
                                      transition: Transition.rightToLeft,
                                    );
                                  },
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          snapshotData.docs[index]['image']),
                                    ),
                                    title: Text(
                                      snapshotData.docs[index]['title'],
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    subtitle: Text(
                                      snapshotData.docs[index]['body'],
                                      style: TextStyle(
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                );
                              })
                          : (controller.usersButton
                              ? ListView.builder(
                                  itemCount: snapshotData.docs.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Get.to(
                                          () => ProfilePage(
                                            displayName: snapshotData
                                                .docs[index]['displayName'],
                                            photoUrl: snapshotData.docs[index]
                                                ['photoUrl'],
                                            joined: snapshotData.docs[index]
                                            ['joined'].toString(),
                                          ),
                                          duration:
                                              const Duration(milliseconds: 500),
                                          transition: Transition.rightToLeft,
                                        );
                                      },
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              snapshotData.docs[index]
                                                  ['photoUrl']),
                                        ),
                                        title: Text(
                                          snapshotData.docs[index]
                                              ['displayName'],
                                          style: TextStyle(
                                            color: kPrimaryColor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                        subtitle: Text(
                                          snapshotData.docs[index]['email'],
                                          style: TextStyle(
                                            color: kPrimaryColor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12.0,
                                          ),
                                        ),
                                      ),
                                    );
                                  })
                              : ListView.builder(
                                  itemCount: snapshotData.docs.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Get.to(
                                          () => const ArticleDetailsView(),
                                          arguments: {
                                            'titleText': snapshotData
                                                .docs[index]['title'],
                                            'description': snapshotData
                                                .docs[index]['desc'],
                                            'likes': snapshotData.docs[index]
                                                ['likes'],
                                            'author': snapshotData.docs[index]
                                                ['author'],
                                          },
                                          duration:
                                              const Duration(milliseconds: 500),
                                          transition: Transition.rightToLeft,
                                        );
                                      },
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              snapshotData.docs[index]
                                                  ['photoUrl']),
                                        ),
                                        title: Text(
                                          snapshotData.docs[index]['title'],
                                          style: TextStyle(
                                            color: kPrimaryColor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                        subtitle: Text(
                                          snapshotData.docs[index]['desc'],
                                          style: TextStyle(
                                            color: kPrimaryColor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12.0,
                                          ),
                                        ),
                                      ),
                                    );
                                  })))),
            ),
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: kLightColor,
        floatingActionButton: GetBuilder<SearchController>(
          init: SearchController(),
          builder: (controller) => FloatingActionButton(
            backgroundColor: kPrimaryColor,
            child: Icon(
              Icons.clear,
              color: kLightColor,
            ),
            onPressed: () {
              controller.searchNotPressed();
              setState(() {
                searchController.clear();
              });
            },
          ),
        ),
        appBar: AppBar(
          backgroundColor: kLightColor.withOpacity(0.5),
          elevation: 0.6,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          actions: [
            GetBuilder<SearchController>(
                init: SearchController(),
                builder: (val) {
                  return IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      val.articlesButton
                          ? SearchController.instance
                              .articleData(searchController.text)
                              .then((value) {
                              snapshotData = value;
                              val.searchPressed();
                            })
                          : val.communitiesButton
                              ? SearchController.instance
                                  .communitiesData(searchController.text)
                                  .then((value) {
                                  snapshotData = value;
                                  val.searchPressed();
                                })
                              : val.roomsButton
                                  ? SearchController.instance
                                      .roomData(searchController.text)
                                      .then((value) {
                                      snapshotData = value;
                                      val.searchPressed();
                                    })
                                  : val.usersButton
                                      ? SearchController.instance
                                          .usersData(searchController.text)
                                          .then((value) {
                                          snapshotData = value;
                                          val.searchPressed();
                                        })
                                      : SearchController.instance
                                          .articleData(searchController.text)
                                          .then((value) {
                                          snapshotData = value;
                                          val.searchPressed();
                                        });
                    },
                  );
                }),
          ],
          title: TextField(
            controller: searchController,
            style: TextStyle(
              color: kPrimaryColor,
            ),
            decoration: InputDecoration(
              hintText: 'Search',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
        ),
        body: GetBuilder<SearchController>(
          init: SearchController(),
          builder: (controller) => controller.isExecuted
              ? searchedData()
              : Container(
                  child: Center(
                    child: Text(
                      'Search Any Thing',
                      style: TextStyle(color: kPrimaryColor, fontSize: 30.0),
                    ),
                  ),
                ),
        ));
  }
}
