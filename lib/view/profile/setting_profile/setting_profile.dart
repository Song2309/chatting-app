import 'package:flutter/material.dart';
import 'package:lets_talk/widget/custom_text.dart';
class SettingsProfilePage extends StatefulWidget {
  final String name;
  final String description;
  final String dob;
  final String gender;
  final String phone;
  final String email;

  SettingsProfilePage({
    required this.name,
    required this.description,
    required this.dob,
    required this.gender,
    required this.phone,
    required this.email,
  });

  @override
  _SettingsProfilePageState createState() => _SettingsProfilePageState();
}

class _SettingsProfilePageState extends State<SettingsProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _dobController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _genderController;
  String? selectedDay;
  String? selectedMonth;
  String? selectedYear;
  String? selectedGender;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _descriptionController = TextEditingController(text: widget.description);
    _dobController = TextEditingController(text: widget.dob);
    _phoneController = TextEditingController(text: widget.phone);
    _emailController = TextEditingController(text: widget.email);
    _genderController = TextEditingController(text: widget.gender);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _dobController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final kWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Cập nhật thông tin',
          fontSize: 22,
          color: Colors.black,
          fontWeight: FontWeight.w700,
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child:
        Padding(
          padding: EdgeInsets.all(kWidth*0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Tên hiển thị',
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.start,
              ),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                    hintText: 'Tên của bạn',
                    hintStyle: TextStyle(color: Colors.grey.shade600)),
              ),
              SizedBox(height: 20),
              CustomText(
                text: 'Tiểu sử',
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.start,
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                    hintText: 'Giới thiệu về bản thân',
                    hintStyle: TextStyle(color: Colors.grey.shade600)),
              ),
              SizedBox(height: 20),
              // Các trường khác không cần thiết hiển thị
              CustomText(
                text: 'Ngày sinh',
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.start,
              ),
              Row(
                children: [
                  // DropdownButton for Day
                  Expanded(
                    child: DropdownButton<String>(
                      value: selectedDay,
                      hint: Text('01'),
                      items: List.generate(31, (index) => (index + 1).toString())
                          .map((day) => DropdownMenuItem(
                        value: day,
                        child: Text(day),
                      ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedDay = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 8),

                  // DropdownButton for Month
                  Expanded(
                    child:
                    DropdownButton<String>(
                      value: selectedMonth,
                      hint: Text('01'),
                      items: List.generate(12, (index) => (index + 1).toString())
                          .map((month) => DropdownMenuItem(
                        value: month,
                        child: Text(month),
                      ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedMonth = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 8),

                  // DropdownButton for Year
                  Expanded(
                    child: DropdownButton<String>(
                      value: selectedYear,
                      hint: Text('1810'),
                      items: List.generate(100,
                              (index) => (DateTime.now().year - index).toString())
                          .map((year) => DropdownMenuItem(
                        value: year,
                        child: Text(year),
                      ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedYear = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              CustomText(
                text: 'Giới tính',
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.start,
              ),
              DropdownButton<String>(
                value: selectedGender,
                hint: Text(
                    'Nam                                                           '),
                items: ['Nam', 'Nữ', 'Khác']
                    .map((gender) => DropdownMenuItem(
                  value: gender,
                  child: Text(gender),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
              ),
              SizedBox(height: 20),
              CustomText(
                text: 'Số điện thoại',
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.start,
              ),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  hintText: '0123456789',
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  suffixIcon: TextButton(
                    onPressed: () {},
                    child: CustomText(
                      text: 'Thay đổi',
                      fontSize: 17,
                      color: Color(0xFF406FFF),
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 20),
              CustomText(
                text: 'Email',
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.start,
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'giacat@gmail.com',
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  suffixIcon: TextButton(
                    onPressed: () {},
                    child: CustomText(
                      text: 'Thay đổi',
                      fontSize: 17,
                      color: Color(0xFF406FFF),
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 150),
              ElevatedButton(
                onPressed: () {
                  final updatedData = {
                    'name': _nameController.text,
                    'description': _descriptionController.text,
                    'dob': _dobController.text,
                    'gender': _genderController.text, // Capture the gender value
                    'phone': _phoneController.text,
                    'email': _emailController.text,
                  };
                  Navigator.pop(context, updatedData); // Trả về dữ liệu cập nhật
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4A35E8),
                  minimumSize: Size(double.infinity, 50), // Chiều rộng full màn hình, chiều cao 50
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14), // Góc bo tròn
                  ),
                ),
                child: CustomText(
                  text: 'Xác nhận',
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
