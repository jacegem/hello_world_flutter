import 'package:flutter/material.dart';
import 'row_text.dart';

class CheckInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Container(
        margin: EdgeInsets.only(right: 10.0),
        decoration: new BoxDecoration(
            // borderRadius: new BorderRadius.circular(16.0),
            // color: Colors.green,
            ),
        child: Column(
          children: <Widget>[
            RowText(title: '2018-12-31'),
            RowText(
              title: '시작 시각:',
              time: '16시 32분',
            ),
            RowText(
              title: '마지막 시각:',
              time: '19시 42분',
            ),
            RowText(
              title: '근무 시간:',
              time: '5시 12분',
            ),
          ],
        ),
      ),
    );
  }
}
