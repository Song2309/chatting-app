import 'package:get/get.dart';

class ControlController extends GetxController {
  // Trạng thái của video, mic và camera
  var isVideoOn = false.obs;
  var isMicOn = true.obs;
  var isCameraOn = true.obs;

  // Toggle các trạng thái
  void toggleVideo() {
    isVideoOn.value = !isVideoOn.value;
  }

  void toggleMic() {
    isMicOn.value = !isMicOn.value;
  }

  void toggleCamera() {
    isCameraOn.value = !isCameraOn.value;
  }
}
