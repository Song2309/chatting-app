import 'package:get/get.dart';

class TabControler extends GetxController {
  var selectedIndex = 0.obs;
  var selectedTabIndex = 0.obs;

  void updateSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  void updateSelectedTabIndex(int index) {
    selectedTabIndex.value = index;
  }
}
