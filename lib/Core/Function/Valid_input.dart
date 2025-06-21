import 'package:get/get.dart';

valid_input(String value, int max, int min, String type) {
  //////////////////////// valid email
  if (type == 'email') {
    if (!GetUtils.isEmail(value)) {
      return 'not email';
    }
  }
  //////////////////////// valid phone
  if (type == 'phone') {
    if (!GetUtils.isPhoneNumber(value)) {
      return 'not phone';
    }
  }
  //////////////////////// valid username
  if (type == 'username') {
    if (!GetUtils.isUsername(value)) {
      return 'not username';
    }
  }
  ///////////////// larger than
  if (value.length > max) {
    return 'this feild is\'t $type need to be larger than $max';
  }
  ///////////////// less than
  if (value.length < min) {
    return 'this feild is\'t $type need to be less than $min';
  }
  ///////////////// null value
  if (value == '') {
    return 'can\'t be empty';
  }
}
