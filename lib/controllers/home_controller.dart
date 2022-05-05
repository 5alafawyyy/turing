import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/presentation/articles/articles_view.dart';
import 'package:turing/presentation/home/home_view.dart';
import 'package:turing/presentation/profile/profile_view.dart';
import 'package:turing/presentation/rooms/rooms_view.dart';

class HomeController extends GetxController{
  int _navigatorValue = 0;
  get navigatorValue => _navigatorValue;

  Widget _currentScreen = const HomeView();
  get currentScreen => _currentScreen;

  String _titleAppbar = 'Home';
  get titleAppbar => _titleAppbar;

  void changeSelectedValue(int selectedValue){
    _navigatorValue = selectedValue;
    switch(selectedValue) {
      case 0 :
        {
          _currentScreen = HomeView();
          _titleAppbar = 'Home';
          break;
        }
      case 1 :
        {
          _currentScreen = RoomsView();
          _titleAppbar = 'Rooms';
          break;
        }
      case 2 :
        {
          _currentScreen = ArticlesView();
          _titleAppbar = 'Articles';
          break;
        }
      // case 3 :
      //   {
      //     _currentScreen = ProfileView();
      //     _titleAppbar = 'Profile';
      //     break;
      //   }
    }
    update();
  }
}