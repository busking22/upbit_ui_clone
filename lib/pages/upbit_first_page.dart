import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:upbit_ui_clone/config/colors.dart';

class UpbitFirstPage extends StatelessWidget {
  const UpbitFirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            hintText: '코인명/심볼 검색',
            hintStyle: TextStyle(
              color: Colors.white,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
            ),
          ),
        ),
        ToggleButtons(
          children: [
            Text(
              "KRW",
              style: TextStyle(
                color: UpbitColor.blue,
              ),
            ),
            Text(
              "BTC",
              style: TextStyle(
                color: UpbitColor.grey2,
              ),
            ),
            Text(
              "USDT",
              style: TextStyle(
                color: UpbitColor.grey2,
              ),
            ),
            Text(
              "관심",
              style: TextStyle(
                color: UpbitColor.grey2,
              ),
            ),
          ],
          isSelected: [
            true,
            false,
            false,
            false,
          ],
        ),
        Divider(
          color: UpbitColor.grey1,
          thickness: 0.5,
        ),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: Text(
                "한글명",
                style: TextStyle(
                  color: UpbitColor.grey2,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                "현재가",
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: UpbitColor.grey2,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                "전일대비",
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: UpbitColor.grey2,
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Text(
                "거래대금",
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: UpbitColor.grey2,
                ),
              ),
            ),
            Spacer(),
          ],
        ),
        Divider(
          color: UpbitColor.grey1,
          thickness: 0.25,
        ),
        coinTile('리플', 'XRP/KRW'),
        thinDivider(),
        coinTile('디센트럴랜드', 'XRP/KRW'),
        thinDivider(),
        coinTile('스트라이크', 'XRP/KRW'),
        thinDivider(),
        coinTile('비트코인', 'XRP/KRW'),
        thinDivider(),
        coinTile('샌드박스', 'XRP/KRW'),
        thinDivider(),
        coinTile('이더리움', 'XRP/KRW'),
        thinDivider(),
        coinTile('솔라나', 'XRP/KRW'),
        thinDivider(),
        coinTile('보라', 'XRP/KRW'),
        thinDivider(),
        coinTile('마라', 'XRP/KRW'),
        thinDivider(),
        coinTile('해라', 'XRP/KRW'),
        thinDivider(),
        coinTile('하지마라', 'XRP/KRW'),
        thinDivider(),
        coinTile('폴리콘', 'XRP/KRW'),
        thinDivider(),
        coinTile('도지코인', 'XRP/KRW'),
        thinDivider(),
        coinTile('도지코인클래식', 'XRP/KRW'),
        thinDivider(),
        coinTile('도지코인베토벤', 'XRP/KRW'),
        thinDivider(),
        coinTile('도지코인워싱턴', 'XRP/KRW'),
        thinDivider(),
        coinTile('네오', 'XRP/KRW'),
        thinDivider(),
        coinTile('펀디엑스', 'XRP/KRW'),
        thinDivider(),
        coinTile('하이브', 'XRP/KRW'),
        thinDivider(),
        coinTile('저스트', 'XRP/KRW'),
        thinDivider(),
        coinTile('리스크', 'XRP/KRW'),
        thinDivider(),
        coinTile('뮤탈리스크', 'XRP/KRW'),
        thinDivider(),
        coinTile('하하코인', 'XRP/KRW'),
        thinDivider(),
        coinTile('왁스', 'XRP/KRW'),
        thinDivider(),
        coinTile('넴', 'XRP/KRW'),
        thinDivider(),
        coinTile('아니오', 'XRP/KRW'),
      ],
    );
  }
}

Widget thinDivider() {
  return Divider(
    color: UpbitColor.grey1,
    thickness: 0.25,
    height: 4,
  );
}

Widget coinTile(String coin, String unit) {
  bool ranbool = Random().nextBool();
  return Container(
    padding: EdgeInsets.symmetric(vertical: 2),
    child: Row(
      children: [
        Spacer(),
        Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coin,
                  style: TextStyle(
                    color: UpbitColor.grey1,
                  ),
                ),
                Text(
                  unit,
                  style: TextStyle(
                    color: UpbitColor.grey2,
                    fontSize: 12,
                  ),
                ),
              ],
            )),
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                NumberFormat('###,###,###').format(Random().nextInt(1000000)),
                style: TextStyle(
                  color: ranbool ? UpbitColor.red : UpbitColor.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(''),
            ],
          ),
        ),
        Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${!ranbool ? '-' : ''}${(Random().nextDouble() * 20).toStringAsFixed(2)} %',
                  style: TextStyle(
                    color: ranbool ? UpbitColor.red : UpbitColor.blue,
                  ),
                ),
                Text(
                  Random().nextInt(1000).toString(),
                  style: TextStyle(
                    color: ranbool ? UpbitColor.red : UpbitColor.blue,
                  ),
                ),
              ],
            )),
        Expanded(
          flex: 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "${NumberFormat('###,###,###').format(Random().nextInt(1000000))}백만",
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(""),
            ],
          ),
        ),
        Spacer(),
      ],
    ),
  );
}
