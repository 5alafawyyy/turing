import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/controllers/authController.dart';
import 'package:turing/controllers/drawer_controller.dart';
import 'package:turing/controllers/navigation_controller.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/presentation/drawer/drawer.dart';
import 'package:turing/presentation/profile/screens/view/profile_view.dart';
import 'package:turing/presentation/search/search.dart';

class ControlView extends GetView<DrawerControllerView> {
  ControlView({Key? key}) : super(key: key);
  static String id = '/controlView';

  final drawerController = Get.put(DrawerControllerView());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(builder: (controller) {
      return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: customAppBar(
          context,
          GestureDetector(
            onTap: () {
              Get.to(
                () => const ProfileView(),
                transition: Transition.rightToLeftWithFade,
                duration: const Duration(milliseconds: 250),
              );
            },
            child: Tab(
              icon: FutureBuilder(
                  future: AuthController.instance.getUserData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator(
                        color: kPrimaryColor,
                        strokeWidth: 2.0,
                      );
                    }
                    if (snapshot.hasData) {
                      return CircleAvatar(
                        backgroundImage: NetworkImage(
                          "${AuthController.instance.currentData.photoUrl}",
                        ),
                        foregroundColor: kLightColor,
                        backgroundColor: kLightColor,
                      );
                    } else {
                      return CircleAvatar(
                        backgroundImage: const AssetImage(
                          "assets/images/no-user.png",
                        ),
                        foregroundColor: kLightColor,
                        backgroundColor: kLightColor,
                      );
                    }
                  }),
            ),
          ),
        ),
        key: drawerController.scaffoldKey,
        drawer: const MyDrawer(),
        body: controller.currentScreen,
        bottomNavigationBar: bottomNavigationBar(),
      );
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<NavigationController>(
      init: NavigationController(),
      builder: (controller) => BottomNavigationBar(
        backgroundColor: kBackgroundColor,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: itemColor,
        unselectedItemColor: kPrimaryColor,
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        items: const [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.menu,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Text(
              'Articles',
              style: TextStyle(
                height: 2.7,
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                color: kPrimaryColor,
              ),
            ),
            label: '',
            icon: Icon(
              Icons.article_outlined,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Text(
              'Rooms',
              style: TextStyle(
                height: 2.7,
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                color: kPrimaryColor,
              ),
            ),
            label: '',
            icon: Icon(
              Icons.workspaces_outline,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Text(
              'Home',
              style: TextStyle(
                height: 2.7,
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                color: kPrimaryColor,
              ),
            ),
            label: '',
            icon: Icon(
              Icons.home_outlined,
            ),
          ),
        ],
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeSelectedValue(index);
        },
      ),
    );
  }
}

// class CustomSearchDelegate extends SearchDelegate{
//   List<String> searchTerms = [ // From database
//     'Communities',
//     'Users',
//     'Rooms'
//   ];
//
//   @override
//   ThemeData appBarTheme(BuildContext context){
//     final ThemeData theme = Theme.of(context);
//     final ColorScheme colorScheme = theme.colorScheme;
//     return theme.copyWith(
//       appBarTheme: AppBarTheme(
//         backgroundColor: colorScheme.brightness == Brightness.dark ? kPrimaryColor : kForegroundColor,
//         iconTheme: theme.primaryIconTheme.copyWith(color: kLightColor),
//       ),
//       inputDecorationTheme: searchFieldDecorationTheme ??
//           InputDecorationTheme(
//             hintStyle: searchFieldStyle ?? theme.inputDecorationTheme.hintStyle,
//             border: InputBorder.none,
//           ),
//     );
//   }
//
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         onPressed: (){
//           query = '';
//         },
//         icon: const Icon(
//           Icons.clear,
//           color: kPrimaryColor,
//         ),
//       ),
//     ];
//   }
//
//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       onPressed: (){
//         close(context, null);
//       },
//       icon: const Icon(
//         Icons.arrow_back_ios,
//         color: kPrimaryColor,
//       ),
//     );
//   }
//
//
//   @override
//   Widget buildResults(BuildContext context) {
//     List<String> matchQuery = [];
//     for (var fruit in searchTerms){
//       if (fruit.toLowerCase().contains(query.toLowerCase())){
//         matchQuery.add(fruit);
//       }
//     }
//     return ListView.builder(
//       itemCount: matchQuery.length,
//       itemBuilder: (context, index){
//         var result = matchQuery[index];
//         return ListTile(
//           title: Text(
//             result,
//             style: const TextStyle(
//               color: kPrimaryColor,
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> matchQuery = [];
//     for (var fruit in searchTerms){
//       if (fruit.toLowerCase().contains(query.toLowerCase())){
//         matchQuery.add(fruit);
//       }
//     }
//     return ListView.builder(
//       itemCount: matchQuery.length,
//       itemBuilder: (context, index){
//         var result = matchQuery[index];
//         return ListTile(
//           title: Text(result),
//         );
//       },
//     );
//
//   }
// }
//
customAppBar(context, leading) {
  return AppBar(
    backgroundColor: kBackgroundColor,
    foregroundColor: kPrimaryColor,
    shadowColor: kBackgroundColor,
    elevation: 0,
    leading: leading,

    title: GetBuilder<NavigationController>(
      builder: (controller) => Text(
        controller.titleAppbar,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    centerTitle: true,
    actions: [
      IconButton(
        onPressed: (){
          Get.to(() => Search());
        },
        icon: const Icon(Icons.search),
      ),
    ],
  );
}
