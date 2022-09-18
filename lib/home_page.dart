import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'animation_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final MyAnimationController _animationController =
      Get.put(MyAnimationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<MyAnimationController>(
              builder: (controller) {
                return GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    controller.onTapAnimation();
                  },
                  child: Container(
                    height: controller.heightAnimation.value,
                    width: controller.widthAnimation.value,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: SlideTransition(
                        position: controller.slideAnimation,
                        child: FadeTransition(
                            opacity: controller.fadeAnimation,
                            child: const FlutterLogo(
                              size: 100,
                            )),
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
