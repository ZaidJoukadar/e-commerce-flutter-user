import 'package:e_commerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<MyServices> inis() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        name: 'ecommerce',
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }
    return this;
  }
}

initial_service() async {
  await Get.putAsync(() => MyServices().inis());
}
