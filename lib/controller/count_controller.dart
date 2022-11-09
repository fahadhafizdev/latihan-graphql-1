import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CountController extends GetxController {
  RxInt count = 0.obs;

  //NOTE : function add counttt
  void add() {
    count++;
    if (count.value == 10) {
      Get.snackbar(
        'info',
        'your count must under 10',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.only(
          bottom: 20,
          left: 12,
          right: 12,
        ),
      );
    }
  }

  void min() => count--;
}
