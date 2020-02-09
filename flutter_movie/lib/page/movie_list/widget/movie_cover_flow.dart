import 'package:flutter/material.dart';
import 'package:flutter_movie/model/movie.dart';
import 'package:flutter_movie/util/hero_util.dart';

import 'back_drop_image.dart';

class MovieCoverFlow extends StatefulWidget {
  final List<Movie> movieList;

  const MovieCoverFlow(this.movieList);

  @override
  _MovieCoverFlowState createState() => _MovieCoverFlowState();
}

class _MovieCoverFlowState extends State<MovieCoverFlow> {
  double currentPage;
  var _visible = true;
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    PageController controller =
        PageController(initialPage: widget.movieList.length = 1);

    controller.addListener(() {
      setState(() {
        currentPage = controller.page;

        if (currentPage - currentPage.toInt() == 0) {
          _visible = true;
          _pageIndex = currentPage.toInt();
        } else {
          _visible = false;
        }
      });
    });

    return InkWell(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: <Widget>[
              AnimatedOpacity(
                opacity: _visible ? 1 : 0,
                duration: Duration(milliseconds: 250),
                child: Hero(
                    tag: HeroUtil.tag(
                        widget.movieList[_pageIndex].id, 'backdrop'),
                    child: BackDropImage(
                        widget.movieList[_pageIndex].backDropUrl)),
              )
            ],
          )
        ],
      ),
    );
  }
}
