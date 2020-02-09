import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_movie/page/movie_list/widget/vertical_movie_list.dart';
import 'package:flutter_movie/store/movie_store.dart';
import 'package:provider/provider.dart';

class MovieListPage extends StatelessWidget {
  final String title;

  MovieListPage({this.title});

  @override
  Widget build(BuildContext context) {
    MovieStore movieStore = Provider.of<MovieStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Observer(
        builder: (_) {
          if (movieStore.movieList.length == 0) {
            return CircularProgressIndicator();
          } else {
            return VerticalMovieList(movieStore.movieList, 'vertical_list');
          }
        },
      ),
    );
  }
}
