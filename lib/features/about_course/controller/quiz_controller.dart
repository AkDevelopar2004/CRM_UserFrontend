import 'dart:async';

import 'package:get/get.dart';

class QuestionController extends GetxController {
  RxInt selectedOption = (-1).obs;
  RxInt questionIndex = 2.obs; // Example: Question 3 of 10
  RxInt timeRemaining = 10.obs;

  List<String> options = ["Option A", "Option B", "Option C", "Option D"];

  void selectOption(int index) {
    selectedOption.value = index;
  }

  void previousQuestion() {
    if (questionIndex > 0) {
      questionIndex--;
      selectedOption.value = -1;
      timeRemaining.value = 10;
    }
  }

  void nextQuestion() {
    if (questionIndex < 9) {
      questionIndex++;
      selectedOption.value = -1;
      timeRemaining.value = 10;
    }
  }

  @override
  void onInit() {
    super.onInit();
    startCountdown();
  }

  void startCountdown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeRemaining.value > 0) {
        timeRemaining.value--;
      } else {
        timer.cancel();
      }
    });
  }
}
