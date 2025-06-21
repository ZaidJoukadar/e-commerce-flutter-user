import 'package:e_commerce/Controller/Notification_controller.dart';
import 'package:e_commerce/Controller/favorite_controller.dart';
import 'package:e_commerce/Core/Constant/Color.dart';
import 'package:flutter/material.dart';

class Searchbar extends StatelessWidget {
  final String hint_text;
  final Function(String)? onSearch;
  final Function(String)? onSubmitted;
  final void Function()? onPressed;
  final TextEditingController search_text_controller;
  const Searchbar({
    super.key,
    required this.hint_text,
    this.onSearch,
    this.onSubmitted,
    this.onPressed,
    required this.search_text_controller,
  });

  @override
  Widget build(BuildContext context) {
    FavoriteController controller = FavoriteController();
    NotificationController notificationController = NotificationController();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 70,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.circular(15)),
              child: TextFormField(
                controller: search_text_controller,
                onFieldSubmitted: onSubmitted,
                onChanged: onSearch,
                decoration: InputDecoration(
                    prefixIcon: IconButton(
                      onPressed: onPressed,
                      icon: Icon(Icons.search),
                      color: Appcolor.primary_color,
                      iconSize: 30,
                    ),
                    prefixIconColor: Appcolor.primary_color,
                    hintText: hint_text,
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
          ),
          SizedBox(
            width: 2,
          ),
          IconButton(
              icon: Icon(
                Icons.notifications_active_outlined,
                color: Appcolor.primary_color,
                size: 30,
              ),
              onPressed: () {
                notificationController.go_to_notification();
              }),
          SizedBox(
            width: 2,
          ),
          IconButton(
              icon: Icon(
                Icons.favorite_border_outlined,
                color: Appcolor.primary_color,
                size: 30,
              ),
              onPressed: () {
                controller.go_to_favorite();
              }),
        ],
      ),
    );
  }
}
