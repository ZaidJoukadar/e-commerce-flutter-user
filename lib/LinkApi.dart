class Linkapi {
  static String server_link = "http://10.0.2.2/e-com";
  // static String server_link = "http://127.0.0.1:55596/e-com";
  static String test_link = "$server_link/test.php";
  //////////////////////Image///////////////////////////////
  static String image = 'http://10.0.2.2/e-com/Upload';
  static String image_categories = '$image/Categories';
  static String image_items = '$image/Items';
  ////////////////////////// Auth //////////////////////////
  static String signup_link = "$server_link/Auth/Signup.php";
  static String login_link = "$server_link/Auth/Login.php";
  static String verifiyCode_signup_link = "$server_link/Auth/verifiyCode.php";
  static String Resend_link = "$server_link/Auth/Resend.php";
  ////////////////////////// ForgetPassword //////////////////////////
  static String verifiyCodeResetPassword_link =
      "$server_link/ForgetPassword/VerifiyCode.php";
  static String check_email = "$server_link/ForgetPassword/CheckEmail.php";
  static String reset_password =
      "$server_link/ForgetPassword/ResetPassword.php";
  ////////////////////////////Home///////////////////////////
  static String home_link = "$server_link/Home.php";
  static String search_link = "$server_link/Search/search_item.php";
  ////////////////////////////Items///////////////////////////
  static String view_favorite_link = "$server_link/Items/view_favorite.php";
  static String add_to_favorite_link = "$server_link/Items/add_to_favorite.php";
  static String delete_from_favorite =
      "$server_link/Items/delete_from_favorite.php";
  static String view_item_link = "$server_link/Items/view_item.php";
  ////////////////////////////category///////////////////////////
  static String category = "$server_link/Categoreies/view.php";

  ////////////////////////////Cart///////////////////////////
  static String add_to_cart_link = "$server_link/Cart/Add.php";
  static String view_cart_link = "$server_link/Cart/View.php";
  static String delete_from_cart_link = "$server_link/Cart/delete.php";
  static String remove_from_cart_link = "$server_link/Cart/remove_product.php";
  static String get_items_count_cart_link =
      "$server_link/Cart/Get_count_items.php";

  //////////////////////////// Address ///////////////////////////
  static String add_address = "$server_link/Address/add.php";
  static String edit_address = "$server_link/Address/edit.php";
  static String delete_address = "$server_link/Address/delete.php";
  static String view_address = "$server_link/Address/view.php";

  //////////////////////////// Coupon ///////////////////////////
  static String check_coupon = "$server_link/Coupon/Check_coupon.php";

  //////////////////////////// order ///////////////////////////
  static String check_out = "$server_link/orders/checkout.php";
  static String pending = "$server_link/orders/pending.php";
  static String archive = "$server_link/orders/archive.php";
  static String details = "$server_link/orders/Details.php";
  static String delete = "$server_link/orders/Delete.php";
  static String rating = "$server_link/orders/rating.php";
  static String offers = "$server_link/offers.php";

  //////////////////////////// notification ///////////////////////////
  static String notification = "$server_link/Notification/view.php";
}
