import 'package:flutter/material.dart';
import 'package:flutter_movie/constant/theme.dart';

class MovieSearchPage extends SearchDelegate<String> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return kDarkTheme;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Text('results'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      child: Text('suggestions'),
    );
  }
}
