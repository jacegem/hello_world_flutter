import 'package:flutter/material.dart';
import '../../widgets/check_info.dart';
import '../../widgets/check_button.dart';
import '../../widgets/check_header.dart';

class CheckPage extends StatelessWidget {
  static const String ROUTE = '/check';

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text('체크'),
        ),
        body: ListView(
          children: <Widget>[
            Card(
              child: Column(
                children: <Widget>[
                  CheckHeader(),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CheckInfo(),
                          CheckButton(),
                        ]),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
