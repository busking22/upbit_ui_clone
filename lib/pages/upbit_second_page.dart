import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:upbit_ui_clone/config/colors.dart';

class UpbitSecondPage extends StatefulWidget {
  const UpbitSecondPage({Key? key}) : super(key: key);

  @override
  State<UpbitSecondPage> createState() => _UpbitSecondPageState();
}

class _UpbitSecondPageState extends State<UpbitSecondPage> with TickerProviderStateMixin {
  TabController? controller;
  TabController? controller2;
  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    controller2 = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: UpbitColor.deepBlue,
        appBar: TabBar(
          controller: controller,
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              child: Text("코인동향"),
            ),
            Tab(
              child: Text("코인뉴스"),
            )
          ],
        ),
        body: TabBarView(
          controller: controller,
          children: [
            ListView(
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      height: 180,
                      child: TabBarView(
                        controller: controller2,
                        children: [
                          Image.asset('assets/upbit_chart.png'),
                          Image.asset('assets/upbit_chart.png'),
                          Image.asset('assets/upbit_chart.png'),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 24),
                      child: TabPageSelector(
                        indicatorSize: 8,
                        controller: controller2,
                        color: UpbitColor.grey2.withOpacity(0.25),
                        selectedColor: UpbitColor.blue,
                      ),
                    ),
                  ],
                ),
                wideDivider(),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      headerWidget('코인 시가총액'),
                      thickDivider(),
                      coinRankTile('비트코인'),
                      thinDivider(),
                      coinRankTile('이더리움'),
                      thinDivider(),
                      coinRankTile('리플'),
                      thinDivider(),
                      coinRankTile('에이다'),
                      thinDivider(),
                      coinRankTile('솔라나'),
                    ],
                  ),
                ),
                wideDivider(),
                Container(
                  height: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      headerWidget('주요환율'),
                      thickDivider(),
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: currencyCard(),
                              ),
                              Expanded(
                                child: currencyCard(),
                              ),
                            ],
                          ),
                          thinDivider(),
                          Row(
                            children: [
                              Expanded(
                                child: currencyCard(),
                              ),
                              Expanded(
                                child: currencyCard(),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Text("HELLO"),
          ],
        ),
      ),
    );
  }
}

Widget wideDivider() => Divider(
      thickness: 20,
      color: UpbitColor.primary.withOpacity(0.4),
    );

Widget thickDivider() => Divider(
      thickness: 0.3,
      color: UpbitColor.grey1,
      height: 0,
    );

Widget thinDivider() => Divider(
      thickness: 0.2,
      color: UpbitColor.grey1,
      height: 0,
    );

Widget coinRankTile(String title) => Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize: 16,
            ),
          ),
          Spacer(),
          Text(
            NumberFormat('###,###,###').format(Random().nextInt(100000000)),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            '주문',
            style: TextStyle(
              color: UpbitColor.blue,
              fontWeight: FontWeight.w400,
              fontSize: 16,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );

Widget headerWidget(String title) => Padding(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );

Widget currencyCard() {
  Color ranColor = Random().nextBool() ? UpbitColor.red : UpbitColor.blue;
  return Container(
    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "미국 (KRW/USD)",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              Text(
                "1,191.50",
                style: TextStyle(
                  color: ranColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  letterSpacing: 1.3,
                ),
              ),
              Text(
                "4.00, 0.33%",
                style: TextStyle(
                  color: ranColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 16,
              height: 60,
              decoration: BoxDecoration(
                color: ranColor.withOpacity(0.15),
              ),
            ),
            Container(
              width: 16,
              height: 4,
              decoration: BoxDecoration(
                color: ranColor,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
