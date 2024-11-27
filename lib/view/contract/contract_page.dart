import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/bottom_controller.dart';
import '../../Controller/tab_controller.dart';
import 'package:lets_talk/widget/custom_text.dart';

class ContractPage extends StatelessWidget {
  ContractPage({Key? key}) : super(key: key);

  final TabControler tabController = Get.put(TabControler());
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    final kHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: _buildSearchField(),
        backgroundColor: Color(0xFFFFFFFF),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(kWidth*0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: kWidth*0.05),
                  _buildTab('Liên hệ', 0),
                  SizedBox(width: kWidth*0.3),
                  _buildTab('Nhóm', 1),

                ],
              ),
              SizedBox(height: 10),
              Obx(() => tabController.selectedTabIndex.value == 0
                  ? _buildPersonTabContent()
                  : _buildGroupTabContent()),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
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

  Widget _buildSearchField() {
    return SizedBox(
      height: 40, // Đặt chiều cao của thanh tìm kiếm
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: "Tìm kiếm",
          hintStyle: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
            fontFamily: 'My Font',
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 8.0), // Điều chỉnh padding
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          prefixIcon: const Icon(Icons.search),
          filled: true, // Đảm bảo rằng TextField có nền
          fillColor: Colors.grey.shade200, // Màu nền
        ),
        onChanged: (query) {
          // Trigger UI update
          tabController.selectedTabIndex.refresh();
        },
      ),
    );
  }


  Widget buildCard(String title, String description, String imageUrl, bool isMessage) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (tabController.selectedTabIndex.value == 0) {
              Get.toNamed('/chat_person'); // Điều hướng đến '/chat_person'
            } else {
              Get.toNamed('/chat_group'); // Điều hướng đến '/chat_group'
            }
          },
          child: Container(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Container(
                  width: 60, // Đặt chiều rộng
                  height: 60, // Đặt chiều cao
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14), // Bo góc hình chữ nhật
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover, // Lọc ảnh cho phù hợp với kích thước container
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.videocam, color: Color(0xFF4A35E8)),
                      onPressed: () {
                        if(tabController.selectedTabIndex.value == 0)
                        Get.toNamed('/video_person');
                        else
                        Get.toNamed('/video_group');
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.phone, color: Color(0xFF4A35E8)),
                      onPressed: () {
                        if(tabController.selectedTabIndex.value == 0)
                        Get.toNamed('/call_person');
                        else
                        Get.toNamed('/call_group');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Divider(thickness: 1, color: Colors.grey),
      ],
    );
  }

  Widget _buildPersonTabContent() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildCard(
              "Nhị Lang Thần",
              "Supporting line text lorem ipsum dolor sit amet, consectetur.",
              "https://ln.run/KFitk",
              true,
            ),
            buildCard(
              "Nhị Lang Thần",
              "Supporting line text lorem ipsum dolor sit amet, consectetur.",
              "https://ln.run/KFitk",
              true,
            ),
            buildCard(
              "Nhị Lang Thần",
              "Supporting line text lorem ipsum dolor sit amet, consectetur.",
              "https://ln.run/KFitk",
              true,
            ),
            buildCard(
              "Nhị Lang Thần",
              "Supporting line text lorem ipsum dolor sit amet, consectetur.",
              "https://ln.run/KFitk",
              true,
            ),
            buildCard(
              "Nhị Lang Thần",
              "Supporting line text lorem ipsum dolor sit amet, consectetur.",
              "https://ln.run/KFitk",
              false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGroupTabContent() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildCard(
              "HỘI NGƯỜI LOẠN NGÔN",
              "Supporting line text lorem ipsum dolor sit amet, consectetur.",
              "https://ln.run/WUWDV",
              true,
            ),
            buildCard(
              "Hội bạn cấp 3",
              "Supporting line text lorem ipsum dolor sit amet, consectetur.",
              "https://ln.run/cE-Av",
              true,
            ),
            buildCard(
              "Hội bạn đại học",
              "Supporting line text lorem ipsum dolor sit amet, consectetur.",
              "https://ln.run/cGzkS",
              true,
            ),
            buildCard(
              "Group công việc",
              "Supporting line text lorem ipsum dolor sit amet, consectetur.",
              "https://ln.run/lcjtr",
              true,
            ),
            buildCard(
              "Group báo cáo cuối ngày",
              "Supporting line text lorem ipsum dolor sit amet, consectetur.",
              "https://ln.run/BNCAw",
              true,
            ),
            buildCard(
              "Group hỗ trợ kỹ thuật",
              "Supporting line text lorem ipsum dolor sit amet, consectetur.",
              "https://ln.run/BNCAw",
              true,
            ),
            buildCard(
              "Group tư vấn phát triển",
              "Supporting line text lorem ipsum dolor sit amet, consectetur.",
              "https://ln.run/BNCAw",
              true,
            ),
            buildCard(
              "Group đồng nghiệp",
              "Supporting line text lorem ipsum dolor sit amet, consectetur.",
              "https://ln.run/BNCAw",
              true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    final BottomNavController controller = Get.put(BottomNavController());

    return GetBuilder<BottomNavController>(
      builder: (controller) {
        return BottomNavigationBar(
          selectedLabelStyle: TextStyle(
            fontSize: 10,
            color: Color(0xFF4A35E8), // Màu của label khi mục được chọn
            fontWeight: FontWeight.w500,
            fontFamily: 'My Font',
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 10,
            color: Colors.grey, // Màu của label khi mục được chọn
            fontWeight: FontWeight.w500,
            fontFamily: 'My Font',
          ),
          backgroundColor: Colors.white,
          currentIndex: controller.currentIndex.value, // Dùng value để cập nhật
          onTap: (index) {
            controller.changeIndex(index); // Cập nhật chỉ số mục đang chọn
            switch (index) {
              case 0:
                Get.offAndToNamed('/homepage'); // Điều hướng đến trang HomePage
                break;
              case 1:
                Get.offAndToNamed('/contract'); // Điều hướng đến trang ContractPage
                break;
              case 2:
                Get.offAndToNamed('/profile'); // Điều hướng đến trang ProfilePage
                break;
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Stack(
                children: [
                  Icon(Icons.message),
                  Positioned(
                    left: 0, // Đặt vòng tròn ở góc phải của icon
                    top: 0,
                    child: Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '5+',  // Số thông báo
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              label: 'Tin nhắn',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group,color: Colors.blue),
              label: 'Liên hệ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Cá nhân',
            ),
          ],
        );
      },
    );
  }

}
