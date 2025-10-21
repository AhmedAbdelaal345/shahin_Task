import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shahin_task/page/add_advertismet.dart';
import 'package:shahin_task/page/chat_page.dart';
import 'package:shahin_task/page/home_page.dart';
import 'package:shahin_task/page/my_account.dart';
import 'package:shahin_task/page/my_advertisment.dart';
import 'package:shahin_task/utils/app_color.dart';

class WrapperPage extends StatefulWidget {
  const WrapperPage({super.key});

  @override
  State<WrapperPage> createState() => _WrapperPageState();
}

class _WrapperPageState extends State<WrapperPage> {
  int index = 0;
  List<Widget> pages = [
    const HomePage(),
    const ChatPage(),
    const AddAdvertismet(),
    const MyAdvertisment(),
    const MyAccount(),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: pages[index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/image/svg/bungalow.svg",
              ),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/image/svg/chat.svg",
              ),
              label: 'محادثة',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/image/svg/add_box.svg",
              color: AppColor.blue,
              ),
              
              label: 'أضف اعلان',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/image/svg/dataset.svg",
              ),
              label: 'اعلاناتي',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/image/svg/account_circle.svg",
              ),
              label: 'حسابي',
            ),
          ],
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          type: BottomNavigationBarType.shifting,
          selectedIconTheme: IconThemeData(
            color: Colors.black,
            size: 30,
          ),
          unselectedIconTheme: IconThemeData(
            color: Colors.grey,
            size: 24,
          ),
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}