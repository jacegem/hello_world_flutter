import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String _titleValue = '';
  String _descriptionValue = '';
  double _priceValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(children: <Widget>[
        TextField(
          decoration: InputDecoration(labelText: 'Product Title'),
          onChanged: (String value) {
            setState(() {
              _titleValue = value;
            });
          },
        ),
        TextField(
          maxLines: 4,
          decoration: InputDecoration(labelText: 'Product Description'),
          onChanged: (String value) {
            setState(() {
              _descriptionValue = value;
            });
          },
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Product Price'),
          keyboardType: TextInputType.number,
          onChanged: (String value) {
            setState(() {
              _priceValue = double.parse(value);
            });
          },
        ),
        SwitchListTile(
          title: Text('Accept term'),
          value: true,
          onChanged: (bool value) {},
        ),
        SizedBox(
          height: 10.0,
        ),
        RaisedButton(
          child: Text('Save'),
          color: Theme.of(context).accentColor,
          textColor: Colors.white,
          onPressed: () {
            Map<String, dynamic> product = {
              'title': _titleValue,
              'description': _descriptionValue,
              'price': _priceValue,
              'image': 'assets/food.jpg',
            };
            widget.addProduct(product);
            Navigator.pushReplacementNamed(context, '/');
          },
        )
      ]),
    );
  }
}

// return Center(
//         child: RaisedButton(
//       child: Text('Save'),
//       onPressed: () {
//         showModalBottomSheet(
//             context: context,
//             builder: (BuildContext context) {
//               return Center(
//                 child: Text('This is a Modal!'),
//               );
//             });
//       },
//     ));
