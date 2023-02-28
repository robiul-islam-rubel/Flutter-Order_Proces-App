import 'dart:async';

import 'package:nb_utils/nb_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';


class SplashController extends GetxController with GetTickerProviderStateMixin {
  /* SplashScreen */
  AnimationController? scaleController;
  Animation<double>? scaleAnimation;

  var a = false.obs;
  var c = false.obs;
  var d = false.obs;
  var e = false.obs;
  var secondAnim = false.obs;

  var boxColor = Colors.transparent.obs;
  @override
  onInit() {
    super.onInit();

    Timer(Duration(milliseconds: 600), () {
      boxColor.value = Colors.teal;
      a(true);
    });
    Timer(Duration(milliseconds: 1500), () {
      boxColor.value = Colors.red;
      c(true);
    });
    Timer(Duration(milliseconds: 1700), () {
      e(true);
    });
    Timer(Duration(milliseconds: 3200), () {
      secondAnim(true);

      scaleController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 1000),
      )..forward();
      scaleAnimation =
          Tween<double>(begin: 0.0, end: 12).animate(scaleController!);

      boxColor.value = scaffoldLightColor;
      d(true);
    });
    Timer(Duration(milliseconds: 4200), () {
      secondAnim(true);
      bool isSynced = true;
      if (isSynced) {
        Get.offAndToNamed(AppPages.getHomeRoute());
      }
    });
  }

  @override
  void onClose() {
    /* animationController.dispose(); */
    super.onClose();
  }

/* _redirectToPage() async {
    animationController.stop();
    Get.offAllNamed(AppPages.getHomeRoute());
  } */
}
