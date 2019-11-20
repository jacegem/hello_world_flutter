import 'package:flutter_web/material.dart';
import 'package:outdoor_furniture/small_body.dart';
import 'package:outdoor_furniture/utils/responsive_layout.dart';
import 'package:outdoor_furniture/widgets/button_row.dart';

import 'body.dart';

class Furniture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Furniture",
          style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic),
        ),
        leading: Image.asset('icon/nav-icon.png'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: ResponsiveLayout(
        largeChild: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(48.0),
                child: SizedBox(
                  height: 50.0,
                  child: ButtonRow(),
                ),
              ),
            ),
            Body()
          ],
        ),
        smallChild: SmallBody(),
      ),
    );
  }
}
