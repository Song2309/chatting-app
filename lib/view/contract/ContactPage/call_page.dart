import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lets_talk/widget/custom_text.dart';
import 'package:lets_talk/Controller/button_controller.dart';

class CallPage extends StatelessWidget {
  CallPage({Key? key}) : super(key: key);
  final ControlController controlController = Get.put(ControlController());

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    final kHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight), // AppBar chiều cao chuẩn
        child: AppBar(
          backgroundColor: Colors.transparent, // Làm AppBar trong suốt
          title: CustomText(
            text: 'Nhị Lang Thần',
            fontSize: 17,
            color: Colors.white,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
          ),
          leading:
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Get.back(); // Quay lại trang trước
              },
            ),
        ),
      ),
      body: Stack(
          children: [
            // Fullscreen image
            Positioned(
              child: Image.network(
                'https://ln.run/KFitk',
                fit: BoxFit.cover, // Đảm bảo ảnh phủ đầy không gian
                height: MediaQuery.of(context).size.height * 1, // Kéo dài ảnh chiếm 60% chiều cao màn hình
              ),
            ),

            // _buildContact() sẽ được đặt lên trên ảnh
            Align(
              alignment: Alignment(0.0, 0.8),
              child: _buildContact(),
            ),

          ],
        ),
    );
  }
  Widget _buildContact() {
    return Container(
      padding: EdgeInsets.all(5.0),
      margin: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.4),
        borderRadius: BorderRadius.circular(34.0),
      ),
      child: IntrinsicWidth(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Video Button
            IconButton(
              icon: Obx(() => Icon(
                controlController.isVideoOn.value
                    ? Icons.videocam
                    : Icons.videocam_off,
                color: Colors.white,
                size: 40,
              )),
              onPressed: controlController.toggleVideo,
            ),
            // Mic Button
            IconButton(
              icon: Obx(() => Icon(
                controlController.isMicOn.value ? Icons.mic : Icons.mic_off,
                color: Colors.white,
                size: 40,
              )),
              onPressed: controlController.toggleMic,
            ),
            // Camera Button
            IconButton(
              icon: Obx(() => Icon(
                controlController.isCameraOn.value
                    ? Icons.switch_video_rounded
                    : Icons.switch_video_outlined,
                color: Colors.white,
                size: 40,
              )),
              onPressed: controlController.toggleCamera,
            ),
            // End Call Button
            IconButton(
              icon: Icon(
                Icons.call_end,
                color: Colors.red,
                size: 40,
              ),
              onPressed: () {
                Get.back(); // Quay lại trang trước
              },
            ),
          ],
        ),
      ),
    );
  }

}
