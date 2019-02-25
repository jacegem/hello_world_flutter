import 'dart:async';
import 'dart:io';
import 'package:mlkit/mlkit.dart';
// import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:with_firebase2/mlkit/ml_home.dart';

class MLDetail extends StatefulWidget {
  final File _file;
  final String _scannerType;

  MLDetail(this._file, this._scannerType);

  @override
  _MLDetailState createState() => _MLDetailState();
}

class _MLDetailState extends State<MLDetail> {
  FirebaseVisionTextDetector textDetector = FirebaseVisionTextDetector.instance;
  FirebaseVisionBarcodeDetector barcodeDetector =
      FirebaseVisionBarcodeDetector.instance;
  FirebaseVisionLabelDetector labelDetector =
      FirebaseVisionLabelDetector.instance;
  FirebaseVisionFaceDetector faceDetector = FirebaseVisionFaceDetector.instance;

  List<VisionText> _currentTextLabels = <VisionText>[];
  List<VisionBarcode> _currentBarcodeLabels = <VisionBarcode>[];
  List<VisionLabel> _currentLabelLabels = <VisionLabel>[];
  List<VisionFace> _currentFaceLabels = <VisionFace>[];

  Stream sub;
  StreamSubscription<dynamic> subscription;

  void initState() {
    super.initState();
    sub = new Stream.empty();
    subscription = sub.listen((_) => _getImageSize)..onDone(analyzeLabels);
  }

  void analyzeLabels() async {
    try {
      var currentLabels;
      if (widget._scannerType == TEXT_SCANNER) {
        currentLabels = await textDetector.detectFromPath(widget._file.path);
        if (this.mounted) {
          setState(() {
            _currentTextLabels = currentLabels;
          });
        }
      } else if (widget._scannerType == BARCODE_SCANNER) {
        currentLabels = await barcodeDetector.detectFromPath(widget._file.path);
        if (this.mounted) {
          setState(() {
            _currentBarcodeLabels = currentLabels;
          });
        }
      } else if (widget._scannerType == LABEL_SCANNER) {
        currentLabels = await labelDetector.detectFromPath(widget._file.path);
        if (this.mounted) {
          setState(() {
            _currentBarcodeLabels = currentLabels;
          });
        }
      } else if (widget._scannerType == FACE_SCANNER) {
        currentLabels = await faceDetector.detectFromPath(widget._file.path);
        if (this.mounted) {
          setState(() {
            _currentFaceLabels = currentLabels;
          });
        }
      }
    } catch (e) {
      print('MyEx: ' + e.toString());
    }
  }

  @override
  void dispose() {
    super.dispose();
    subscription?.cancel();
  }

  Future<Size> _getImageSize(Image image) {
    Completer completer = Completer<Size>();
    image.image.resolve(ImageConfiguration()).addListener(
        (ImageInfo info, bool _) => completer.complete(
            Size(info.image.width.toDouble(), info.image.height.toDouble())));
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget._scannerType),
      ),
      body: Column(
        children: <Widget>[
          buildImage(context),
          widget._scannerType == TEXT_SCANNER
              ? buildTextList(_currentTextLabels)
              : widget._scannerType == BARCODE_SCANNER
                  ? buildBarcodeList<VisionBarcode>(_currentBarcodeLabels)
                  : widget._scannerType == FACE_SCANNER
                      ? buildBarcodeList<VisionFace>(_currentFaceLabels)
                      : buildBarcodeList<VisionLabel>(_currentLabelLabels)
        ],
      ),
    );
  }

  Widget buildImage(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Container(
          decoration: BoxDecoration(color: Colors.black),
          child: Center(
            child: widget._file == null
                ? Text('No Image')
                : FutureBuilder<Size>(
                    future: _getImageSize(
                        Image.file(widget._file, fit: BoxFit.fitWidth)),
                    builder:
                        (BuildContext context, AsyncSnapshot<Size> snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          foregroundDecoration: buildDecoration(snapshot),
                          child: Image.file(widget._file, fit: BoxFit.fitWidth),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
          ),
        ));
  }

  Decoration buildDecoration(AsyncSnapshot snapshot) {
    switch (widget._scannerType) {
      case TEXT_SCANNER:
        return TextDetectDecoration(_currentTextLabels, snapshot.data);
      // case FACE_SCANNER:
      //   return FaceDectecDecoration(_currentFaceLabels, snapshot.data);
      // case BARCODE_SCANNER:
      //   return BarcodeDetectDecoration(_currentBarcodeLabels, snapshot.data);
      // default:
      //   return LabelDetectDecoration(_currentLabelLabels, snapshot.data);
    }
  }

  Widget buildBarcodeList<T>(List<T> barcodes) {
    if (barcodes.length == 0) {
      return Expanded(
        flex: 1,
        child: Center(),
      );
    }

    return Expanded(flex: 1, child: Container());
  }

  Widget buildTextList(List<VisionText> texts) {
    if (texts.length == 0) {
      return Expanded(
        flex: 1,
        child: Center(
          child: Text(
            'No text detected',
            style: Theme.of(context).textTheme.subhead,
          ),
        ),
      );
    }
    return Expanded(
      flex: 1,
      child: Container(
        child: ListView.builder(
          padding: const EdgeInsets.all(1.0),
          itemCount: texts.length,
          itemBuilder: (context, i) {
            return _buildTextRow(texts[i].text);
          },
        ),
      ),
    );
  }

  Widget _buildTextRow(text) {
    return ListTile(
      title: Text('$text'),
      dense: true,
    );
  }
}

class TextDetectDecoration extends Decoration {
  final Size _originalImageSize;
  final List<VisionText> _texts;

  TextDetectDecoration(
    this._texts,
    this._originalImageSize,
  );

  @override
  BoxPainter createBoxPainter([onChanged]) {
    return _TextDetectPainter(_texts, _originalImageSize);
  }
}

class _TextDetectPainter extends BoxPainter {
  final List<VisionText> _texts;
  final Size _originalImageSize;

  _TextDetectPainter(this._texts, this._originalImageSize);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final paint = Paint()
      ..strokeWidth = 2.0
      ..color = Colors.red
      ..style = PaintingStyle.stroke;

    final _heightRatio = _originalImageSize.height / configuration.size.height;
    final _widthRatio = _originalImageSize.width / configuration.size.width;
    for (var text in _texts) {
      final _rect = Rect.fromLTRB(
          offset.dx + text.rect.left / _widthRatio,
          offset.dy + text.rect.top / _heightRatio,
          offset.dx + text.rect.right / _widthRatio,
          offset.dy + text.rect.bottom / _heightRatio);
      canvas.drawRect(_rect, paint);
    }
    canvas.restore();
  }
}
