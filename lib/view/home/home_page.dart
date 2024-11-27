import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/bottom_controller.dart';
import '../../Controller/tab_controller.dart';
import 'package:lets_talk/widget/custom_text.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final TabControler tabController = Get.put(TabControler());
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    final kHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Đoạn chat",
          fontSize: 22,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color(0xFFFFFFFF),
        actions: [
          Obx(() => GestureDetector(
                onTap: tabController.selectedTabIndex.value == 1
                    ? () {
                        Get.to(() => CreateGroup());
                      }
                    : null, // Disable tap if not in Group tab
                child: Icon(
                  Icons.add,
                  size: 27,
                  color: Color(0xFF655FF5),
                ),
              )),
          SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(kWidth*0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchField(),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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

  Widget buildCard(String title, String description, String imageUrl, bool isMessage) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // Trực tiếp kiểm tra giá trị của selectedTabIndex
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
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(imageUrl),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: title,
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 4),
                      CustomText(
                        text: description,
                        fontSize: 13,
                        color: Color(0xFF49454F),
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                if (isMessage)
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '5+',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
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

  Widget _buildTab(String label, int index) {
    return GestureDetector(
      onTap: () {
        tabController.updateSelectedTabIndex(index);
        searchController.clear(); // Clear search when switching tabs
      },
      child: Obx(() => Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: tabController.selectedTabIndex.value == index
                  ? Colors.blue
                  : Colors.transparent,
              width: 4.0,
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
      height: 36, // Đặt chiều cao của thanh tìm kiếm
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: "Tìm kiếm",
          hintStyle: TextStyle(
            fontFamily: 'My Font',
            fontWeight: FontWeight.w400,
            fontSize: 17,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 8.0), // Điều chỉnh padding
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
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
                  Icon(Icons.message, color: Colors.blue),
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
              icon: Icon(Icons.group),
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

class CreateGroup extends StatelessWidget {
  CreateGroup({Key? key}) : super(key: key);

  final TextEditingController groupNameController = TextEditingController();
  final TextEditingController groupDescriptionController = TextEditingController();
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, String>> randomPeople = [
    {"name": "ABC", "imageUrl": "https://ln.run/rETuG"},
    {"name": "ABC", "imageUrl": "https://ln.run/rETuG"},
    {"name": "ABC", "imageUrl": "https://ln.run/rETuG"},
    {"name": "ABC", "imageUrl": "https://ln.run/rETuG"},
    {"name": "ABC", "imageUrl": "https://ln.run/rETuG"},
    {"name": "ABC", "imageUrl": "https://ln.run/rETuG"},
  ];

  List<Map<String, String>> filteredPeople = [];
  List<Map<String, String>> selectedPeople = [];

  @override
  Widget build(BuildContext context) {
    // Cập nhật filteredPeople với danh sách ban đầu
    filteredPeople = randomPeople;

    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Tạo nhóm',
          fontSize: 17,
          color: Color(0xFF4A35E8),
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.start,
        ),
        backgroundColor: Colors.white, // Màu nền của AppBar
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF4A35E8), // Màu của biểu tượng quay lại
          ),
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 45, // Đặt chiều cao của thanh tìm kiếm
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Đặt tên nhóm",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: 'My Font',
                    fontSize: 17,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 8.0), // Điều chỉnh padding
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  prefixIcon: const Icon(Icons.group, color: Colors.blue),
                  filled: true, // Đảm bảo rằng TextField có nền
                  fillColor: Colors.white, // Màu nền
                ),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 45, // Đặt chiều cao của thanh tìm kiếm
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Tìm tên hoặc số điện thoại",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: 'My Font',
                    fontSize: 17,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 8.0), // Điều chỉnh padding
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  prefixIcon: const Icon(Icons.search, color: Colors.blue),
                  filled: true, // Đảm bảo rằng TextField có nền
                  fillColor: Colors.white, // Màu nền
                ),
                onChanged: (query) {

                },
              ),
            ),
            SizedBox(height: 20),
            StatefulBuilder(
              builder: (context, setState) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: filteredPeople.length,
                    itemBuilder: (context, index) {
                      final person = filteredPeople[index];
                      final isSelected = selectedPeople.contains(person);
                      return ListTile(
                        leading: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                selectedPeople.remove(person);
                              } else {
                                selectedPeople.add(person);
                              }
                            });
                          },
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color(0xFF65558F),
                                width: 2,
                              ),
                              color: isSelected ? Color(0xFF65558F) : Colors.white,
                            ),
                            child: isSelected
                                ? Icon(Icons.check, size: 16, color: Colors.white)
                                : null,
                          ),
                        ),
                        title: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(person["imageUrl"]!),
                              radius: 20,
                            ),
                            SizedBox(width: 10),
                            Text(person["name"]!,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              selectedPeople.remove(person);
                            } else {
                              selectedPeople.add(person);
                            }
                          });
                        },
                      );
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Xử lý tạo nhóm
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent, // Đổi màu nền nút
                  foregroundColor: Colors.white, // Đổi màu chữ
                  minimumSize: Size(double.infinity, 50), // Chiều rộng full màn hình, chiều cao 50
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14), // Góc bo tròn
                  ),
                ),
                child: CustomText(
                  text: 'Tạo nhóm',
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Lọc danh sách dựa trên từ khóa tìm kiếm
  void _onSearchChanged(String query) {
    filteredPeople = randomPeople.where((person) {
      return person["name"]!
          .toLowerCase()
          .contains(query.toLowerCase()); // Lọc theo tên
    }).toList();
  }
}
