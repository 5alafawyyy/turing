import 'package:get/get.dart';
import 'package:turing/controllers/control_view.dart';
import 'package:turing/controllers/navigation_controller.dart';
import 'package:turing/controllers/articles_controller.dart';

class Binding extends Bindings{
  
  @override
  void dependencies() {
    // Get.lazyPut(() => ControlView());
    Get.lazyPut(() => NavigationController());
  }
}