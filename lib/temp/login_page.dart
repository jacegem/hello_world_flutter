import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;

    print('login attempt: $email with $password');

    if (_formKey.currentState.validate()) {
      _scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text('This is the Snackbar...'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Email Login'),
        ),
        body: Container(
          child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.email),
                      // hintText: 'What do people call you?',
                      labelText: 'Name *',
                      border: const OutlineInputBorder(),
                    ),
                    controller: _emailController,
                    validator: (String value) {
                      return value.contains('@')
                          ? 'Do not use the @ char.'
                          : null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.email),
                      hintText: 'What do people call you?',
                      labelText: 'Name *',
                    ),
                    controller: _passwordController,
                    validator: (val) => val.isEmpty ? 'Name is required' : null,
                  ),
                  RaisedButton(
                    onPressed: _login,
                    child: Text('Login'),
                  )
                ],
              )),
        ));
  }
}
