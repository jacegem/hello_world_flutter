// https://github.com/NPKompleet/Beatz/blob/master/lib/blocs/albums_page_bloc.dart

import 'dart:async';
import 'dart:collection';

import 'bloc_provider.dart';
import 'package:hello_world_flutter/services/platform_service.dart';
import 'package:hello_world_flutter/models/album.dart';
import 'package:rxdart/rxdart.dart';

class AlbumsPageBloc extends BlocBase {
  List<Album> _albumList = [];

  // Stream to handle displaying albums
  BehaviorSubject<List<Album>> _listController = BehaviorSubject<List<Album>>();
  StreamSink<List<Album>> get _albumListSink => _listController.sink;
  Stream<List<Album>> get albumListStream => _listController.stream;

  AlbumsPageBloc() {
    _fetchAlbum();
  }

  Future<void> _fetchAlbum() async {
    _albumList = await PlatformService.fetchAlbums();
    _albumListSink.add(UnmodifiableListView<Album>(_albumList));
  }

  @override
  void dispose() {
    _listController.close();
  }
}
