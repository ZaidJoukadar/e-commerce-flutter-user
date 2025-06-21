import 'package:e_commerce/Core/Constant/imageAssets.dart';
import 'package:e_commerce/Core/class/States_request.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatesRequest statesRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statesRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statesRequest == StatesRequest.loading
        ? Center(
            child:
                Lottie.asset(ImageAsset.loading_logo, height: 250, width: 250))
        : statesRequest == StatesRequest.offline
            ? Center(
                child: Lottie.asset(ImageAsset.offline_logo,
                    repeat: false, height: 250, width: 250))
            : statesRequest == StatesRequest.failure
                ? Center(
                    child: Lottie.asset(ImageAsset.no_data_logo,
                        height: 250, width: 250))
                : statesRequest == StatesRequest.serverfailure
                    ? Center(
                        child: Lottie.asset(ImageAsset.server_error_logo,
                            height: 250, width: 250))
                    : widget;
  }
}
