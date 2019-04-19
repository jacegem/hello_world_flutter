import 'package:bloc_basic/bloc/bloc_provider.dart';
import 'package:bloc_basic/bloc/data_bloc.dart';
import 'package:bloc_basic/model/data.dart';
import 'package:bloc_basic/page/drawer.dart';
import 'package:flutter/material.dart';

class BPage extends StatefulWidget {
  @override
  _BPageState createState() => _BPageState();
}

class _BPageState extends State<BPage> {
  DataBloc _dataBloc;
  Data _data;

  TextEditingController aController = TextEditingController();
  TextEditingController bController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dataBloc = BlocProvider.of<DataBloc>(context);
  }

  void _save() {
    int a = int.parse(aController.text);
    int b = int.parse(bController.text);
    Data data = Data(a, b);

    _dataBloc.dataSink.add(data);
  }

  Widget _buildBody() {
    aController.text = _data.a.toString();
    bController.text = _data.b.toString();

    int result = _data.a - _data.b;

    return ListView(
      children: <Widget>[
        Text('첫번째 값'),
        TextFormField(
          controller: aController,
        ),
        Divider(),
        Text('두번째 값'),
        TextFormField(
          controller: bController,
        ),
        RaisedButton(
          onPressed: _save,
          child: Text('저장'),
        ),
        Divider(),
        Text(' - 결과 : $result'),
      ],
    );
  }

  Widget _buildScaffold() {
    return Scaffold(
      appBar: AppBar(
        title: Text('B Page'),
      ),
      drawer: DrawerPage(),
      body: _buildBody(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _dataBloc.dataStream,
      builder: (ctx, snapshot) {
        if (snapshot.hasData == false || snapshot.data == null)
          return Center(
            child: Text('아직 데이터 없음'),
          );

        _data = snapshot.data;

        return _buildScaffold();
      },
    );
  }
}
