import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upbit_ui_clone/config/colors.dart';

class UpbitSettingPage extends StatelessWidget {
  const UpbitSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UpbitColor.deepBlue,
      appBar: AppBar(
        backgroundColor: UpbitColor.deepBlue,
        centerTitle: true,
        title: Text(
          '화면설정',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      body: ListView(
        children: [
          headerTitle('거래소 화면'),
          settingTile('상장 코인정보 다시 받기', isSwitch: false),
          divider(),
          settingTile('관심코인 다시 받기', isSwitch: false),
          divider(),
          settingTile('내 보유자산 표시'),
          divider(),
          settingTile('가격 변동 범위 표시'),
          divider(),
          settingTile('체결시 반짝임 표시'),
          divider(),
          settingTile('보유코인 탭 표시'),
          divider(),
          settingTile('전일대비 등락 금액 표시', subtitle: 'KRW 마켓만 적용됩니다.'),
          divider(),
          settingTile('거래대금 KRW 환산 표시', subtitle: 'BTC, USDT 마켓만 적용됩니다.'),
          divider(),
          settingTile('코인상세(시세,차트,호가) 미리보기'),
          headerTitle('주문 화면'),
          divider(),
          settingTile('가격 변동 범위 표시'),
          divider(),
          settingTile('체결시 반짝임 표시'),
          divider(),
          settingTile('보유코인 탭 표시'),
          divider(),
          settingTile('내 보유자산 표시'),
          headerTitle('화면 일반'),
          settingTile('내 보유자산 표시'),
          headerTitle('화면 테마'),
          settingTile('데이 모드(일반)', isRadio: true, isSwitch: false),
          divider(),
          settingTile('다크 모드', isRadio: true, isSwitch: false),
          divider(),
          settingTile('시스템 설정값', isRadio: true, isSwitch: false),
        ],
      ),
    );
  }
}

Widget headerTitle(String title) {
  return Container(
    color: UpbitColor.primary,
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    child: Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget settingTile(
  String title, {
  String? subtitle,
  bool isSwitch = true,
  bool isRadio = false,
}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: isSwitch ? 4 : 0),
    child: Row(
      children: [
        if (isRadio)
          Radio(
            fillColor: MaterialStateProperty.resolveWith(
              (states) => UpbitColor.blue,
            ),
            // value: Random().nextBool(),
            value: Random().nextBool(),
            groupValue: Random().nextBool(),
            onChanged: (value) {},
          ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
            if (subtitle != null)
              Text(
                subtitle,
                style: TextStyle(
                  color: UpbitColor.grey2,
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              ),
          ],
        ),
        Spacer(),
        isSwitch
            ? CupertinoSwitch(
                value: Random().nextBool(),
                onChanged: (value) {},
                activeColor: UpbitColor.blue,
                trackColor: UpbitColor.grey2,
              )
            : isRadio
                ? SizedBox()
                : ElevatedButton(
                    onPressed: () {},
                    child: Text('갱신'),
                    style: ElevatedButton.styleFrom(
                      primary: UpbitColor.blue,
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      minimumSize: Size.zero,
                    ),
                  ),
      ],
    ),
  );
}

Widget divider() {
  return Divider(color: UpbitColor.blue, height: 0);
}
