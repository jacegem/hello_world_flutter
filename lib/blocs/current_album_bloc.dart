// https://github.com/NPKompleet/Beatz/blob/master/lib/blocs/current_album_bloc.dart

import 'dart:async';
import 'dart:collection';
import 'bloc_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:hello_world_flutter/models/audio_media.dart';
import 'package:hello_world_flutter/services/platform_service.dart';

class CurrentAlbumBloc extends BlocBase {
  List<AudioMedia> _albumSongsList = [];

  // Stream to handle displaying songs
  BehaviorSubject<List<AudioMedia>> _listController =
      BehaviorSubject<List<AudioMedia>>();
  StreamSink<List<AudioMedia>> get _albumSongsListSink => _listController.sink;
  Stream<List<AudioMedia>> get albumSongsListStream => _listController.stream;

  // Stream to handle playing songs
  StreamController _playController = StreamController();
  StreamSink get startSong => _playController.sink;
  Stream get _playSong => _playController.stream;

  // Stream to handle updating slider
  StreamController<List<String>> _uiController =
      StreamController<List<String>>();
  StreamSink<List<String>> get _uiSink => _uiController.sink;
  Stream<List<String>> get uiStream => _uiController.stream;

  // Stream to handle playing songs
  StreamController<double> _seekerController =
      StreamController<double>.broadcast();
  StreamSink get seekTo => _playController.sink;
  Stream get _seek => _playController.stream;

  CurrentAlbumBloc(int albumId) {
    _fetchAlbumSongs(albumId);
    _playSong.listen(_startPlaying)
    playState.addListener(_pauseAndResume);
  }

  Future<void> _fetchAlbumSongs(int id) async{
    _albumSongsList = await PlatformService.fetchSongsFromAlbum(id);
    _albumSongsListSink.add(UnmodifiableListView<AudioMedia>(_albumSongsList));
    songInfo.value = [
      _albumSongsList[_songIndex].title,
      _albumSongsList[_songIndex].artist
    ];
    _duration = _albumSongsList[_songIndex].duration;
    _durationString = await compute(TimeUtil.convertTimeToString, _duration);
    
  }


  @override
  void dispose() {
    _listController.close();
    _playController.close();
    _uiController.close();
    _seekerController.close();
    playState.dispose();
    songInfo.dispose();
  }
}
