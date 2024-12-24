import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:twilight_imperium/http/http_connector.dart';

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
  final _formKey = GlobalKey<FormState>();

  String username = '';
  String password = '';
  String gameName = '';

  bool active = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/basebackground.jpg'),
          fit: BoxFit.cover 
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage('assets/images/logo.png')
            ),
          ),
          Form(
            key: _formKey,
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildField(
                      'Game Name',
                      (value) { gameName = value; },
                      (value) => null
                    ),
                    _buildField(
                      'Username',
                      (value) { username = value; },
                      (value) => null
                    ),
                    _buildField(
                      'Password',
                      (value) { password = value; },
                      (value) => null
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: active ? () { _createOrLogin(false); } : null, 
                          child: const Text('Log In')
                        ),
                        ElevatedButton(
                          onPressed: active ? () { _createOrLogin(true); } : null, 
                          child: const Text('Create')
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Simplified input generation
  TextFormField _buildField(String hint, void Function(String) onChanged, String? Function(String?) validator) {
    return TextFormField(
      decoration: InputDecoration.collapsed(hintText: hint),
      enabled: active,
      textAlign: TextAlign.center,
      onChanged: onChanged,
      validator: validator
    );
  }
  
  Future<void> _createOrLogin(bool createGame) async {
    if(_formKey.currentState!.validate()) {
        setState(() {
            active = false;
        });
        LoginRequest request = LoginRequest()
            ..gameName = gameName
            ..gamePassword = 'password'
            ..username = username
            ..password = password;

        (createGame) ? 
            await HTTPConnector.createGame() :
            await HTTPConnector.login(request);

        setState(() {
          active = true;
        });
    }
  }
}