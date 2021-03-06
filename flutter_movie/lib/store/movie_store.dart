import 'package:flutter/material.dart';
import 'package:flutter_movie/constant/theme.dart';
import 'package:flutter_movie/model/movie.dart';
import 'package:mobx/mobx.dart';

part 'movie_store.g.dart';

class MovieStore = _MovieStore with _$MovieStore;

abstract class _MovieStore with Store {
//  _MovieStore() {
//    themeData = kDarkTheme;
//  }
//
  @observable
  List<Movie> movieList = [];

  @observable
  List<Movie> popularMovieList = [];
}
