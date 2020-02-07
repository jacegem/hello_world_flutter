import 'package:flutter/material.dart';
import 'package:flutter_movie/constant/theme.dart';
import 'package:mobx/mobx.dart';

part 'setting_store.g.dart';

class SettingStore = _SettingStore with _$SettingStore;

abstract class _SettingStore with Store {
  _SettingStore() {
    themeData = kDarkTheme;
  }

  @observable
  ThemeData themeData;
}
