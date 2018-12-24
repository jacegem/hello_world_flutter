import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final Function login;

  LoginForm(this.login);

  void _login() {
    if (_formKey.currentState.validate()) {
      login(_emailController.text, _passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.email),
                      labelText: 'Email *',
                      border: const OutlineInputBorder(),
                    ),
                    controller: _emailController,
                    validator: (String value) =>
                        value.isEmpty ? 'Email is required' : null,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.lock),
                      border: const OutlineInputBorder(),
                      labelText: 'Password *',
                    ),
                    controller: _passwordController,
                    validator: (String value) =>
                        value.isEmpty ? 'Password is required' : null,
                    obscureText: true,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20.0),
                  child: RaisedButton(
                    onPressed: _login,
                    child: Text('Login'),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
