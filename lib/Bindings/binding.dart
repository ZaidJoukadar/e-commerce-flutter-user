import 'package:e_commerce/Core/class/Crud.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
