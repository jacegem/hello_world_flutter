import 'package:hello_world_flutter/blocs/bloc_provider.dart';
import 'dart:async';

class HomePageBloc extends BlocBase {
  StreamController<int> _pageIndexController = StreamController<int>();
  Stream<int> get pageIndexStream => _pageIndexController.stream;
  StreamSink<int> get pageIndex => _pageIndexController.sink;

  @override
  void dispose() {
    _pageIndexController.close();
  }
}
