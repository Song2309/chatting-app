import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lets_talk/widget/custom_text.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // Controller để quản lý nhập liệu
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Trạng thái để kiểm tra xem mật khẩu có đang được hiển thị hay không
  bool _isPasswordVisible = false;

  // Trạng thái cho checkbox ghi nhớ đăng nhập
  bool _rememberMe = false;

  // Kiểm tra tài khoản và mật khẩu

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    final kHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        // Thêm SingleChildScrollView để tránh bị tràn màn hình
        padding: EdgeInsets.all(kWidth*0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo ở giữa
            Center(
              child: Image.network('https://s.net.vn/UEH3',
                  width: 180), // Sử dụng logo của bạn
            ),
            const SizedBox(height: 20),

            // TextField tài khoản
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                hintText: 'Tài khoản',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  borderSide: BorderSide(
                    color: Color(0xFF54545657),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // TextField mật khẩu
            TextField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              // Thay đổi theo trạng thái của _isPasswordVisible
              decoration: InputDecoration(
                hintText: 'Mật khẩu',
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 14,
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  borderSide: BorderSide(
                    color: Color(0xFF54545657),
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible =
                          !_isPasswordVisible; // Toggle mật khẩu
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Row: checkbox và quên mật khẩu
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: _rememberMe,
                  activeColor: Color(0xFF007AFF),
                  onChanged: (bool? value) {
                    setState(() {
                      _rememberMe =
                          value ?? false; // Cập nhật trạng thái checkbox
                    });
                  },
                ),
                const Text('Ghi nhớ đăng nhập',style: TextStyle(fontSize: 16)),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Get.offAllNamed('/forgot');
                  },
                  child: const Text('Quên mật khẩu?',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Button đăng nhập
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/homepage');
              },
              // Truyền context vào hàm _signIn
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4A35E8),
                // Đổi màu nền nút
                foregroundColor: Colors.white,
                // Đổi màu chữ
                minimumSize: Size(double.infinity, 50),
                // Chiều rộng full màn hình, chiều cao 50
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14), // Góc bo tròn
                ),
              ),
              child: const Text(
                'Đăng nhập',
                style: TextStyle(fontSize: 22),
              ),
            ),

            const SizedBox(height: 20),

            // Text chưa có tài khoản
            const Text('Bạn chưa có tài khoản?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            // Text button đăng kí
            TextButton(
              onPressed: () {
                Get.offAllNamed('/signup');
              },
              child: Text('Đăng kí ở đây',
                  style: TextStyle(fontSize: 16, color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
