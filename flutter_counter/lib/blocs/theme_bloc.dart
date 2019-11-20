import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

enum ThemeEvent { toggle }

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  @override
  ThemeData get initialState => null;

  @override
  Stream<ThemeData> mapEventToState(ThemeEvent event) {
    // TODO: implement mapEventToState
    return null;
  }
}
