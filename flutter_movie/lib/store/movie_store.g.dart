// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieStore on _MovieStore, Store {
  final _$movieListAtom = Atom(name: '_MovieStore.movieList');

  @override
  List<Movie> get movieList {
    _$movieListAtom.context.enforceReadPolicy(_$movieListAtom);
    _$movieListAtom.reportObserved();
    return super.movieList;
  }

  @override
  set movieList(List<Movie> value) {
    _$movieListAtom.context.conditionallyRunInAction(() {
      super.movieList = value;
      _$movieListAtom.reportChanged();
    }, _$movieListAtom, name: '${_$movieListAtom.name}_set');
  }
}
