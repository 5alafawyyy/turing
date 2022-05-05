import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/controllers/drawer_controller.dart';
import 'package:turing/controllers/home_controller.dart';
import 'package:turing/core/constants/styles.dart';
import 'package:turing/core/widgets/custom_drawer.dart';

class ControlView extends GetView<DrawerControllerView> {
  ControlView({Key? key}) : super(key: key);
  static String id = '/controlView';

  var drawerController =  Get.put(DrawerControllerView());
  @override
  Widget build(BuildContext context){
    return GetBuilder<HomeController>(
        builder: (controller) {
          return Scaffold(
            backgroundColor: whiteColor,
            appBar: customAppBar(context, GestureDetector(
              onTap: (){
               drawerController.openDrawer();
              },
              child: Tab(
                icon: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/ahmedkhallaf.jpeg',
                  ),
                ),
              ),
            ),),
            key: drawerController.scaffoldKey,
            drawer: CustomDrawer(),
            body: controller.currentScreen,
            bottomNavigationBar: bottomNavigationBar(),
          );
        }
    );


    //   Obx((){
    //   return (Get.find<AuthController>().user != null)
    //       ? const LoginView()
    //       :
    //   GetBuilder<HomeController>(
    //       builder: (controller) {
    //         return Scaffold(
    //
    //           body: controller.currentScreen,
    //           bottomNavigationBar: bottomNavigationBar(),
    //         );
    //       }
    //       );
    // },
    // );
  }

  Widget bottomNavigationBar() {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder:(controller) => BottomNavigationBar(
        backgroundColor: whiteColor,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: itemColor,
        unselectedItemColor: kSecondColor,
        type: BottomNavigationBarType.fixed,
        elevation: 10,


        items:
        const [
          BottomNavigationBarItem(
            activeIcon: Text(
              'Home',
              style: TextStyle(
                height: 2.7,
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                color: itemColor,
              ),
            ),
            label: '',
            icon: Icon(
              Icons.home_outlined,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Text(
              'Rooms',
              style: TextStyle(
                height: 2.7,
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                color: itemColor,
              ),
            ),
            label: '',
            icon: Icon(
              Icons.workspaces_outline,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Text(
              'Articles',
              style: TextStyle(
                height: 2.7,
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                color: itemColor,
              ),
            ),
            label: '',
            icon: Icon(
              Icons.article_outlined,
            ),
          ),
          // BottomNavigationBarItem(
          //   activeIcon: Text(
          //     'Profile',
          //     style: TextStyle(
          //       height: 2.7,
          //       fontWeight: FontWeight.bold,
          //       fontSize: 15.0,
          //       color: itemColor,
          //     ),
          //   ),
          //   label: '',
          //   icon: Icon(
          //     Icons.person_outline,
          //   ),
          // ),
        ],
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeSelectedValue(index);

        },
      ),
    );
  }

}

class CustomSearchDelegate extends SearchDelegate{
  List<String> searchTerms = [ // From database
    'Maths',
    'Engineering',
    'Physics'
  ];

  @override
  ThemeData appBarTheme(BuildContext context){
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.brightness == Brightness.dark ? kSecondColor : kMainColor,
        iconTheme: theme.primaryIconTheme.copyWith(color: kSecondColor),
      ),
      inputDecorationTheme: searchFieldDecorationTheme ??
          InputDecorationTheme(
            hintStyle: searchFieldStyle ?? theme.inputDecorationTheme.hintStyle,
            border: InputBorder.none,
          ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: (){
          query = '';
        },
        icon: const Icon(
          Icons.clear,
          color: kSecondColor,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: (){
        close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back_ios,
        color: kSecondColor,
      ),
    );
  }


  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms){
      if (fruit.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index){
        var result = matchQuery[index];
        return ListTile(
          title: Text(
            result,
            style: const TextStyle(
              color: kSecondColor,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms){
      if (fruit.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index){
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );

  }



}

customAppBar( context, leading) {
  return AppBar(
    backgroundColor: whiteColor,
    foregroundColor: kSecondColor,
    shadowColor: kMainColor,
    elevation: 0.5,
    leading: leading,
    // IconButton(
    //   onPressed: (){
    //
    //   },
    //   icon: const Icon(Icons.account_circle),
    // )

    title:  GetBuilder<HomeController>(
      builder: (controller) => Text(
        controller.titleAppbar,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    centerTitle: true,
    actions:
    [
      IconButton(
        onPressed: (){
          showSearch(
            context: context,
            delegate: CustomSearchDelegate(),
          );
        },
        icon: const Icon(Icons.search),
      ),
    ],
  );
}
