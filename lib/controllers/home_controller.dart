import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/controllers/drawer_controller.dart';
import 'package:turing/presentation/articles/articles_view.dart';
import 'package:turing/presentation/home/home_view.dart';
import 'package:turing/presentation/rooms/screens/view/rooms_view.dart';

class HomeController extends GetxController{
  var drawerController =  Get.put(DrawerControllerView());

  var _lastActive = 3;
  int _navigatorValue = 0;


  Widget _currentScreen = const HomeView();
  get currentScreen => _currentScreen;

  String _titleAppbar = 'Home';
  get titleAppbar => _titleAppbar;

  void changeSelectedValue(int selectedValue){
    _navigatorValue = selectedValue;


    switch(selectedValue) {
      case 3 :
        {
          _currentScreen = const HomeView();
          _titleAppbar = 'Home';
          _lastActive = selectedValue;
          break;
        }
      case 2 :
        {
          _currentScreen = const RoomsView();
          _titleAppbar = 'Rooms';
          _lastActive = selectedValue;
          break;
        }
      case 1 :
        {
          _currentScreen = const ArticlesView();
          _titleAppbar = 'Articles';
          _lastActive = selectedValue;
          break;
        }
      case 0 :
        {
          drawerController.openDrawer();
          selectedValue = _lastActive;
          // _currentScreen = ProfileView();
          // _titleAppbar = 'Profile';
          break;
        }
    }
    update();
  }

  get navigatorValue => _lastActive;
}