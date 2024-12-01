import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
    required this.onSuccessfulLogin
  });

  final void Function(String key) onSuccessfulLogin;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey _formKey = GlobalKey<FormState>();

  String username = '';
  String password = '';
  String gameName = '';

  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.75,
          // height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background
          ),
          child: Column(
            children: [
              TextFormField(
                initialValue: gameName,
                onChanged: (value) {
                  gameName = value;
                },
              ),
              TextFormField(
                initialValue: username,
                onChanged: (value) {
                  username = value;
                },
              ),
              TextFormField(
                initialValue: password,
                onChanged: (value) {
                  password = value;
                },
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}