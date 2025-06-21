import 'package:e_commerce/Core/Constant/imageAssets.dart';
import 'package:flutter/material.dart';

class CustomLogoAuth extends StatelessWidget {
  const CustomLogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        ImageAsset.logo,
        height: 150,
      ),
    );
  }
}
