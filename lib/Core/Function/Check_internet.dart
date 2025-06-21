import 'dart:io';
//import 'package:internet_connection_checker/internet_connection_checker.dart';

check_internet() async {
  try {
    // if (await InternetConnectionChecker.instance.hasConnection == true) {
    //   return true;
    // }
    var result = await InternetAddress.lookup('www.google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print(
          'connect////////////////////////////////////////////////////////////////////////');
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
}
