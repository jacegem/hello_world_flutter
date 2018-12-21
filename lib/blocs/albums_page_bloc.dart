// https://github.com/NPKompleet/Beatz/blob/master/lib/blocs/albums_page_bloc.dart

import 'dart:async';
import 'bloc_provider.dart';

import 'package:hello_world_flutter/models/album.dart';
import 'package:rxdart/rxdart.dart';

class AlbumsPageBloc extends BlocBase {
  List<Album> _albumList = [];

  // Stream to handle displaying albums
  BehaviorSubject<List<Album>> _listController = BehaviorSubject<List<Album>>();
  StreamSink<List<Album>> get _albumListSink => _listController.sink;
  Stream<List<Album>> get albumListStrem => _listController.stream;

  AlbumsPageBloc() {
    _fetchAlbum();
  }

  Future<void> _fetchAlbum() async {
    _albumList = await PlatformService.fetchAlbums();
  }

  @override
  void dispose() {
    _listController.close();
  }
}
