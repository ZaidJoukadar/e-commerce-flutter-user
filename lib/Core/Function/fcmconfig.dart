import 'package:e_commerce/Controller/Order/Order_pending_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

fcmconfig() {
  FirebaseMessaging.onMessage.listen((remotemessage) {
    Get.snackbar(
        remotemessage.notification!.title!, remotemessage.notification!.body!);
    refreshpagenotification(remotemessage.data);
  });
}

refreshpagenotification(data) {
  print('///////////////////////////////////////');
  print(data['pageid']);
  print('///////////////////////////////////////');
  print(data['pagename']);
  print('///////////////////////////////////////');
  print(Get.currentRoute);
  if (Get.currentRoute == '/order_pending' && data['pagename'] == "myorder") {
    OrderPendingController controller = Get.find();
    print('llllllllllllllllllllllllll');
    controller.refreshpage();
  }
}

requestPermissionNotification() async {
  await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true);
}
