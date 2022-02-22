import 'package:flutter/material.dart';
import 'package:upbit_ui_clone/config/colors.dart';
import 'package:upbit_ui_clone/pages/upbit_first_page.dart';
import 'package:upbit_ui_clone/pages/upbit_second_page.dart';
import 'package:upbit_ui_clone/pages/upbit_setting_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<String> pageNameList = ['거래소', '코인정보', '투자내역', '입출금', '내정보'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UpbitColor.deepBlue,
      appBar: AppBar(
        backgroundColor: UpbitColor.deepBlue,
        centerTitle: true,
        title: Text(
          pageNameList[currentIndex],
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        actions: [
          if (currentIndex == 0)
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return UpbitSettingPage();
                    },
                  ),
                );
              },
              visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.settings_outlined,
                size: 20,
              ),
            ),
          if (currentIndex == 0 || currentIndex == 1)
            IconButton(
              onPressed: () {},
              visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.chat_outlined,
                size: 20,
              ),
            ),
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [
          UpbitFirstPage(),
          UpbitSecondPage(),
          Text("3"),
          Text("4"),
          Text("5"),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(),
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: UpbitColor.primary,
          currentIndex: currentIndex,
          onTap: (int newIndex) {
            setState(() {
              currentIndex = newIndex;
            });
          },
          iconSize: 24,
          unselectedItemColor: UpbitColor.grey2,
          selectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "거래소"),
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "코인정보"),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "투자내역"),
            BottomNavigationBarItem(icon: Icon(Icons.double_arrow_outlined), label: "입출금"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "내정보"),
          ],
        ),
      ),
      floatingActionButton: currentIndex == 0
          ? FloatingActionButton(
              backgroundColor: UpbitColor.secondary,
              onPressed: () {},
              child: Icon(
                Icons.gpp_good,
              ),
            )
          : null,
    );
  }
}
