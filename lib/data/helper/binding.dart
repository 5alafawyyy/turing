import 'package:get/get.dart';
import 'package:turing/controllers/auth_controller.dart';
import 'package:turing/controllers/control_view.dart';
import 'package:turing/controllers/home_controller.dart';

class Binding extends Bindings{
  
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => ControlView());
    Get.lazyPut(() => HomeController());
  }
}