import 'package:flutter_web/material.dart';
import 'package:outdoor_furniture/widgets/button_row.dart';

class SmallBody extends StatelessWidget {
  const SmallBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: constraints.copyWith(
              minHeight: constraints.maxHeight,
              maxHeight: double.infinity,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Image.asset(
                      "background-image.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 60.0),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 40.0),
                          Text(
                            "Carica store new product",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0,
                                fontFamily: "Open Sans"),
                          ),
                          Text(
                            "Interior Design",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 35.0,
                                fontFamily: 'Merriweather'),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            "Recliner lad, eu mollis diam, vitae gravida mauris. Cras mollis malesuada sem vitae venenatis. Morbi at erat eget nulla placerat egestas ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 20.0,
                                fontFamily: "Open Sans"),
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(height: 20.0),
                          FlatButton(
                            onPressed: () {},
                            color: Color(0xFFCFE8E4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Read More",
                                  style: TextStyle(fontFamily: "Open Sans")),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        color: Color(0XFFFBEFD9),
                        padding: EdgeInsets.all(12.0),
                        child: ButtonRow(
                          size: MainAxisSize.max,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
