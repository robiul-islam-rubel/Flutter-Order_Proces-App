import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nb_utils/nb_utils.dart';

import '../controllers/splash_controller.dart';
import '../utils/images.dart';


class SplashScreen extends GetView<SplashController> {
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Obx(
          () => Scaffold(
        backgroundColor: context.scaffoldBackgroundColor,
        body: Center(
          child: Column(
            children: [
              AnimatedContainer(
                duration:
                Duration(milliseconds: controller.d.value ? 900 : 2500),
                curve: controller.d.value
                    ? Curves.fastLinearToSlowEaseIn
                    : Curves.elasticOut,
                height: controller.d.value
                    ? 0
                    : controller.a.value
                    ? h / 2.5
                    : 20,
                width: 20,
              ),
              AnimatedContainer(
                duration: Duration(seconds: controller.c.value ? 2 : 0),
                curve: Curves.fastLinearToSlowEaseIn,
                height: controller.d.value
                    ? h
                    : controller.c.value
                    ? 130
                    : 20,
                width: controller.d.value
                    ? w
                    : controller.c.value
                    ? 130
                    : 20,
                decoration: BoxDecoration(
                    color: controller.boxColor.value,
                    //shape: _c? BoxShape.rectangle : BoxShape.circle,
                    borderRadius: controller.d.value
                        ? BorderRadius.only()
                        : BorderRadius.circular(30)),
                child: controller.secondAnim.value
                    ? Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle),
                    child: AnimatedBuilder(
                      animation: controller.scaleAnimation!,
                      builder: (c, child) => Transform.scale(
                        scale: controller.scaleAnimation!.value,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.teal,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                    : Center(
                  child: controller.e.value
                      ? Image.asset(Images.splash,
                      height: 130, width: 130, fit: BoxFit.cover)
                      : SizedBox(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
