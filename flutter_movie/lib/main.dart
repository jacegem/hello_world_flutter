import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_movie/constant/theme.dart';
import 'package:flutter_movie/page/home_page.dart';
import 'package:flutter_movie/store/setting_store.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        Provider<SettingStore>(
          create: (BuildContext context) => SettingStore(),
        ),
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SettingStore settingStore = Provider.of<SettingStore>(context);

    return Observer(
      builder: (_) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: settingStore.themeData,
          home: HomePage(),
        );
      },
    );
  }
}
