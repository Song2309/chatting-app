import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:get/get.dart';
import 'package:lets_talk/widget/custom_text.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  int _currentStep = 0;
  double _progress = 0.1;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isOTPVerified = false;

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      // Lấy giá trị từ các text fields và dropdown
      final fullName = _fullNameController.text;
      final dob = _dobController.text;
      final password = _passwordController.text;
    }
  }

  void _nextStep() {
    if (_currentStep < 2) {
      setState(() {
        _currentStep += 1;
        _progress += 0.5;
      });
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep -= 1;
        _progress -= 0.5;
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
          padding: EdgeInsets.all(kWidth * 0.05),
          child: Column(
            children: [
              // Thanh animation
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
                            Get.snackbar(
                                'Lỗi', 'Vui lòng nhập đầy đủ thông tin hợp lệ.',
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
                          // Bước cuối cùng, chuyển đến trang SignInPage
                          Get.offAllNamed('/signin');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF4A35E8),
                        // Đổi màu nền nút
                        foregroundColor: Colors.white,
                        // Đổi màu chữ
                        minimumSize: Size(kWidth * 0.7, 50),
                        // Chiều rộng full màn hình, chiều cao 50
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(16), // Góc bo tròn
                        ),
                      ),
                      child: CustomText(
                          text: _currentStep == 0
                              ? 'Đăng ký'
                              : _currentStep == 1
                              ? 'Xác nhận'
                              : 'Bắt đầu ngay',
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
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

  // Bước 1: Nhập thông tin cá nhân
  Widget _buildStep1() {
    final ValueNotifier<String> selectedGender = ValueNotifier<String>('Nam');
    final ValueNotifier<String> selectedWork =
        ValueNotifier<String>('Nhân viên');
    return Center(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Đăng ký tài khoản',
                fontSize: 34,
                fontWeight: FontWeight.w400,
              ),
              // Họ và tên
              CustomText(
                text: 'Họ và tên',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              TextFormField(
                controller: _fullNameController,
                decoration: InputDecoration(
                  hintText: 'Nguyễn Văn A',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 14,
                  ),
                  border: OutlineInputBorder(
                    // Khung viền bao bọc
                    borderRadius: BorderRadius.circular(16), // Bo góc
                  ),
                  enabledBorder: OutlineInputBorder(
                    // Viền khi không được focus
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Colors.grey, // Màu viền mặc định
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    // Viền khi được focus
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Colors.blue, // Màu viền khi focus
                      width: 2.0,
                    ),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Vui lòng nhập họ và tên' : null,
              ),
              SizedBox(height: 10),

              // Ngày sinh
              CustomText(
                text: 'Ngày sinh',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              TextFormField(
                controller: _dobController,
                decoration: InputDecoration(
                  hintText: '11/11/2000',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 14,
                  ),
                  border: OutlineInputBorder(
                    // Khung viền bao bọc
                    borderRadius: BorderRadius.circular(16), // Bo góc
                  ),
                  enabledBorder: OutlineInputBorder(
                    // Viền khi không được focus
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Colors.grey, // Màu viền mặc định
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    // Viền khi được focus
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Colors.blue, // Màu viền khi focus
                      width: 2.0,
                    ),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Vui lòng nhập ngày sinh' : null,
              ),
              SizedBox(height: 10),

              // Giới tính
              CustomText(
                text: 'Giới tính',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              GestureDetector(
                onTap: () {
                  // Khi click vào TextFormField, tự động chọn "Nam"
                  selectedGender.value = 'Nam';
                },
                child: ValueListenableBuilder<String>(
                  valueListenable: selectedGender,
                  builder: (context, gender, child) {
                    return TextFormField(
                      controller: TextEditingController(text: gender),
                      // Hiển thị giá trị được chọn
                      readOnly: true,
                      // Không cho phép người dùng nhập vào, chỉ click để chọn
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Colors.grey, // Màu viền mặc định
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Colors.blue, // Màu viền khi focus
                            width: 2.0,
                          ),
                        ),
                        hintText: 'Nam',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 14,
                        ), // Hiển thị mặc định là "Nam"
                      ),
                      validator: (value) => value == null || value.isEmpty
                          ? 'Vui lòng chọn giới tính'
                          : null, // Kiểm tra lỗi
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              // Chức vụ
              CustomText(
                text: 'Chức vụ',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              GestureDetector(
                onTap: () {
                  // Khi click vào TextFormField, tự động chọn "Nam"
                  selectedWork.value = 'Nhân viên';
                },
                child: ValueListenableBuilder<String>(
                  valueListenable: selectedWork,
                  builder: (context, gender, child) {
                    return TextFormField(
                      controller: TextEditingController(text: gender),
                      // Hiển thị giá trị được chọn
                      readOnly: true,
                      // Không cho phép người dùng nhập vào, chỉ click để chọn
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Colors.grey, // Màu viền mặc định
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Colors.blue, // Màu viền khi focus
                            width: 2.0,
                          ),
                        ),
                        hintText: 'Nhân viên',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 14,
                        ),
                        // Hiển thị mặc định là "Nam"
                      ),
                      validator: (value) => value == null || value.isEmpty
                          ? 'Vui lòng chọn giới tính'
                          : null, // Kiểm tra lỗi
                    );
                  },
                ),
              ),

              SizedBox(height: 10),

              CustomText(
                text: 'Email',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'nguyenvana@mevivu.com',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 14,
                  ),
                  border: OutlineInputBorder(
                    // Khung viền bao bọc
                    borderRadius: BorderRadius.circular(16), // Bo góc
                  ),
                  enabledBorder: OutlineInputBorder(
                    // Viền khi không được focus
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Colors.grey, // Màu viền mặc định
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    // Viền khi được focus
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Colors.blue, // Màu viền khi focus
                      width: 2.0,
                    ),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Vui lòng nhập ngày sinh' : null,
              ),
              SizedBox(height: 10),
              // Mật khẩu
              CustomText(
                text: 'Mật khẩu',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  hintText: '********',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 14,
                  ),
                  border: OutlineInputBorder(
                    // Khung viền bao bọc
                    borderRadius: BorderRadius.circular(16), // Bo góc
                  ),
                  enabledBorder: OutlineInputBorder(
                    // Viền khi không được focus
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Colors.grey, // Màu viền mặc định
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    // Viền khi được focus
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Colors.blue, // Màu viền khi focus
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
                validator: (value) =>
                    value!.isEmpty ? 'Vui lòng nhập mật khẩu' : null,
              ),
              SizedBox(height: 10),

              // Xác nhận mật khẩu
              CustomText(
                text: 'Xác nhận mật khẩu',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: !_isConfirmPasswordVisible,
                decoration: InputDecoration(
                  hintText: '********',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 14,
                  ),
                  border: OutlineInputBorder(
                    // Khung viền bao bọc
                    borderRadius: BorderRadius.circular(16), // Bo góc
                  ),
                  enabledBorder: OutlineInputBorder(
                    // Viền khi không được focus
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Colors.grey, // Màu viền mặc định
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    // Viền khi được focus
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Colors.blue, // Màu viền khi focus
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStep2() {
    return Center(
      child: SingleChildScrollView(
        // Thêm SingleChildScrollView nếu cần cuộn khi màn hình nhỏ
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 40.0),
              child: Image.network(
                'https://s.net.vn/UEH3',
                width: 180, // Sử dụng logo của bạn
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: CustomText(
                text: 'Đăng ký tài khoản',
                fontSize: 34,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Align(
                alignment: Alignment(-0.7, 1),
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
                    // Hàm xử lý khi người dùng nhấn "Gửi lại"
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
    );
  }

  Widget _buildStep3() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 140, bottom: 40.0),
              child: Image.network('https://s.net.vn/UEH3', width: 180)),
          Center(
            child: CustomText(
              text: 'Bạn đã đăng ký tài \nkhoản thành công',
              fontSize: 28,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
