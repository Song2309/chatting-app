import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lets_talk/Controller/button_controller.dart';
import 'package:lets_talk/widget/custom_text.dart';

class CallGroupPage extends StatelessWidget {
  CallGroupPage({Key? key}) : super(key: key);
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
        backgroundColor: Colors.grey.shade50,
        leading: Row(
          mainAxisSize: MainAxisSize.min, // Để kích thước khớp với nội dung
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.keyboard_arrow_down_outlined, color: Colors.black),
            ),
          ],
        ),
        actions: [
          Icon(Icons.group_add),
        ],
      ),
      body:Stack(
          children: [
            // Nền màu đen
            Container(
              color: Colors.grey.shade50, // Đặt màu nền là màu đen
            ),
            // Hình ảnh ở trung tâm
            Column(
              children: [
                // Thanh tìm kiếm ở trên
                Padding(
                  padding: EdgeInsets.all(kWidth*0.05),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Bạn muốn thêm ai vào cuộc hội thoại', // Văn bản gợi ý
                      hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 14,
                      ),
                      prefixIcon: Icon(Icons.search), // Biểu tượng tìm kiếm
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0), // Bo tròn viền
                        borderSide: BorderSide(color: Colors.grey), // Màu viền
                      ),
                    ),
                  ),
                ),

                // Hiển thị Avatar và Tên từ dữ liệu nhận được
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 46.0, horizontal: 14.0),
                    padding: EdgeInsets.all(kWidth*0.02),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage('https://ln.run/YilPT'),
                              radius: 30, // Kích thước avatar
                            ),
                            SizedBox(width:30), // Khoảng cách giữa avatar và tên người dùng
                            Expanded(
                              child: Text(
                                'User A', // Thay thế với tên người dùng thực tế
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                                overflow: TextOverflow.ellipsis, // Dừng khi văn bản tràn
                              ),
                            ),
                            Icon(Icons.phone, size: 20), // Icon điện thoại
                            SizedBox(width:20),
                          ],
                        ),
                        SizedBox(height:25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage('https://ln.run/YilPT'),
                              radius: 30, // Kích thước avatar
                            ),
                            SizedBox(width:30), // Khoảng cách giữa avatar và tên người dùng
                            Expanded(
                              child: Text(
                                'User A', // Thay thế với tên người dùng thực tế
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                                overflow: TextOverflow.ellipsis, // Dừng khi văn bản tràn
                              ),
                            ),
                            Icon(Icons.phone, size: 20), // Icon điện thoại
                            SizedBox(width:20),
                          ],
                        ),
                        SizedBox(height:25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage('https://ln.run/YilPT'),
                              radius: 30, // Kích thước avatar
                            ),
                            SizedBox(width:30), // Khoảng cách giữa avatar và tên người dùng
                            Expanded(
                              child: Text(
                                'User A', // Thay thế với tên người dùng thực tế
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                                overflow: TextOverflow.ellipsis, // Dừng khi văn bản tràn
                              ),
                            ),
                            Icon(Icons.phone, size: 20), // Icon điện thoại
                            SizedBox(width:20),
                          ],
                        ),
                        SizedBox(height:25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage('https://ln.run/YilPT'),
                              radius: 30, // Kích thước avatar
                            ),
                            SizedBox(width:30), // Khoảng cách giữa avatar và tên người dùng
                            Expanded(
                              child: Text(
                                'User A', // Thay thế với tên người dùng thực tế
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                                overflow: TextOverflow.ellipsis, // Dừng khi văn bản tràn
                              ),
                            ),
                            Icon(Icons.phone, size: 20), // Icon điện thoại
                            SizedBox(width:20),
                          ],
                        ),
                        SizedBox(height:25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage('https://ln.run/YilPT'),
                              radius: 30, // Kích thước avatar
                            ),
                            SizedBox(width:30), // Khoảng cách giữa avatar và tên người dùng
                            Expanded(
                              child: Text(
                                'User A', // Thay thế với tên người dùng thực tế
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                                overflow: TextOverflow.ellipsis, // Dừng khi văn bản tràn
                              ),
                            ),
                            Icon(Icons.phone, size: 20), // Icon điện thoại
                            SizedBox(width:20),
                          ],
                        ),
                        SizedBox(height:25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage('https://ln.run/YilPT'),
                              radius: 30, // Kích thước avatar
                            ),
                            SizedBox(width:30), // Khoảng cách giữa avatar và tên người dùng
                            Expanded(
                              child: Text(
                                'User A', // Thay thế với tên người dùng thực tế
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                                overflow: TextOverflow.ellipsis, // Dừng khi văn bản tràn
                              ),
                            ),
                            Icon(Icons.phone, size: 20), // Icon điện thoại
                            SizedBox(width:20),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                _buildContact(),
              ],
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
}
