import 'package:get/get.dart';

class AuthController extends GetxController{

  final Rx<String> _user = Rx<String>('this is for testing only until API found');
  get user => _user.value;



}