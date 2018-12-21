import 'package:flutter/material.dart';
import 'package:hello_world_flutter/blocs/home_page_bloc.dart';
import 'package:hello_world_flutter/blocs/bloc_provider.dart';
import 'package:hello_world_flutter/pages/albu';
import 'package:hello_world_flutter/blocs/albums_page_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageBloc _bloc;
  AnimationController _controller;
  Animation<double> _heigtAnimation;

  final _widgetOptions = [
    BlocProvider<AlbumPageBloc>(
      bloc: AlbumsPageBloc(),
      child: AlbumsPage(),
    )
  ]

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Text('homepage s'),
    );
  }
}
