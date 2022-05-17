import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:turing/controllers/control_view.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/data/helper/binding.dart';
import 'package:turing/presentation/articles/articles_view.dart';
import 'package:turing/presentation/articles/screens/article_details/article_details_view.dart';
import 'package:turing/presentation/articles/screens/new_article/create_new_article_view.dart';
import 'package:turing/presentation/auth/forget_password/forget_view.dart';
import 'package:turing/presentation/auth/login/login_view.dart';
import 'package:turing/presentation/auth/register/register_view.dart';
import 'package:turing/presentation/communities/screens/communities_view/communities_view.dart';
import 'package:turing/presentation/communities/screens/community_details/community_details_view.dart';
import 'package:turing/presentation/home/home_view.dart';
import 'package:turing/presentation/onboarding/obboarding_view.dart';
import 'package:turing/presentation/profile/profile_view.dart';
import 'package:turing/presentation/rooms/rooms_view.dart';
import 'package:turing/presentation/setting/setting_view.dart';
import 'package:turing/presentation/splash/splash_view.dart';

import 'presentation/communities/screens/create_community/create_new_community_view.dart';

void main() {
  //WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: kPrimaryColor
      )
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive );
    return GetMaterialApp(
      //initialRoute: 'SplashView',
      initialBinding: Binding(),
      getPages: [
        GetPage(name: SplashView.id, page: ()=>  SplashView()),
        GetPage(name: OnBoardingView.id, page: ()=>  OnBoardingView()),
        GetPage(name: RegisterView.id, page: ()=>  RegisterView()),
        GetPage(name: LoginView.id, page: ()=>  LoginView()),
        GetPage(name: ForgetView.id, page: ()=>  ForgetView()),
        GetPage(name: ControlView.id, page: ()=>  ControlView(), binding: Binding()),
        GetPage(name: HomeView.id, page: ()=>  HomeView()),
        GetPage(name: RoomsView.id, page: ()=>  RoomsView()),
        GetPage(name: ArticlesView.id, page: ()=>  ArticlesView()),
        GetPage(name: ProfileView.id, page: ()=>  ProfileView()),
        GetPage(name: SettingView.id, page: ()=>  SettingView()),
        GetPage(name: CommunitiesView.id, page: ()=>  CommunitiesView()),
        GetPage(name: CommunityPageDetailsView.id, page: ()=> CommunityPageDetailsView()),
        GetPage(name: CreateCommunityView.id, page: ()=>   CreateCommunityView()),
        GetPage(name: ArticleDetailsView.id, page: ()=>   ArticleDetailsView()),
        GetPage(name: CreateNewArticleView.id, page: ()=>    CreateNewArticleView()),

      ],

      title: 'Turing Application',
      debugShowCheckedModeBanner: false, // Remove Banner of Debug
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: kPrimaryColor,
        fontFamily: 'Poppins',
        backgroundColor: kBackgroundColor,

        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: const AppBarTheme(
          backgroundColor: kBackgroundColor,
          toolbarTextStyle: TextStyle(
            fontFamily: 'Poppins'
          ),
          iconTheme: IconThemeData(
            color: kPrimaryColor,
          ),
          foregroundColor: kPrimaryColor,
        ),
      ),
      //home: SplashView(),
    );
  }
}

