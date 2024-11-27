import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lets_talk/widget/custom_text.dart';

class ManagePerson extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    List<Map<String, dynamic>> members = [
      {'name':'Trọng Triết (Bạn)', 'image': 'https://ln.run/ZgsyS','role': 'Trưởng nhóm', 'isCustom': false},
      {'name': 'Gia Bảo', 'image': 'https://ln.run/ZD4gJ','role': 'Phó nhóm', 'isCustom': true},
      {'name': 'Quốc Khánh', 'image': 'https://ln.run/TG0n0','role': 'Thành viên nhóm', 'isCustom': true},
      {'name': 'Hoàng Bảo', 'image': 'https://ln.run/TYlRl','role': 'Thành viên nhóm', 'isCustom': true},
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Thành viên nhóm',
        style: TextStyle(
          fontSize: 17,
          color: Color(0xFF4A35E8),
          fontFamily: 'My Font',
          fontWeight: FontWeight.w400,),
        ),
        backgroundColor: Colors.white,
        leadingWidth: 15,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFF4A35E8)),
          onPressed: () {
            Get.back(); // Go back to previous screen
          },
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(kWidth*0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thanh tìm kiếm
            SizedBox(
              height: 40, // Đặt chiều cao của thanh tìm kiếm
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Search", // Đổi labelText thành hintText để tối giản
                  contentPadding: const EdgeInsets.symmetric(vertical: 8.0), // Điều chỉnh padding
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle, // Hình dạng tròn
                      color: Colors.grey.shade500, // Màu nền của vòng tròn
                    ),
                    child: IconButton(
                      icon: Icon(Icons.close, color: Colors.white), // Icon bên trong vòng tròn
                      onPressed: () {
                        // Xử lý sự kiện bấm nút
                      },
                    ),
                  ),
                  filled: true, // Đảm bảo rằng TextField có nền
                  fillColor: Colors.grey.shade200, // Màu nền
                ),
                onChanged: (query) {

                },
              ),
            ),
            SizedBox(height: 10),
            Divider(color: Colors.grey,thickness: 1),
            SizedBox(height: 16),
            Text(
              'Thành viên (4)',
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
                fontFamily: 'My Font',
                fontWeight: FontWeight.w600,
              ),
            ),
            // Danh sách thành viên
            Expanded(
              child: ListView.builder(
                itemCount: members.length,
                itemBuilder: (context, index) {
                  final member = members[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 5),
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        // Circle Avatar
                        CircleAvatar(
                          backgroundImage: NetworkImage(member['image']),
                          radius: 30,
                        ),
                        SizedBox(width: 12),

                        // Tên thành viên
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                member['name'],
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontFamily: 'My Font',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '${member['role']}',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey,
                                  fontFamily: 'My Font',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Icon more (hiện nếu isCustom == true)
                        if (member['isCustom'] == true)
                          IconButton(
                            icon: Icon(Icons.more_vert), // Icon more (dấu ba chấm)
                            onPressed: () {
                              showCustomDialog(context); // Hiện dialog khi nhấn
                            },
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.account_circle_outlined),
                title: Text('Trang cá nhân',
                 style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontFamily: 'My Font',
                    fontWeight: FontWeight.w200,
                  ),
                ),
                onTap: () {
                 // Get.to(() => ProfilePerson(item: person)); // Điều hướng đến ProfilePerson và truyền person
                },
              ),
              ListTile(
                leading: Icon(Icons.manage_accounts_outlined),
                title: Text('Phân làm phó nhóm',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontFamily: 'My Font',
                    fontWeight: FontWeight.w200,
                  ),
                ),
                onTap: () {
                  // Thêm logic cho "Phân làm phó nhóm"
                },
              ),
              ListTile(
                leading: Icon(Icons.person_remove_alt_1_outlined, color: Colors.red),
                title: Text('Xóa khỏi nhóm', style: TextStyle(
                  fontSize: 17,
                  color: Colors.red,
                  fontFamily: 'My Font',
                  fontWeight: FontWeight.w200,
                ),),
                onTap: () {
                  // Thêm logic cho "Xóa khỏi nhóm"
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
