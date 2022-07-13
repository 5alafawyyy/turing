import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/core/utils/styles.dart';
import '../../controllers/search_controller.dart';
import '../articles/screens/article_details/article_details_view.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController searchController = TextEditingController();
  late QuerySnapshot snapshotData;
  bool isExecuted = false;

  @override
  Widget build(BuildContext context) {
    Widget searchedData() {
      return ListView.builder(
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
                  backgroundImage:
                      NetworkImage(snapshotData.docs[index]['photoUrl']),
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
          });
    }

    return Scaffold(
        backgroundColor: kLightColor,
        floatingActionButton: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          child: Icon(
            Icons.clear,
            color: kLightColor,
          ),
          onPressed: () {
            setState(() {
              isExecuted = false;
              searchController.clear();
            });
          },
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
                      SearchController.instance
                          .articleData(searchController.text)
                          .then((value) {
                        snapshotData = value;
                        setState(() {
                          isExecuted = true;
                        });
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
        body: isExecuted
            ? searchedData()
            : Container(
                child: Center(
                  child: Text(
                    'Search Articles',
                    style: TextStyle(color: kPrimaryColor, fontSize: 30.0),
                  ),
                ),
              ));
  }
}
