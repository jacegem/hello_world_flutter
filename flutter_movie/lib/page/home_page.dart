import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_movie/store/movie_store.dart';
import 'package:flutter_movie/widget/side_menu.dart';
import 'package:provider/provider.dart';

import 'movie_list/movie_list_page.dart';
import 'movie_list/widget/movie_cover_flow.dart';
import 'movie_search_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MovieStore _movieStore;

  @override
  Widget build(BuildContext context) {
    _movieStore ??= Provider.of<MovieStore>(context);

    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        title: Text('Movist'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {
              return showSearch(context: context, delegate: MovieSearchPage());
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '박스 오피스',
//                    style: themeData.textTheme.headline,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.view_list,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) {
                            return MovieListPage(title: '박스 오피스');
                          },
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
            Observer(
              builder: (_) {
                if (_movieStore.popularMovieList.length == 0) {
                  return Container(
                      height: 460,
                      child: Center(child: CircularProgressIndicator()));
                } else {
                  return MovieCoverFlow(_movieStore.popularMovieList.reversed);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
