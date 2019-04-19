import 'dart:async';

import 'package:bloc_basic/bloc/bloc_provider.dart';
import 'package:bloc_basic/model/data.dart';
import 'package:rxdart/rxdart.dart';

class DataBloc extends BlocBase {
  BehaviorSubject<Data> _dataController = BehaviorSubject();
  StreamSink<Data> get dataSink => _dataController.sink;
  Stream<Data> get dataStream => _dataController.stream;

  @override
  void dispose() {
    _dataController.close();
  }

  DataBloc() {
    Data data = Data(0, 0);
    dataSink.add(data);
  }
}
