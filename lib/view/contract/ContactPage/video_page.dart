import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lets_talk/Controller/button_controller.dart';
import 'package:lets_talk/widget/custom_text.dart';

class VideoPage extends StatelessWidget {
  VideoPage({Key? key}) : super(key: key);
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
          elevation: 0, // Xóa bỏ độ bóng của AppBar
          title: CustomText(
            text: 'Nhị Lang Thần',
            fontSize: 17,
            color: Colors.white,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.start,
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
      body:Stack(
            children: [
              // Fullscreen image
              Positioned(
                child: Image.network(
                  'https://ln.run/KFitk',
                  fit: BoxFit.cover, // Đảm bảo ảnh phủ đầy không gian
                  height: MediaQuery.of(context).size.height * 1, // Kéo dài ảnh chiếm 60% chiều cao màn hình
                ),
              ),
              Positioned(
                top: 100, // Tọa độ Y của ảnh mới
                right: 30, // Tọa độ X của ảnh mới
                child: Container(
                  width: 120, // Chiều rộng hình chữ nhật
                  height: 180, // Chiều cao hình chữ nhật
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // Bo tròn cạnh (tuỳ chọn)
                    image: DecorationImage(
                      image: NetworkImage('https://ln.run/IIi_m'), // Đường dẫn ảnh
                      fit: BoxFit.cover,
                    ),
                  ),
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
