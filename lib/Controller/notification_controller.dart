import 'package:get/get.dart';

class NotificationController extends GetxController {
  // Quản lý trạng thái thông báo bằng Rx variable
  var isNotificationEnabled = true.obs;

  // Toggle trạng thái thông báo
  void toggleNotification() {
    isNotificationEnabled.value = !isNotificationEnabled.value;
  }
}
