import 'package:get/get.dart';

class ProjectController extends GetxController {
  int selectedTab = 0;

  void changeTab(int index) {
    selectedTab = index;
    update();
  }
}
