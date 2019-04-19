import 'package:bloc_basic/bloc/bloc_provider.dart';
import 'package:bloc_basic/bloc/data_bloc.dart';
import 'package:bloc_basic/page/a.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget _buildMaterial() {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: APage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DataBloc>(
      bloc: DataBloc(),
      child: _buildMaterial(),
    );
  }
}
