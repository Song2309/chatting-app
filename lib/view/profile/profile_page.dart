import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart'; // for image picker
import '../../Controller/bottom_controller.dart';
import '../../Controller/tab_controller.dart';
import 'setting_profile/setting_profile.dart'; // Page to update profile info
import 'package:lets_talk/widget/custom_text.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TabControler tabController = Get.put(TabControler());
  String avatarImage = 'https://ln.run/KFitk'; // Default URL avatar
  String selectedBackground = 'https://ln.run/JdBfU'; // Default background image

  // Variables for personal info
  String name = 'Nhị Lang Thần';
  String description =
      ' Life is too short to be anything. Love deeply,\n forgive quickly, take chances, do anything with  \n no regrets!';

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    final kHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz, color: Colors.blue),
            onPressed: () {
              _showSettingsBottomSheet(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(kWidth * 0.05),
          child: Column(
            children: [
              _buildProfile(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  // Show bottom sheet with options to view full image or change avatar
  void _showAvatarOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.account_circle_outlined),
              title: CustomText(
              text: 'Xem ảnh đại diện',
              fontSize: 17,
              color: Colors.black,
              fontWeight: FontWeight.w100,
              textAlign: TextAlign.start,
              ),
              onTap: () {
                _viewFullImage(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.image_outlined),
              title: CustomText(
                text: 'Đổi ảnh',
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.w100,
                textAlign: TextAlign.start,
              ),
              onTap: () {
                _changeAvatar();
              },
            ),
          ],
        );
      },
    );
  }

  // View full image in a new screen with AppBar and options
  void _viewFullImage(BuildContext context) {
    Get.to(() => FullScreenImagePage(avatarImage));
  }

  // Pick a new avatar image from the gallery
  Future<void> _changeAvatar() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        avatarImage = image.path;
      });
    }
  }

  // Show settings bottom sheet
  void _showSettingsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.account_circle_rounded, color: Colors.black),
              title: CustomText(
                text: 'Cập nhật thông tin',
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.w100,
                textAlign: TextAlign.start,
              ),
              onTap: () {
                // Navigate to profile update page
                Get.to(() => SettingsProfilePage(
                      name: name,
                      description: description,
                      dob: '',
                      gender: '',
                      phone: '',
                      email: '',
                    ))?.then((updatedData) {
                  if (updatedData != null) {
                    setState(() {
                      name = updatedData['name'];
                      description = updatedData['description'];
                    });
                  }
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.upload),
              title: CustomText(
                text: 'Đăng lên nhật ký',
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.w100,
                textAlign: TextAlign.start,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.download),
              title: CustomText(
                text: 'Lưu ảnh về máy',
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.w100,
                textAlign: TextAlign.start,
              ),
              onTap: () {},
            ),
          ],
        );
      },
    );
  }

  // Build profile UI
  Widget _buildProfile() {
    return Column(
      children: [
        Image(image: NetworkImage(selectedBackground), fit: BoxFit.cover),
        GestureDetector(
          onTap: () => _showAvatarOptions(context),
          child: CircleAvatar(
            radius: 50.0,
            backgroundImage: NetworkImage(avatarImage),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: name,
              fontSize: 17,
              color: Colors.black,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.start,
            ),
            Icon(Icons.edit),
          ],
        ),
        SizedBox(height: 5),
        CustomText(
          text: description,
          fontSize: 17,
          color: Colors.black,
          fontWeight: FontWeight.w200,
          textAlign: TextAlign.start,
          maxLines: 4,
        ),
      ],
    );
  }

  // Build bottom navigation bar
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
                Get.offAndToNamed(
                    '/contract'); // Điều hướng đến trang ContractPage
                break;
              case 2:
                Get.offAndToNamed(
                    '/profile'); // Điều hướng đến trang ProfilePage
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
                          '5+', // Số thông báo
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
              icon: Icon(Icons.person, color: Colors.blue),
              label: 'Cá nhân',
            ),
          ],
        );
      },
    );
  }
}

// Full Screen Image Page
class FullScreenImagePage extends StatelessWidget {
  final String imageUrl;

  FullScreenImagePage(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 5,
        // Bóng AppBar
        title: CustomText(
          text: '01-01-1970 . 21:21',
          fontSize: 17,
          color: Colors.white,
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        leading: TextButton(
          onPressed: () {
            Get.back(); // Quay lại trang trước
          },
          child: Row(
            mainAxisSize: MainAxisSize.min, // Thu gọn Row vừa nội dung
            children: [
              FittedBox(
                fit: BoxFit.contain, // Co chữ nếu cần
                child: CustomText(
                  text: 'Đóng',
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz, color: Colors.white),
            onPressed: () {
              _showImageOptions(context); // Hiển thị tùy chọn
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Nền màu đen
          Container(
            color: Colors.black, // Đặt màu nền là màu đen
          ),
          // Hình ảnh ở trung tâm
          Center(
            child: Image.network(
              'https://ln.run/KFitk',
              fit: BoxFit.contain,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ],
      ),
    );
  }

  // Show options like share, save image, etc.
  void _showImageOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.share),
              title: CustomText(
                text: 'Chia sẻ',
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.w100,
                textAlign: TextAlign.start,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.upload),
              title: CustomText(
                text: 'Đăng lên nhật ký',
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.w100,
                textAlign: TextAlign.start,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.save_alt),
              title: CustomText(
                text: 'Lưu ảnh về máy',
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.w100,
                textAlign: TextAlign.start,
              ),
              onTap: () {},
            ),
          ],
        );
      },
    );
  }
}
