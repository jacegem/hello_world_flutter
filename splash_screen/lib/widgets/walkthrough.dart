import 'package:flutter/material.dart';

class Walkthrough extends StatefulWidget {
  final title;
  final content;
  final imageIcon;
  final imagecolor;

  const Walkthrough(
      {Key key,
      this.title,
      this.content,
      this.imageIcon,
      this.imagecolor = Colors.redAccent})
      : super(key: key);

  @override
  _WalkthroughState createState() => _WalkthroughState();
}

class _WalkthroughState extends State<Walkthrough>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation = Tween(begin: -250, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut));

    animation.addListener(() => setState(() {}));
    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Material(
        animationDuration: Duration(milliseconds: 500),
        elevation: 2.0,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Transform(
              transform:
                  new Matrix4.translationValues(animation.value, 0.0, 0.0),
              child: new Text(
                widget.title,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            new Transform(
              transform:
                  new Matrix4.translationValues(animation.value, 0.0, 0.0),
              child: new Text(
                widget.content,
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15.0,
                    color: Colors.black),
              ),
            ),
            new Icon(
              widget.imageIcon,
              size: 100.0,
              color: widget.imagecolor,
            ),
          ],
        ),
      ),
    );
  }
}
