import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:turing/presentation/auth/forget_password/forget_view.dart';
import 'package:turing/presentation/auth/login/login_view.dart';
import 'package:turing/presentation/auth/register/register_view.dart';
import 'package:turing/presentation/onboarding/obboarding_view.dart';
import 'package:turing/presentation/splash/splash_view.dart';

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
        statusBarColor: Colors.black
      )
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive );

    return GetMaterialApp(
      //initialRoute: 'SplashView',
      getPages: [
        GetPage(name: SplashView.id, page: ()=> const SplashView()),
        GetPage(name: OnBoardingView.id, page: ()=> const OnBoardingView()),
        GetPage(name: RegisterView.id, page: ()=> const RegisterView()),
        GetPage(name: LoginView.id, page: ()=> const LoginView()),
        GetPage(name: ForgetView.id, page: ()=> const ForgetView()),
      ],

      title: 'Turing Application',
      debugShowCheckedModeBanner: false, // Remove Banner of Debug
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        // fontFamily: 'Georgia',

        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.poppinsTextTheme(),

      ),
      //home: SplashView(),
    );
  }
}

