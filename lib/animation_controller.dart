import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAnimationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;

  late Animation<double> heightAnimation;
  late Animation<double> widthAnimation;
  late Animation<Offset> slideAnimation;
  late Animation<double> fadeAnimation;


  @override
  void onInit() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    heightAnimation = Tween<double>(begin: 200, end: 400).animate(
        CurvedAnimation(
            parent: animationController, curve: Curves.easeInOutBack))
      ..addListener(() {
        update();
      });

    widthAnimation = Tween<double>(begin: 160, end: 250).animate(
        CurvedAnimation(
            parent: animationController, curve: Curves.easeInOutBack))
      ..addListener(() {
        update();
      });

    slideAnimation =
        Tween<Offset>(begin: const Offset(0.0, 10), end: Offset.zero).animate(
            CurvedAnimation(
                parent: animationController, curve: Curves.fastOutSlowIn))
          ..addListener(() {
            update();
          });
    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn))
      ..addListener(() {
        update();
      });

    super.onInit();
  }

  onTapAnimation() {
    if (animationController.status == AnimationStatus.completed) {
      animationController.reverse();
    } else if (animationController.status == AnimationStatus.dismissed) {
      animationController.forward();
    }
  }
}
