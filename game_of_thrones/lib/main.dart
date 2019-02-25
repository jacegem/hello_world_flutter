import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:game_of_thrones/episodes_page.dart';
import 'package:game_of_thrones/got.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GOT got;

  void initState() {
    super.initState();
    fetchEpisodes();
  }

  Future<void> fetchEpisodes() async {
    var res = await http.get(
        "http://api.tvmaze.com/singlesearch/shows?q=game-of-thrones&embed=episodes");

    var decodeRes = jsonDecode(res.body);
    got = GOT.fromJson(decodeRes);
    print(decodeRes);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Game of Thrones')),
      body: got == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Card(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Hero(
                        tag: got.name,
                        child: CircleAvatar(
                          radius: 100.0,
                          backgroundImage: NetworkImage(got.image.original),
                        )),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      got.name,
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Rutime: ${got.runtime.toString()} minutes",
                      style: TextStyle(color: Colors.blue, fontSize: 18.0),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      got.summary,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EpisodesPage(
                                      episodes: got.eEmbedded.episodes,
                                      got: got)));
                        },
                        child: Text(
                          'All Episodes',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.red),
                  ],
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchEpisodes,
        backgroundColor: Colors.red,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
