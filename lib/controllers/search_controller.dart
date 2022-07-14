import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  static SearchController instance = SearchController();

  Future getData(String collection) async {
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    QuerySnapshot snapshot =
        await firebaseFirestore.collection(collection).get();
    return snapshot.docs;
  }

  Future articleData(String queryString) async {
    return FirebaseFirestore.instance
        .collection('articles')
        .where('title', isGreaterThanOrEqualTo: queryString)
        .get();
  }

  Future usersData(String queryString) async {
    return FirebaseFirestore.instance
        .collection('userData')
        .where('displayName', isGreaterThanOrEqualTo: queryString)
        .get();
  }

  Future communitiesData(String queryString) async {
    return FirebaseFirestore.instance
        .collection('communities')
        .where('titleText', isGreaterThanOrEqualTo: queryString)
        .get();
  }

  Future roomData(String queryString) async {
    return FirebaseFirestore.instance
        .collection('staticRooms')
        .where('title', isGreaterThanOrEqualTo: queryString)
        .get();
  }


  bool isExecuted = false;
  void searchPressed(){
    isExecuted = true;
    update();
  }

  void searchNotPressed(){
    isExecuted = false;
    update();
  }
  // change states for text Buttons
  bool articlesButton = true;
  bool communitiesButton = false;
  bool usersButton = false;
  bool roomsButton = false;

  void changeArticlesStates() {
    articlesButton = true;
    communitiesButton = false;
    usersButton = false;
    roomsButton = false;

    isExecuted = true;
    update();
  }

  void changeCommunitiesStates() {
    communitiesButton = true;
    articlesButton = false;
    usersButton = false;
    roomsButton = false;

    isExecuted = true;
    update();
  }

  void changeUsersStates() {
    usersButton = true;
    communitiesButton = false;
    articlesButton = false;
    roomsButton = false;

    isExecuted = true;
    update();
  }

  void changeRoomsStates() {
    roomsButton = true;
    usersButton = false;
    communitiesButton = false;
    articlesButton = false;

    isExecuted = true;
    update();
  }


}
