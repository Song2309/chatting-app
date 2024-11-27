import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:get/get.dart';
import 'package:lets_talk/widget/custom_text.dart';

class ForgetPassPage extends StatefulWidget {
  @override
  _ForgetPassPageState createState() => _ForgetPassPageState();
}

class _ForgetPassPageState extends State<ForgetPassPage> {
  int _currentStep = 0;
  double _progress = 0.01;

  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _otpController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isOTPVerified = false;

  void _nextStep() {
    if (_currentStep < 3) {
      setState(() {
        _currentStep++;
        _progress += 0.33;
      });
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
        _progress -= 0.33;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    final kHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        if (_currentStep > 0) {
          _previousStep();
          return false;
        } else {
          Get.offAllNamed('/signin');
          return false;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(''),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: EdgeInsets.all(kWidth*0.05),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    height: 5,
                    width: 350,
                    color: Colors.grey[300],
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 5,
                    width: 350 * _progress,
                    color: Color(0xFF007AFF),
                  ),
                ],
              ),
              // Nội dung các bước
              Expanded(
                child: IndexedStack(
                  index: _currentStep,
                  children: [
                    _buildStep1(),
                    _buildStep2(),
                    _buildStep3(),
                    _buildStep4(),
                  ],
                ),
              ),
              // Nút điều hướng
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_currentStep == 0) {
                          // Kiểm tra form ở bước 1
                          if (_formKey.currentState!.validate()) {
                            _nextStep();
                          } else {
                            // Hiển thị thông báo nếu form không hợp lệ
                            Get.snackbar('Lỗi',
                                'Vui lòng nhập gmail hoặc số điện thoại hợp lệ.',
                                snackPosition: SnackPosition.BOTTOM);
                          }
                        } else if (_currentStep == 1) {
                          // Kiểm tra mã OTP ở bước 2
                          if (_otpController.text == '123456') {
                            // Điều kiện mẫu
                            _isOTPVerified =
                            true; // Đánh dấu OTP đã được xác thực
                            _nextStep();
                          } else {
                            Get.snackbar('Lỗi', 'Mã OTP không chính xác.',
                                snackPosition: SnackPosition.BOTTOM);
                          }
                        } else if (_currentStep == 2) {
                          if (_formKey2.currentState!.validate()) {
                            _nextStep();
                          } else {
                            // Hiển thị thông báo nếu form không hợp lệ
                            Get.snackbar('Lỗi', 'Vui lòng nhập nhập mật khẩu mới',
                                snackPosition: SnackPosition.BOTTOM);
                          }
                        } else if (_currentStep == 3) {
                          // Bước cuối cùng, chuyển đến trang SignInPage
                          Get.offAllNamed('/signin');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF4A35E8),
                        foregroundColor: Colors.white,
                        minimumSize: Size(kWidth * 0.7, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child:CustomText(
                          text: _currentStep == 3 ? "Đăng nhập ngay" : 'Xác nhận',
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        color: Colors.white
                      ),
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

  Widget _buildStep1() {
    return Center(
      child: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0), // Padding tổng thể của ListView
          children: [
            // Padding cho từng thành phần
            Padding(
              padding: const EdgeInsets.only(top: 100.0, bottom: 40.0),
              // Khoảng cách phía dưới
              child: Center(
                child: Image.network(
                  'https://s.net.vn/UEH3',
                  width: 180,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: CustomText(
                text: 'Quên mật khẩu',
                fontSize: 34,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: CustomText(
                text: 'Chúng tôi sẽ gửi mã OTP để xác minh qua email/số điện thoại của bạn',
                fontSize: 15,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Email/Số điện thoại',
                  hintStyle: TextStyle(
                    fontFamily: 'My Font',
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF3C3C434D),
                    fontSize: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                ),
                validator: (value) => value!.isEmpty
                    ? 'Vui lòng nhập email hoặc số điện thoại'
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep2() {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0), // Padding tổng thể
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Padding cho từng thành phần
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 40.0),
                child: Image.network('https://s.net.vn/UEH3', width: 180),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: CustomText(
                  text: 'Quên mật khẩu',
                  fontSize: 34,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: CustomText(
                    text: 'Nhập mã OTP để đăng ký tài khoản',
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: PinCodeFields(
                  length: 6,
                  responsive: true,
                  // Giữ kích thước cố định cho các trường
                  fieldHeight: 60.0,
                  // Chiều cao trường
                  fieldWidth: 50.0,
                  // Chiều rộng trường
                  borderWidth: 1.0,
                  // Độ dày viền
                  activeBorderColor: Color(0xFF4A35E8),
                  // Màu viền khi trường đang được chọn
                  activeBackgroundColor: Colors.white,
                  // Màu nền khi trường đang được chọn
                  borderRadius: BorderRadius.circular(8.0),
                  // Bo góc để làm đẹp
                  keyboardType: TextInputType.number,
                  // Bàn phím số
                  autoHideKeyboard: false,
                  // Không tự động ẩn bàn phím
                  fieldBackgroundColor: Colors.grey.withOpacity(0.5),
                  // Màu nền cho trường
                  borderColor: Colors.grey,
                  // Màu viền khi không chọn
                  textStyle: TextStyle(
                      fontFamily: 'My Font',
                      fontSize: 34.0, // Kích thước chữ
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF555555)
                  ),
                  onComplete: (output) {
                    _otpController.text = output;
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // Canh giữa các widget trong Row
                children: [
                  CustomText(
                    text: 'Bạn không nhận được mã OTP?',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  TextButton(
                    onPressed: () {

                    },
                    child: CustomText(
                        text: 'Gửi lại',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF4A35E8)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStep3() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey2,  // Gán FormKey vào đây
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100, bottom: 40.0),
                child: Image.network('https://s.net.vn/UEH3', width: 180),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: CustomText(
                  text: 'Quên mật khẩu',
                  fontSize: 34,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: CustomText(
                    text: 'Nhập mật khẩu mới',
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    hintText: 'Mật khẩu',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 14,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () => setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      }),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) return 'Vui lòng nhập mật khẩu';
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: CustomText(
                    text: 'Xác nhận mật khẩu',
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: !_isConfirmPasswordVisible,
                  decoration: InputDecoration(
                    hintText: 'Nhập lại mật khẩu',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 14,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isConfirmPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () => setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                      }),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) return 'Vui lòng nhập lại mật khẩu';
                    if (value != _passwordController.text) {
                      return 'Mật khẩu không khớp';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStep4() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 120, bottom: 40.0),
              child: Image.network('https://s.net.vn/UEH3', width: 180)
          ),
          CustomText(
            text: 'Bạn đã thay đổi mật khẩu thành công',
            fontSize: 28,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
