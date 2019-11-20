import 'package:flutter_web/material.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Image.asset(
            "background-image.jpg",
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(width: 60.0),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Carica store new product",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                    fontFamily: "Open Sans"),
              ),
              const SizedBox(height: 20.0),
              Text(
                "Interior Design",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 50.0,
                    fontFamily: 'Merriweather'),
              ),
              const SizedBox(height: 14.0),
              Text(
                "Recliner lad, eu mollis diam, vitae gravida mauris. Cras mollis malesuada sem vitae venenatis. Morbi at erat eget nulla placerat egestas ",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 24.0,
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
                  padding: const EdgeInsets.all(12.0),
                  child: Text("Read More",
                      style: TextStyle(fontFamily: "Open Sans")),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 100.0),
      ],
    );
  }
}
