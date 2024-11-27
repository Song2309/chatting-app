import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lets_talk/Controller/button_controller.dart';
import 'package:lets_talk/widget/custom_text.dart';

class VideoGroupPage extends StatelessWidget {
  VideoGroupPage({Key? key}) : super(key: key);
  final ControlController controlController = Get.put(ControlController());

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    final kHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'HỘI NGƯỜI LOẠN NGÔN',
          fontSize: 17,
          color: Colors.black,
          fontWeight: FontWeight.w600,
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
        leading: Row(
          mainAxisSize: MainAxisSize.min, // Để kích thước khớp với nội dung
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon:
                  Icon(Icons.keyboard_arrow_down_outlined, color: Colors.black),
            ),
          ],
        ),
        actions: [
          Icon(Icons.group_add),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(kWidth * 0.05),
        child: Stack(
          children: [
            // Nền màu đen
            Container(
              color: Colors.white, // Đặt màu nền là màu đen
            ),
            // Hình ảnh ở trung tâm
            Column(
              children: [
                SizedBox(height: 150),
                // Hiển thị Avatar và Tên từ dữ liệu nhận được
                Container(
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    // Padding bên trong container
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, // 3 columns
                        crossAxisSpacing: 8.0, // Khoảng cách giữa các cột
                        mainAxisSpacing: 8.0, // Khoảng cách giữa các hàng
                        childAspectRatio:
                            1, // Đảm bảo tỷ lệ chiều rộng và chiều cao bằng nhau
                      ),
                      itemCount: 9, // 9 images in the grid
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            // Cạnh bo tròn cho từng item
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: Offset(0, 2), // Đổ bóng cho từng item
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            // Cạnh bo tròn cho ảnh
                            child: Image.network(
                              'https://s.net.vn/vdTM',
                              // Example public image URL
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 8),
                // Khoảng cách giữa ảnh và các chấm
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildDot(true), // Chấm sáng
                    _buildDot(false), // Chấm bình thường
                    _buildDot(false), // Chấm bình thường
                  ],
                ),
                SizedBox(height: 40),
                // Khoảng cách giữa container và phần tiếp theo
                _buildContact(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContact() {
    return Container(
      padding: EdgeInsets.all(5.0),
      margin: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(36.0),
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

  Widget _buildDot(bool isActive) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      // Khoảng cách giữa các chấm
      width: 8.0,
      height: 8.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive
            ? Colors.black
            : Colors.grey, // Chấm sáng màu hơn nếu isActive là true
      ),
    );
  }
}
