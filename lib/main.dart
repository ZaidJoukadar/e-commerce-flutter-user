import 'package:e_commerce/Bindings/binding.dart';
import 'package:e_commerce/Core/Services/services.dart';
import 'package:e_commerce/Core/localization/changelocal.dart';
import 'package:e_commerce/Core/localization/translation.dart';
import 'package:e_commerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initial_service();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Local_Controller local_controller = Get.put(Local_Controller());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: local_controller.language,
      translations: MyTranslation(),
      theme: local_controller.apptheme,
      initialBinding: Binding(),
      getPages: routes,
    );
  }
}
