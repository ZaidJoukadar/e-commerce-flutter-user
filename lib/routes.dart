import 'package:e_commerce/Core/Constant/Routes.dart';
import 'package:e_commerce/Core/middleware/Middleware.dart';
import 'package:e_commerce/View/Screen/About_us.dart';
import 'package:e_commerce/View/Screen/Address/Add_Address.dart';
import 'package:e_commerce/View/Screen/Address/Address.dart';
import 'package:e_commerce/View/Screen/Address/Edit_Address.dart';
import 'package:e_commerce/View/Screen/Auth/ForgetPassword/verfiyCodeSignup.dart';
import 'package:e_commerce/View/Screen/Auth/Login.dart';
import 'package:e_commerce/View/Screen/Auth/ForgetPassword/ResetPassword.dart';
import 'package:e_commerce/View/Screen/Auth/SignUp.dart';
import 'package:e_commerce/View/Screen/Auth/ForgetPassword/Sucsses_reset_password.dart';
import 'package:e_commerce/View/Screen/Auth/Sucsses_signup.dart';
import 'package:e_commerce/View/Screen/Auth/ForgetPassword/VerfiyCodeToResetpassword.dart';
import 'package:e_commerce/View/Screen/Auth/ForgetPassword/forgetpassword.dart';
import 'package:e_commerce/View/Screen/Cart.dart';
import 'package:e_commerce/View/Screen/Checkout.dart';
import 'package:e_commerce/View/Screen/Favorite.dart';
import 'package:e_commerce/View/Screen/Home.dart';
import 'package:e_commerce/View/Screen/HomeScreen.dart';
import 'package:e_commerce/View/Screen/Items/Items.dart';
import 'package:e_commerce/View/Screen/Items/ItemsDetails.dart';
import 'package:e_commerce/View/Screen/Notification.dart';
import 'package:e_commerce/View/Screen/Onboarding.dart';
import 'package:e_commerce/View/Screen/Order/Archive.dart';
import 'package:e_commerce/View/Screen/Order/Order_details.dart';
import 'package:e_commerce/View/Screen/Order/Pending.dart';
import 'package:e_commerce/View/Screen/Order/Tracking.dart';
import 'package:e_commerce/View/Screen/language.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  ///////////////// test /////////////////
  // GetPage(name: '/', page: () => Login()),

  ////////////////////////////// Auth  //////////////////////////////
  GetPage(name: '/', page: () => Language(), middlewares: [Middleware()]),
  GetPage(name: Routes.Login, page: () => Login()),
  GetPage(name: Routes.Signup, page: () => Signup()),
  GetPage(name: Routes.ForgetPassword, page: () => ForgetPassword()),
  GetPage(
      name: Routes.verfiy_codeToResetpassword,
      page: () => VerfiyCodeToResetPassword()),
  GetPage(
      name: Routes.sucsses_reset_password, page: () => SucssesResetPassword()),
  GetPage(name: Routes.verfiy_code_signup, page: () => Verfiycodesignup()),
  GetPage(name: Routes.sucsses_signup, page: () => SucssesSignup()),
  GetPage(name: Routes.ResetPassword, page: () => ResetPassword()),
  ///////////////////////// Onboardeing //////////////////////////
  GetPage(name: Routes.onboarding, page: () => Onboarding()),
  /////////////////////////// home //////////////////////////
  GetPage(name: Routes.home, page: () => Home()),
  GetPage(name: Routes.homescreen, page: () => HomeScreen()),
  GetPage(name: Routes.items, page: () => Items()),
  GetPage(name: Routes.itemsdetails, page: () => Itemsdetails()),
  GetPage(name: Routes.favorite, page: () => Favorite()),
  GetPage(name: Routes.cart, page: () => Cart()),
  GetPage(name: Routes.aboutus, page: () => AboutUs()),
  /////////////////////////// address //////////////////////////
  GetPage(name: Routes.address, page: () => Address()),
  GetPage(name: Routes.addaddress, page: () => AddAddress()),
  GetPage(name: Routes.editaddress, page: () => EditAddress()),
  /////////////////////////// checkout //////////////////////////
  GetPage(name: Routes.checkout, page: () => Checkout()),
  GetPage(name: Routes.order_pending, page: () => OrderPending()),
  GetPage(name: Routes.order_archive, page: () => OrderArchive()),
  GetPage(name: Routes.order_details, page: () => OrderDetails()),
  GetPage(name: Routes.order_tracking, page: () => Tracking()),
  /////////////////////////// notitfication //////////////////////////
  GetPage(name: Routes.notification, page: () => Notification()),
];
