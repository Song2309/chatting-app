import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var currentIndex = 0.obs; // Duy trì currentIndex

  // Hàm thay đổi index khi nhấn vào icon
  void changeIndex(int index) {
    currentIndex.value = index;
  }
}

