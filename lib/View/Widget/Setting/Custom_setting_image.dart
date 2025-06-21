import 'package:flutter/widgets.dart';

class CustomSettingImage extends StatelessWidget {
  const CustomSettingImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/setting.gif',
      height: 250,
      width: 300,
    );
  }
}
