import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lets_talk/Controller/notification_controller.dart';
import 'package:lets_talk/Controller/tab_controller.dart';
import 'package:lets_talk/widget/custom_text.dart';

class SettingGroupChat extends StatelessWidget {
  SettingGroupChat({Key? key}) : super(key: key);
  final NotificationController notificationController =
      Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Tùy chọn',
          fontSize: 17,
          color: Color(0xFF4A35E8),
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.start,
        ),
        backgroundColor: Colors.white,
        leadingWidth: 15,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFF4A35E8)),
          onPressed: () {
            Get.back(); // Go back to previous screen
          },
        ),
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
        child: SingleChildScrollView(
          // Wrapping with SingleChildScrollView
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAvatar(),
              _buildRowContent(),
              SizedBox(height: 30),
              _buildGroupInfo(),
              _buildImageRow(kWidth),
              _buildFileRow(kWidth),
              _buildLinkRow(kWidth),
              _buildOut(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOut() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.logout_outlined),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Rời khỏi nhóm',
                  style: TextStyle(
                    fontFamily: 'My Font',
                    fontSize: 14,
                    color: Colors.red,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.restore_from_trash),
              TextButton(
                onPressed: () {
                  // Handle deleting group logic here
                },
                child: Text(
                  'Xóa nhóm chat',
                  style: TextStyle(
                    fontFamily: 'My Font',
                    fontSize: 14,
                    color: Colors.red,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGroupInfo() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start, // Đảm bảo căn lề trên
        children: [
          Text(
            'Thành viên nhóm',
            style: TextStyle(
              fontFamily: 'My Font',
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
          GestureDetector(
              onTap: () {
                Get.toNamed('/manage_person'); // Navigate to ManagePerson screen
              },
              child: Row(
                children: [
                  Icon(Icons.groups_outlined), // Hiển thị icon
                  SizedBox(width: 8), // Khoảng cách giữa icon và text
                  Text(
                    '10 thành viên', // Số thành viên, thay bằng số thực tế
                    style: TextStyle(
                      fontFamily: 'My Font',
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.left, // Căn trái văn bản
                  ),
                ],
              )),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildImageRow(double kWidth) {
    return Padding(
      padding: EdgeInsets.all(kWidth * 0.01), // Padding around the content
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // Align the text to the left
        children: [
          // Text header
          CustomText(
            text: 'Hình ảnh',
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 10), // Add some spacing between the text and images
          // Row to display images
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // Space out the images
            children: [
              // Image 1
              Image.network(
                'https://ln.run/Hp-o1',
                width: 88,
                height: 100,
                fit: BoxFit.cover, // Ensure images fit within the box
              ),
              // Image 2
              Image.network(
                'https://ln.run/2d1X3',
                width: 88,
                height: 100,
                fit: BoxFit.cover,
              ),
              // Image 3
              Image.network(
                'https://ln.run/3vr4Z',
                width: 88,
                height: 100,
                fit: BoxFit.cover,
              ),
              // Image 4
              Image.network(
                'https://ln.run/nLRu7',
                width: 88,
                height: 100,
                fit: BoxFit.cover,
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            width: kWidth,
            height: 40,
            child: TextButton(
              onPressed: () {
                Get.to(() => AllImagePage());
              },
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFF4A35E8),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                // Padding của button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(36),
                ),
              ),
              child: CustomText(
                text: 'Hiển thị thêm',
                fontSize: 10,
                color: Colors.white,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.start,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFileRow(double kWidth) {
    return Padding(
      padding: EdgeInsets.all(kWidth * 0.01), // Padding around the content
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align to the left
        children: [
          CustomText(
            text: 'Tệp, thư mục',
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 10), // Add space between text and button
          Padding(
            padding: const EdgeInsets.all(8.0), // Thêm padding cho toàn bộ Row
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // Căn chỉnh các phần tử ở bên trái
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      image: DecorationImage(
                        image: NetworkImage('https://ln.run/Pl0yV'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'whatup.apk',
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        CustomText(
                          text: '10GB',
                          fontSize: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(width: kWidth * 0.45),
                        CustomText(
                          text: '10-01-1970',
                          fontSize: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: kWidth,
            height: 40,
            child: TextButton(
              onPressed: () {
                Get.to(() => AllFilePage());
              },
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFF4A35E8),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                // Padding của button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(36),
                ),
              ),
              child: CustomText(
                text: 'Hiển thị thêm',
                fontSize: 10,
                color: Colors.white,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.start,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLinkRow(double kWidth) {
    return Padding(
      padding: EdgeInsets.all(kWidth * 0.01), // Padding around the content
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align to the left
        children: [
          CustomText(
            text: 'Đường link',
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 10), // Add space between text and button
          Padding(
            padding: const EdgeInsets.all(8.0), // Thêm padding cho toàn bộ Row
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // Căn chỉnh các phần tử ở bên trái
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      image: DecorationImage(
                        image: NetworkImage('https://ln.run/Pl0yV'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Kho tài liệu học tập thi cấp 3',
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        CustomText(
                          text: 'http://localhost:8555/haiten.com.vn',
                          fontSize: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(width: kWidth * 0.1),
                        CustomText(
                          text: '10-01-1970',
                          fontSize: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: kWidth,
            height: 40,
            child: TextButton(
              onPressed: () {
                Get.to(() => AllLinkPage());
              },
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFF4A35E8),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                // Padding của button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(36),
                ),
              ),
              child: CustomText(
                text: 'Hiển thị thêm',
                fontSize: 10,
                color: Colors.white,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.start,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                'https://ln.run/qwQ5g'), // Access item through widget
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: 'Hội người loạn ngôn',
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.start,
              ),
              Icon(Icons.edit),
            ],
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildRowContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            CustomText(
              text: 'Tìm kiếm',
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.start,
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                Icons.person_add_outlined, // Biểu tượng mặc định là profile
              ),
              onPressed: () {
                Get.to(AddMember());
              },
            ),
            CustomText(
              text: 'Thêm thành viên',
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.start,
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.push_pin_outlined), // Pin icon
              onPressed: () {
                // Action for pin
              },
            ),
            CustomText(
              text: 'Ghim',
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.start,
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Sử dụng Obx để lắng nghe thay đổi và cập nhật giao diện
            Obx(() {
              return IconButton(
                icon: Icon(
                  notificationController.isNotificationEnabled.value
                      ? Icons.notifications_none
                      : Icons.notifications_off,
                  color: notificationController.isNotificationEnabled.value
                      ? null
                      : Color(0xFF4A35E8),
                ),
                // Toggle icon
                onPressed: notificationController
                    .toggleNotification, // Toggle the notification state
              );
            }),
            Obx(() {
              return CustomText(
                text: notificationController.isNotificationEnabled.value
                    ? 'Tắt thông báo'
                    : 'Bật thông báo',
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.start,
              );
            }),
          ],
        ),
      ],
    );
  }
}

class AllImagePage extends StatelessWidget {
  AllImagePage({Key? key}) : super(key: key);
  final TabControler tabController = Get.put(TabControler());

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Hình ảnh',
          fontSize: 17,
          color: Color(0xFF4A35E8),
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.start,
        ),
        leadingWidth: 15,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFF4A35E8)),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
              icon: Container(
                padding: EdgeInsets.all(2), // Khoảng cách bên trong vòng tròn
                decoration: BoxDecoration(
                  color: Color(0xFF4A35E8), // Màu nền vòng tròn
                  shape: BoxShape.circle, // Đảm bảo hình tròn
                ),
                child: Icon(
                  Icons.more_horiz,
                  color: Colors
                      .white, // Màu của icon (màu trắng để tương phản với nền màu)
                ),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Center(
                      child: AlertDialog(
                        contentPadding: EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: CustomText(
                                text: tabController.selectedTabIndex.value == 0
                                    ? 'Chọn hình ảnh'
                                    : 'Chọn video',
                                fontSize: 14,
                                color: Colors.blue,
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Divider(),
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: CustomText(
                                text: 'Hủy',
                                fontSize: 14,
                                color: Colors.blue,
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(kWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: kWidth * 0.1),
                  _buildTab('Hình ảnh', 0),
                  SizedBox(width: kWidth * 0.25),
                  _buildTab('Video', 1),
                ],
              ),
              SizedBox(height: 10),
              Obx(() => tabController.selectedTabIndex.value == 0
                  ? _buildImageTabContent()
                  : _buildVideoTabContent()),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String label, int index) {
    return GestureDetector(
      onTap: () {
        tabController.updateSelectedTabIndex(index);
      },
      child: Obx(() => Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: tabController.selectedTabIndex.value == index
                      ? Colors.blue
                      : Colors.transparent,
                  width: 2.0,
                ),
              ),
            ),
            child: CustomText(
              text: label,
              fontSize: 20,
              color: tabController.selectedTabIndex.value == index
                  ? Colors.black
                  : Colors.grey,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.start,
            ),
          )),
    );
  }

  Widget _buildImageTabContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 60),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: CustomText(
                  text: 'Hôm nay',
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // Space out the images
                children: [
                  // Image 1
                  Image.network(
                    'https://ln.run/3vr4Z',
                    width: 86, // Set image width
                    height: 100, // Set image height
                    fit: BoxFit.cover, // Ensure images fit within the box
                  ),
                  // Image 2
                  Image.network(
                    'https://ln.run/3vr4Z',
                    width: 86, // Set image width
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  // Image 3
                  Image.network(
                    'https://ln.run/3vr4Z',
                    width: 86, // Set image width
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  // Image 4
                  Image.network(
                    'https://ln.run/3vr4Z',
                    width: 86, // Set image width
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 60),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: CustomText(
                  text: 'Hôm qua',
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // Space out the images
                children: [
                  // Image 1
                  Image.network(
                    'https://ln.run/3vr4Z',
                    width: 86, // Set image width
                    height: 100, // Set image height
                    fit: BoxFit.cover, // Ensure images fit within the box
                  ),
                  // Image 2
                  Image.network(
                    'https://ln.run/3vr4Z',
                    width: 86, // Set image width
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  // Image 3
                  Image.network(
                    'https://ln.run/3vr4Z',
                    width: 86, // Set image width
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  // Image 4
                  Image.network(
                    'https://ln.run/3vr4Z',
                    width: 86, // Set image width
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: CustomText(
                  text: '24 tháng 9, 2024',
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // Space out the images
                children: [
                  // Image 1
                  Image.network(
                    'https://ln.run/3vr4Z',
                    width: 86, // Set image width
                    height: 100, // Set image height
                    fit: BoxFit.cover, // Ensure images fit within the box
                  ),
                  // Image 2
                  Image.network(
                    'https://ln.run/3vr4Z',
                    width: 86, // Set image width
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  // Image 3
                  Image.network(
                    'https://ln.run/3vr4Z',
                    width: 86, // Set image width
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  // Image 4
                  Image.network(
                    'https://ln.run/3vr4Z',
                    width: 86, // Set image width
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildVideoTabContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 60),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: CustomText(
                  text: 'Hôm nay',
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // Space out the images
                children: [
                  // Image 1
                  Image.network(
                    'https://ln.run/3vr4Z',
                    width: 86, // Set image width
                    height: 100, // Set image height
                    fit: BoxFit.cover, // Ensure images fit within the box
                  ),
                  // Image 2
                  Image.network(
                    'https://ln.run/3vr4Z',
                    width: 86, // Set image width
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  // Image 3
                  Image.network(
                    'https://ln.run/3vr4Z',
                    width: 86, // Set image width
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  // Image 4
                  Image.network(
                    'https://ln.run/3vr4Z',
                    width: 86, // Set image width
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 60),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: CustomText(
                  text: 'Hôm qua',
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // Space out the images
                children: [
                  // Image 1
                  Image.network(
                    'https://ln.run/3vr4Z',
                    width: 86, // Set image width
                    height: 100, // Set image height
                    fit: BoxFit.cover, // Ensure images fit within the box
                  ),
                  // Image 2
                  Image.network(
                    'https://ln.run/3vr4Z',
                    width: 86, // Set image width
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  // Image 3
                  Image.network(
                    'https://ln.run/3vr4Z',
                    width: 86, // Set image width
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  // Image 4
                  Image.network(
                    'https://ln.run/3vr4Z',
                    width: 86, // Set image width
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: CustomText(
                  text: '24 tháng 9, 2024',
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // Space out the images
                children: [
                  // Image 1
                  Image.network(
                    'https://ln.run/3vr4Z',
                    width: 86, // Set image width
                    height: 100, // Set image height
                    fit: BoxFit.cover, // Ensure images fit within the box
                  ),
                  // Image 2
                  Image.network(
                    'https://ln.run/3vr4Z',
                    width: 86, // Set image width
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  // Image 3
                  Image.network(
                    'https://ln.run/3vr4Z',
                    width: 86, // Set image width
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  // Image 4
                  Image.network(
                    'https://ln.run/3vr4Z',
                    width: 86, // Set image width
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AllFilePage extends StatelessWidget {
  AllFilePage({Key? key}) : super(key: key);
  final TabControler tabController = Get.put(TabControler());

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Tệp, thư mục',
          fontSize: 17,
          color: Color(0xFF4A35E8),
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.start,
        ),
        leadingWidth: 15,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFF4A35E8)),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Container(
              padding: EdgeInsets.all(2), // Khoảng cách bên trong vòng tròn
              decoration: BoxDecoration(
                color: Color(0xFF4A35E8), // Màu nền vòng tròn
                shape: BoxShape.circle, // Đảm bảo hình tròn
              ),
              child: Icon(
                Icons.more_horiz,
                color: Colors
                    .white, // Màu của icon (màu trắng để tương phản với nền màu)
              ),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Center(
                    child: AlertDialog(
                      contentPadding: EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              tabController.selectedTabIndex.value == 0
                                  ? 'Chọn tệp tin' // Image selection for Image tab
                                  : 'Chọn thư mục',
                              // Video selection for Video tab
                              style: TextStyle(
                                  fontFamily: 'My Font',
                                  fontSize: 17,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Divider(),
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text(
                              'Hủy',
                              style: TextStyle(
                                  fontFamily: 'My Font',
                                  fontSize: 17,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(kWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: kWidth * 0.1),
                  _buildTab('Tệp', 0),
                  SizedBox(width: kWidth * 0.25),
                  _buildTab('Thư mục', 1),
                ],
              ),
              Obx(() => tabController.selectedTabIndex.value == 0
                  ? _buildFileTabContent()
                  : _buildFolderTabContent()),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String label, int index) {
    return GestureDetector(
      onTap: () {
        tabController.updateSelectedTabIndex(index);
      },
      child: Obx(() => Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: tabController.selectedTabIndex.value == index
                      ? Colors.blue
                      : Colors.transparent,
                  width: 2.0,
                ),
              ),
            ),
            child: CustomText(
              text: label,
              fontSize: 20,
              color: tabController.selectedTabIndex.value == index
                  ? Colors.black
                  : Colors.grey,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.start,
            ),
          )),
    );
  }

  Widget _buildFileTabContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30, bottom: 60),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: CustomText(
                  text: 'Hôm nay',
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.download, color: Color(0xFF4A35E8), size: 42),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Kế hoạch xây dựng dự án',
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                        ),
                        CustomText(
                          text: 'Dung lượng: 36.6 MB',
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                        ),
                        CustomText(
                          text: 'Thể loại: tệp tin',
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                        ),
                        CustomText(
                          text: 'Người gửi: Gia Cát Lượng',
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 100),
                      child: IconButton(
                        icon: Icon(Icons.more_horiz,
                            color: Color(0xFF4A35E8), size: 30),
                        onPressed: () {
                          showDialog(
                            context: Get.context!,
                            builder: (BuildContext context) {
                              return Center(
                                child: AlertDialog(
                                  contentPadding: EdgeInsets.all(16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Chia sẻ',
                                          style: TextStyle(
                                              fontFamily: 'My Font',
                                              fontSize: 17,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      Divider(),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Lưu file',
                                          style: TextStyle(
                                              fontFamily: 'My Font',
                                              fontSize: 17,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      Divider(),
                                      TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text(
                                          'Hủy',
                                          style: TextStyle(
                                              fontFamily: 'My Font',
                                              fontSize: 17,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 60),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: CustomText(
                  text: 'Hôm qua',
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.download, color: Color(0xFF4A35E8), size: 42),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Kế hoạch xây dựng dự án',
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                        ),
                        CustomText(
                          text: 'Dung lượng: 36.6 MB',
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                        ),
                        CustomText(
                          text: 'Thể loại: tệp tin',
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                        ),
                        CustomText(
                          text: 'Người gửi: Gia Cát Lượng',
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 100),
                      child: IconButton(
                        icon: Icon(Icons.more_horiz,
                            color: Color(0xFF4A35E8), size: 30),
                        onPressed: () {
                          showDialog(
                            context: Get.context!,
                            builder: (BuildContext context) {
                              return Center(
                                child: AlertDialog(
                                  contentPadding: EdgeInsets.all(16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Chia sẻ',
                                          style: TextStyle(
                                              fontFamily: 'My Font',
                                              fontSize: 17,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      Divider(),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Lưu file',
                                          style: TextStyle(
                                              fontFamily: 'My Font',
                                              fontSize: 17,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      Divider(),
                                      TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text(
                                          'Hủy',
                                          style: TextStyle(
                                              fontFamily: 'My Font',
                                              fontSize: 17,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 40),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: CustomText(
                  text: '24 tháng 9, 2024',
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.download, color: Color(0xFF4A35E8), size: 42),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Kế hoạch xây dựng dự án',
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                        ),
                        CustomText(
                          text: 'Dung lượng: 36.6 MB',
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                        ),
                        CustomText(
                          text: 'Thể loại: tệp tin',
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                        ),
                        CustomText(
                          text: 'Người gửi: Gia Cát Lượng',
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 100),
                      child: IconButton(
                        icon: Icon(Icons.more_horiz,
                            color: Color(0xFF4A35E8), size: 30),
                        onPressed: () {
                          showDialog(
                            context: Get.context!,
                            builder: (BuildContext context) {
                              return Center(
                                child: AlertDialog(
                                  contentPadding: EdgeInsets.all(16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Chia sẻ',
                                          style: TextStyle(
                                              fontFamily: 'My Font',
                                              fontSize: 17,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      Divider(),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Lưu file',
                                          style: TextStyle(
                                              fontFamily: 'My Font',
                                              fontSize: 17,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      Divider(),
                                      TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text(
                                          'Hủy',
                                          style: TextStyle(
                                              fontFamily: 'My Font',
                                              fontSize: 17,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFolderTabContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30, bottom: 60),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: CustomText(
                  text: 'Hôm nay',
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.folder, color: Color(0xFF4A35E8), size: 42),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Kế hoạch xây dựng dự án',
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                        ),
                        CustomText(
                          text: 'Dung lượng: 36.6 MB',
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                        ),
                        CustomText(
                          text: 'Thể loại: tệp tin',
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                        ),
                        CustomText(
                          text: 'Người gửi: Gia Cát Lượng',
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 100),
                      child: IconButton(
                        icon: Icon(Icons.more_horiz,
                            color: Color(0xFF4A35E8), size: 30),
                        onPressed: () {
                          showDialog(
                            context: Get.context!,
                            builder: (BuildContext context) {
                              return Center(
                                child: AlertDialog(
                                  contentPadding: EdgeInsets.all(16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Chia sẻ',
                                          style: TextStyle(
                                              fontFamily: 'My Font',
                                              fontSize: 17,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      Divider(),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Lưu file',
                                          style: TextStyle(
                                              fontFamily: 'My Font',
                                              fontSize: 17,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      Divider(),
                                      TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text(
                                          'Hủy',
                                          style: TextStyle(
                                              fontFamily: 'My Font',
                                              fontSize: 17,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 60),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: CustomText(
                  text: 'Hôm qua',
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.folder, color: Color(0xFF4A35E8), size: 42),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Kế hoạch xây dựng dự án',
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                        ),
                        CustomText(
                          text: 'Dung lượng: 36.6 MB',
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                        ),
                        CustomText(
                          text: 'Thể loại: tệp tin',
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                        ),
                        CustomText(
                          text: 'Người gửi: Gia Cát Lượng',
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 100),
                      child: IconButton(
                        icon: Icon(Icons.more_horiz,
                            color: Color(0xFF4A35E8), size: 30),
                        onPressed: () {
                          showDialog(
                            context: Get.context!,
                            builder: (BuildContext context) {
                              return Center(
                                child: AlertDialog(
                                  contentPadding: EdgeInsets.all(16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Chia sẻ',
                                          style: TextStyle(
                                              fontFamily: 'My Font',
                                              fontSize: 17,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      Divider(),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Lưu file',
                                          style: TextStyle(
                                              fontFamily: 'My Font',
                                              fontSize: 17,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      Divider(),
                                      TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text(
                                          'Hủy',
                                          style: TextStyle(
                                              fontFamily: 'My Font',
                                              fontSize: 17,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 40),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: CustomText(
                  text: '24 tháng 9, 2024',
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.folder, color: Color(0xFF4A35E8), size: 42),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Kế hoạch xây dựng dự án',
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                        ),
                        CustomText(
                          text: 'Dung lượng: 36.6 MB',
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                        ),
                        CustomText(
                          text: 'Thể loại: tệp tin',
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                        ),
                        CustomText(
                          text: 'Người gửi: Gia Cát Lượng',
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 100),
                      child: IconButton(
                        icon: Icon(Icons.more_horiz,
                            color: Color(0xFF4A35E8), size: 30),
                        onPressed: () {
                          showDialog(
                            context: Get.context!,
                            builder: (BuildContext context) {
                              return Center(
                                child: AlertDialog(
                                  contentPadding: EdgeInsets.all(16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Chia sẻ',
                                          style: TextStyle(
                                              fontFamily: 'My Font',
                                              fontSize: 17,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      Divider(),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Lưu file',
                                          style: TextStyle(
                                              fontFamily: 'My Font',
                                              fontSize: 17,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      Divider(),
                                      TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text(
                                          'Hủy',
                                          style: TextStyle(
                                              fontFamily: 'My Font',
                                              fontSize: 17,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AllLinkPage extends StatelessWidget {
  AllLinkPage({Key? key}) : super(key: key);
  final TabControler tabController = Get.put(TabControler());

  String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) return text;
    return text.substring(0, maxLength) + '...';
  }

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Đường link',
          fontSize: 17,
          color: Color(0xFF4A35E8),
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.start,
        ),
        backgroundColor: Colors.white,
        leadingWidth: 15,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFF4A35E8)),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: Container(
              padding: EdgeInsets.all(2), // Khoảng cách bên trong vòng tròn
              decoration: BoxDecoration(
                color: Color(0xFF4A35E8), // Màu nền vòng tròn
                shape: BoxShape.circle, // Đảm bảo hình tròn
              ),
              child: Icon(
                Icons.more_horiz,
                color: Colors
                    .white, // Màu của icon (màu trắng để tương phản với nền màu)
              ),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Center(
                    child: AlertDialog(
                      contentPadding: EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Chọn liên kết',
                              style: TextStyle(
                                  fontFamily: 'My Font',
                                  fontSize: 17,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Divider(),
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text(
                              'Hủy',
                              style: TextStyle(
                                  fontFamily: 'My Font',
                                  fontSize: 17,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(kWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Hôm nay',
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.start,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.link, color: Color(0xFF4A35E8), size: 30),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'DOCS.GOOGLE.COM',
                              fontSize: 14,
                              color: Color(0xFF4A35E8),
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              truncateText(
                                'https://docs.google.com/document/kehoachxaydungduan',
                                37, // Số ký tự muốn hiển thị trước khi cắt
                              ),
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontFamily: 'My Font',
                                  fontWeight: FontWeight.w400),
                            ),
                            CustomText(
                              text: 'Người gửi: Gia Cát Lượng',
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                        SizedBox(width: 1),
                        IconButton(
                          icon: Icon(Icons.more_horiz,
                              color: Color(0xFF4A35E8), size: 30),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Center(
                                  child: AlertDialog(
                                    contentPadding: EdgeInsets.all(16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Chia sẻ',
                                            style: TextStyle(
                                                fontFamily: 'My Font',
                                                fontSize: 17,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        Divider(),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Truy cập',
                                            style: TextStyle(
                                                fontFamily: 'My Font',
                                                fontSize: 17,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        Divider(),
                                        TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text(
                                            'Hủy',
                                            style: TextStyle(
                                                fontFamily: 'My Font',
                                                fontSize: 17,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Hôm qua',
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.start,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.link, color: Color(0xFF4A35E8), size: 30),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'DOCS.GOOGLE.COM',
                              fontSize: 14,
                              color: Color(0xFF4A35E8),
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              truncateText(
                                'https://docs.google.com/document/kehoachxaydungduan',
                                37, // Số ký tự muốn hiển thị trước khi cắt
                              ),
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontFamily: 'My Font',
                                  fontWeight: FontWeight.w400),
                            ),
                            CustomText(
                              text: 'Người gửi: Gia Cát Lượng',
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                        SizedBox(width: 1),
                        IconButton(
                          icon: Icon(Icons.more_horiz,
                              color: Color(0xFF4A35E8), size: 30),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Center(
                                  child: AlertDialog(
                                    contentPadding: EdgeInsets.all(16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Chia sẻ',
                                            style: TextStyle(
                                                fontFamily: 'My Font',
                                                fontSize: 17,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        Divider(),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Truy cập',
                                            style: TextStyle(
                                                fontFamily: 'My Font',
                                                fontSize: 17,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        Divider(),
                                        TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text(
                                            'Hủy',
                                            style: TextStyle(
                                                fontFamily: 'My Font',
                                                fontSize: 17,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: '24 tháng 9, 2024',
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.start,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.link, color: Color(0xFF4A35E8), size: 30),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'DOCS.GOOGLE.COM',
                              fontSize: 14,
                              color: Color(0xFF4A35E8),
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              truncateText(
                                'https://docs.google.com/document/kehoachxaydungduan',
                                37, // Số ký tự muốn hiển thị trước khi cắt
                              ),
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontFamily: 'My Font',
                                  fontWeight: FontWeight.w400),
                            ),
                            CustomText(
                              text: 'Người gửi: Gia Cát Lượng',
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                        SizedBox(width: 1),
                        IconButton(
                          icon: Icon(Icons.more_horiz,
                              color: Color(0xFF4A35E8), size: 30),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Center(
                                  child: AlertDialog(
                                    contentPadding: EdgeInsets.all(16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Chia sẻ',
                                            style: TextStyle(
                                                fontFamily: 'My Font',
                                                fontSize: 17,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        Divider(),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Truy cập',
                                            style: TextStyle(
                                                fontFamily: 'My Font',
                                                fontSize: 17,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        Divider(),
                                        TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text(
                                            'Hủy',
                                            style: TextStyle(
                                                fontFamily: 'My Font',
                                                fontSize: 17,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddMember extends StatelessWidget {
  AddMember({Key? key}) : super(key: key);

  final TextEditingController searchController = TextEditingController();

  final List<Map<String, String>> randomPeople = [
    {"name": "An Nguyễn", "imageUrl": "https://ln.run/K9Vwl"},
    {"name": "Anh Trần", "imageUrl": "https://ln.run/K9Vwl"},
    {"name": "Ánh Hồng", "imageUrl": "https://ln.run/K9Vwl"},
    {"name": "Anh Thư", "imageUrl": "https://ln.run/K9Vwl"},
  ];

  final List<Map<String, String>> selectedPeople = [];

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Thêm thành viên',
          style: TextStyle(
            fontSize: 17,
            color: Color(0xFF4A35E8),
            fontWeight: FontWeight.w400,
          ),
        ),
        leadingWidth: 15,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF4A35E8),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(kWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 45,
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  prefixIcon: const Icon(Icons.search, color: Colors.blue),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            Divider(color: Colors.grey, thickness: 0.5),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: randomPeople.length,
                itemBuilder: (context, index) {
                  final person = randomPeople[index];
                  return ListTile(
                    leading: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xFF65558F),
                          width: 2,
                        ),
                        color: selectedPeople.contains(person)
                            ? Color(0xFF65558F)
                            : Colors.white,
                      ),
                      child: selectedPeople.contains(person)
                          ? Icon(Icons.check, size: 16, color: Colors.white)
                          : null,
                    ),
                    title: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(person["imageUrl"]!),
                          radius: 20,
                        ),
                        SizedBox(width: 10),
                        Text(
                          person["name"]!,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  // Xử lý tạo nhóm
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  foregroundColor: Colors.white,
                  minimumSize: Size(50, 50),
                ),
                child: Icon(Icons.add, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

