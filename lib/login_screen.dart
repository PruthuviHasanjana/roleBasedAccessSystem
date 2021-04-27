import 'package:flutter/material.dart';
import 'package:role_based_access_control/teachers.dart';

import 'dashboard.dart';
import 'students.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  Map<String, String> _loginData = {
    "userName": "",
    "password": "",
    "role": "",
  };

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('There is an error.'),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                // Navigator.pushNamed(context, SignInScreen.routeName);
              },
              child: Text('OK'))
        ],
      ),
    );
  }

  void _submit() {
    var errorMessage;
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();

    if (_loginData['role'] == 'Admin' &&
        _loginData['userName'] == 'Pruthuvi' &&
        _loginData['password'] == '123456789') {
      Navigator.of(context).pushNamed(
        Dashboard.routeName,
      );
    } else if (_loginData['role'] == 'Teacher' &&
        _loginData['userName'] == 'Pruthuvi' &&
        _loginData['password'] == '123456789') {
      Navigator.of(context).pushNamed(
        Teachers.routeName,
      );
    } else if (_loginData['role'] == 'Student' &&
        _loginData['userName'] == 'Pruthuvi' &&
        _loginData['password'] == '123456789') {
      Navigator.of(context).pushNamed(
        Students.routeName,
      );
    } else if (_loginData['role'] == 'Teacher' &&
        _loginData['userName'] == 'Madhusanka' &&
        _loginData['password'] == '123456789') {
      Navigator.of(context).pushNamed(
        Teachers.routeName,
      );
    } else if (_loginData['role'] == 'Student' &&
        _loginData['userName'] == 'Madhusanka' &&
        _loginData['password'] == '123456789') {
      Navigator.of(context).pushNamed(
        Students.routeName,
      );
    } else if (_loginData['role'] == 'Student' &&
        _loginData['userName'] == 'Nimmi' &&
        _loginData['password'] == '123456789') {
      Navigator.of(context).pushNamed(
        Students.routeName,
      );
    } else {
      _showErrorDialog(
          'Your user credentials are wrong. Please input validate details.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 15.0,
                  left: 15,
                  right: 15,
                ),
                child: buildUserNameFormFeild(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 15.0,
                  left: 15,
                  right: 15,
                ),
                child: buildPasswordFormField(),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 15.0,
                  left: 15,
                  right: 15,
                ),
                child: buildRoleFormField(),
              ),
              RaisedButton(
                onPressed: () {
                  print('111111111111111');
                  _submit();
                },
                elevation: 5,
                color: Colors.blue,
                textColor: Colors.white,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildUserNameFormFeild() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (value) => _loginData['userName'] = value,
      decoration: InputDecoration(
        labelText: 'User Name',
        hintText: 'Enter your username',
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Input the correct NIC no';
        }
      },
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value.isEmpty || value.length < 8) {
          return 'Password is too short';
        }
      },
      onSaved: (value) => _loginData['password'] = value,
      decoration: InputDecoration(
        labelText: 'password',
        hintText: 'Enter the password',
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  DropdownButtonFormField buildRoleFormField() {
    return DropdownButtonFormField<String>(
      // value: _ratingController,
      items: ['Admin', 'Teacher', 'Student']
          .map((label) => DropdownMenuItem(
                child: Text(label.toString()),
                value: label,
              ))
          .toList(),
      hint: Text('Select your role'),
      onSaved: (value) => _loginData['role'] = value,
      onChanged: (value) {
        setState(() {
          _loginData['role'] = value;
        });
      },
    );
  }
}
