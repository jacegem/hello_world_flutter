import 'package:beautiful_list/model/lesson.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Lesson lesson;
  DetailPage({Key key, this.lesson}) : super(key: key);

  Widget _buildLevelIndicator() {
    return Container(
      child: Container(
        child: LinearProgressIndicator(
          backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
          value: lesson.indicatorValue,
          valueColor: AlwaysStoppedAnimation(Colors.green),
        ),
      ),
    );
  }

  Widget _buildCoursePrice() {
    return Container(
      padding: const EdgeInsets.all(7.0),
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: new Text(
        "\$${lesson.price.toString()}",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildTopContentText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Icon(Icons.directions_car, color: Colors.white, size: 40.0),
        Container(
          width: 70.0,
          child: new Divider(color: Colors.green),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          lesson.title,
          style: TextStyle(color: Colors.white, fontSize: 30.0),
        ),
        SizedBox(
          height: 30.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: _buildLevelIndicator(),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  lesson.level,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: _buildCoursePrice(),
            )
          ],
        )
      ],
    );
  }

  Widget _buildContent(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10.0),
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: new BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage('assets/image/drive-steering-wheel.jpg'),
                fit: BoxFit.cover),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 0.9)),
          child: Center(
            child: _buildTopContentText(),
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildReadButton(context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        onPressed: () => {},
        color: Color.fromRGBO(58, 66, 86, 1.0),
        child: Text(
          'Take this Lesson',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildBottomContentText() {
    return Text(
      lesson.content,
      style: TextStyle(fontSize: 18.0),
    );
  }

  Widget _buildBottomContent(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[
            _buildBottomContentText(),
            _buildReadButton(context)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildContent(context),
            _buildBottomContent(context),
          ],
        ),
      ),
    );
  }
}
