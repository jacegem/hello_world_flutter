import 'package:flutter/material.dart';

import 'package:reorderables/reorderables.dart';

class WrapExample extends StatefulWidget {
  @override
  _WrapExampleState createState() => _WrapExampleState();
}

class _WrapExampleState extends State<WrapExample> {
  double _iconSize = 95;
  List<Widget> _tiles;

  @override
  void initState() {
    super.initState();
    _tiles = <Widget>[
      Icon(Icons.filter_1, size: _iconSize),
      Icon(Icons.filter_2, size: _iconSize),
      Icon(Icons.filter_3, size: _iconSize),
      Icon(Icons.filter_4, size: _iconSize),
      Icon(Icons.filter_5, size: _iconSize),
      Icon(Icons.filter_6, size: _iconSize),
      Icon(Icons.filter_7, size: _iconSize),
      Icon(Icons.filter_8, size: _iconSize),
      Icon(Icons.filter_9, size: _iconSize),
    ];
  }

  List<Widget> _buildTiles() {
    return _tiles.map((tile) {
      return Container(
        color: Colors.deepOrange,
        width: _iconSize,
        height: _iconSize,
        child: Text('tile'),
      );
    }).toList();
    // return <Widget>[
    //   Icon(Icons.filter_1, size: _iconSize),
    //   Icon(Icons.filter_2, size: _iconSize),
    //   Icon(Icons.filter_3, size: _iconSize),
    //   Icon(Icons.filter_4, size: _iconSize),
    //   Icon(Icons.filter_5, size: _iconSize),
    //   Icon(Icons.filter_6, size: _iconSize),
    //   Icon(Icons.filter_7, size: _iconSize),
    //   Icon(Icons.filter_8, size: _iconSize),
    //   Icon(Icons.filter_9, size: _iconSize),
    // ];
  }

  @override
  Widget build(BuildContext context) {
    double minSize = 120;
    double space = 10;
    double setSize = minSize + space;
    double width = MediaQuery.of(context).size.width;

    int showCount = 0;
    for (int count in List<int>.generate(100, (i) => i + 1)) {
      if (width < count * setSize + space) {
        showCount = count - 1;
        break;
      }
    }

    double adjustSize = (width - ((showCount + 1) * space)) / showCount;

    setState(() {
      _iconSize = adjustSize;
      debugPrint('_iconSize : $_iconSize');
    });

    void _onReorder(int oldIndex, int newIndex) {
      setState(() {
        Widget row = _tiles.removeAt(oldIndex);
        _tiles.insert(newIndex, row);
      });
    }

    var wrap = ReorderableWrap(
        alignment: WrapAlignment.center,
        spacing: space,
        runSpacing: 4.0,
        padding: const EdgeInsets.all(8),
        // children: _tiles,
        children: _buildTiles(),
        onReorder: _onReorder,
        onNoReorder: (int index) {
          //this callback is optional
          debugPrint(
              '${DateTime.now().toString().substring(5, 22)} reorder cancelled. index:$index');
        },
        onReorderStarted: (int index) {
          //this callback is optional
          debugPrint(
              '${DateTime.now().toString().substring(5, 22)} reorder started: index:$index');
        });

    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        wrap,
        ButtonBar(
          alignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(
              iconSize: 50,
              icon: Icon(Icons.add_circle),
              color: Colors.deepOrange,
              padding: const EdgeInsets.all(0.0),
              onPressed: () {
                var newTile = Icon(Icons.filter_9_plus, size: _iconSize);
                setState(() {
                  _tiles.add(newTile);
                });
              },
            ),
            IconButton(
              iconSize: 50,
              icon: Icon(Icons.remove_circle),
              color: Colors.teal,
              padding: const EdgeInsets.all(0.0),
              onPressed: () {
                setState(() {
                  _tiles.removeAt(0);
                });
              },
            ),
          ],
        ),
      ],
    );

    return SingleChildScrollView(
      child: column,
    );
  }
}
