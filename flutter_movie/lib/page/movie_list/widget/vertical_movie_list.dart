import 'package:flutter/material.dart';
import 'package:flutter_movie/model/movie.dart';

class VerticalMovieList extends StatelessWidget {
  final List<Movie> movieList;
  final String name;

  VerticalMovieList(this.movieList, this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.all(5),
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 170,
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        child: Text('hello'),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
