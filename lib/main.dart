import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/ChatScreen/chat_group.dart';
import 'view/contract/ContactPage/call_group_page.dart';
import 'view/contract/ContactPage/call_page.dart';
import 'view/contract/ContactPage/video_group_page.dart';
import 'view/contract/ContactPage/video_page.dart';
import 'view/ChatScreen/SettingChat/GroupManageMember/manage_person.dart';
import 'view/ChatScreen/SettingChat/setting_chat.dart';
import 'view/ChatScreen/SettingChat/setting_group_chat.dart';
import 'view/SignIn/forget_pass.dart';
import 'view/SignIn/sign_in.dart';
import 'view/ChatScreen/chat_page.dart';
import 'view/SignIn/sign_up.dart';
import 'view/contract/contract_page.dart';
import 'view/home/home_page.dart';
import 'view/profile/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'MyFont',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: SignInPage(), // Trang đầu tiên
      getPages: [
        GetPage(name: '/signin', page: () => SignInPage()),
        GetPage(name: '/signup', page: () => SignUpPage()),
        GetPage(name: '/forgot', page: () => ForgetPassPage()),
        GetPage(name: '/homepage', page: () => HomePage()),
        GetPage(name: '/creategourp', page: () => CreateGroup()),
        GetPage(name: '/contract', page: () => ContractPage()),
        GetPage(name: '/profile', page: () => ProfilePage()),
        GetPage(name: '/chat_person', page: () => ChatPage()),
        GetPage(name: '/chat_group', page: () => ChatGroupPage()),
        GetPage(name: '/manage_person', page: () => ManagePerson()),
        GetPage(name: '/setting_chat_person', page: () => SettingChat()),
        GetPage(name: '/setting_chat_group', page: () => SettingGroupChat()),
        GetPage(name: '/call_person', page: () => CallPage()),
        GetPage(name: '/video_person', page: () => VideoPage()),
        GetPage(name: '/call_group', page: () => CallGroupPage()),
        GetPage(name: '/video_group', page: () => VideoGroupPage()),

      ],
    );
  }
}
