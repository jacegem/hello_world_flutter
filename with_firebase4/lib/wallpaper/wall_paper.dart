import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:with_firebase4/wallpaper/fullscreen_image.dart';


class WallScreen extends StatefulWidget {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  const WallScreen({Key key, this.analytics, this.observer}) : super(key: key);

  @override
  _WallScreenState createState() => _WallScreenState();
}

class _WallScreenState extends State<WallScreen> {
  static final MobileAdTargetingInfo targetInfo = new MobileAdTargetingInfo(
    testDevices: <String>[],
    keywords: <String>['wallpapers', 'walls', 'amoled'],
    childDirected: true,
  );

  BannerAd _bannerAd;
  InterstitialAd _interstitialAd;

  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> wallpapersList;
  final CollectionReference collectionReference =
      Firestore.instance.collection("wallpapers");

  BannerAd createBannerAd() {
    return new BannerAd(
        adUnitId: "ca-app-pub-9184373525576918/9639226582",
        size: AdSize.banner,
        targetingInfo: targetInfo,
        listener: (MobileAdEvent event) {
          print('Banner event: $event');
        });
  }

  InterstitialAd createInterstitialAd() {
    return new InterstitialAd(
        adUnitId: "ca-app-pub-9184373525576918/3592692984",
        targetingInfo: targetInfo,
        listener: (MobileAdEvent event) {
          print("Interstitial event : $event");
        });
  }

  void initState() {
    super.initState();
    FirebaseAdMob.instance
        .initialize(appId: "ca-app-pub-9184373525576918~6685760182");
    // _bannerAd = createBannerAd()
    //   ..load()
    //   ..show();

    subscription = collectionReference.snapshots().listen((datasnapshot) {
      setState(() {
        wallpapersList = datasnapshot.documents;
      });
    });
  }

  Future<Null> _sendAnalytics() async {
    await widget.analytics
        .logEvent(name: 'full_screen_tapped', parameters: <String, dynamic>{});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _bannerAd?.dispose();
    _interstitialAd?.dispose();
    subscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Wallfy2'),
      ),
      body: wallpapersList != null
          ? new StaggeredGridView.countBuilder(
              padding: const EdgeInsets.all(8.0),
              crossAxisCount: 4,
              itemCount: wallpapersList.length,
              itemBuilder: (context, i) {
                String imgPath = wallpapersList[i].data['url'];
                return new Material(
                  elevation: 8.0,
                  borderRadius: new BorderRadius.all(new Radius.circular(8.0)),
                  child: new InkWell(
                    onTap: () {
                      // _sendAnalytics();
                      // createInterstitialAd()
                      //   ..load()
                      //   ..show();
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  new FullScreenImagePage(imgPath, i)));
                    },
                    child: new Hero(
                      tag: i,
                      child: new FadeInImage(
                        image: new NetworkImage(imgPath),
                        fit: BoxFit.cover,
                        placeholder: new AssetImage("assets/wallfy.png"),
                      ),
                    ),
                  ),
                );
              },
              staggeredTileBuilder: (i) =>
                  new StaggeredTile.count(2, i.isEven ? 2 : 3),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            )
          : new Center(
              child: new CircularProgressIndicator(),
            ),
    );
  }
}
