import 'package:flutter/material.dart';
import '../pages/check/check_history_page.dart';

class CheckButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Container(
        decoration: new BoxDecoration(
            // color: Colors.green,
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  child: Text('기록'),
                  onPressed: () {
                    Navigator.pushNamed(context, CheckHistoryPage.ROUTE);
                  },
                ),
                RaisedButton(
                  child: Text('일정'),
                  onPressed: () {},
                ),
              ],
            ),
            // Container(child: Text('what?')),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.0),
              child: SizedBox(
                height: 80,
                child: RaisedButton(
                  color: Theme.of(context).accentColor,
                  textColor: Colors.white,
                  child: Text('체크'),
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
