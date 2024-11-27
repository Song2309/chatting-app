import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lets_talk/widget/custom_text.dart';

class ChatGroupPage extends StatelessWidget {
  ChatGroupPage({Key? key}) : super(key: key);
  String avatar1 = 'https://ln.run/HVTtx';
  String avatar2 = 'https://ln.run/YSsSJ';

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    final kHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Hội người loạn ngôn',
          fontSize: 17,
          color: Color(0xFF4A35E8),
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
        leadingWidth: 15,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFF4A35E8)),
          onPressed: () {
            Get.back(); // Quay lại màn hình trước
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.phone, color: Color(0xFF4A35E8)),
            onPressed: () {
              Get.toNamed('/call_group');
            },
          ),
          IconButton(
            icon: Icon(Icons.videocam_rounded, color: Color(0xFF4A35E8)),
            onPressed: () {
              Get.toNamed('/video_group');
            },
          ),
          IconButton(
            icon: Icon(Icons.menu, color: Color(0xFF4A35E8)),
            onPressed: () {
              Get.toNamed('/setting_chat_group');
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0), // Độ cao của AppBar
          child: Container(
            child: Divider( // Đường gạch
              thickness: 1.0, // Độ dày của đường gạch
              color: Colors.grey, // Màu đường gạch
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(kWidth * 0.05),
        child: Column(
          children: [
            _buildTextMessage(kWidth), // Render tin nhắn
            _buildTextField(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextMessage(double kWidth) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(kWidth * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Dòng 1: Text căn trái và có CircleAvatar
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(avatar1), // Hình ảnh đại diện
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.all(10), // Padding bên trong
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // Màu nền cho tin nhắn
                      borderRadius: BorderRadius.circular(8),
                      // Bo góc cho khung
                      border: Border.all(
                          color: Colors.black), // Viền khung tin nhắn
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Tin nhắn
                        CustomText(
                          text: 'Ăn cơm thôi',
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 5),
                        // Thời gian (giờ:phút)
                        Align(
                          alignment: Alignment.bottomRight,
                          child: CustomText(
                            text: '15:29',
                            fontSize: 10,
                            color: Color(0xFF4A35E8),
                            fontWeight: FontWeight.w400,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              // Dòng 2: Text căn phải
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  // Padding bên trong
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // Màu nền cho tin nhắn
                    borderRadius: BorderRadius.circular(8),
                    // Bo góc cho khung
                    border:
                        Border.all(color: Colors.black), // Viền khung tin nhắn
                  ),
                  constraints: BoxConstraints(maxWidth: 70),
                  // Giới hạn chiều rộng khung
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Tin nhắn
                      CustomText(
                        text: 'ok',
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 5),
                      // Thời gian (giờ:phút)
                      Align(
                        alignment: Alignment.bottomRight,
                        child: CustomText(
                          text: '15:29',
                          fontSize: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 5),
              // Dòng 3: Hình ảnh căn phải và hiển thị thời gian dưới
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage:
                          NetworkImage(avatar2), // Hình ảnh đại diện
                    ),
                  ),
                  SizedBox(width: 8),
                  Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14), // Bo góc
                        child: Image.network(
                          'https://ln.run/wR_Nh', // URL ảnh
                          width: 130, // Chiều rộng ảnh
                          height: 180, // Chiều cao ảnh
                          fit: BoxFit
                              .cover, // Đảm bảo ảnh phù hợp với kích thước
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField() {
    final TextEditingController _controller = TextEditingController();
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white, // Màu nền đặt ở đây
          borderRadius: BorderRadius.circular(16), // Bo góc
          border: Border.all(
            color: Colors.grey, // Màu viền
            width: 1.0, // Độ dày viền
          ),
        ),
        child: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                // Xử lý khi nhấn
              },
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Color(0xFF4A35E8),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(Icons.add, color: Colors.white, size: 20),
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "Nhắn tin...",
                  hintStyle: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'My Font',
                    color: Color(0xFF3C3C43),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(width: 15),
            IconButton(
              onPressed: () {
                // Xử lý khi nhấn nút gửi
              },
              icon: Icon(Icons.send, color: Color(0xFF4A35E8), size: 28),
            ),
          ],
        ),
      ),
    );
  }
}
