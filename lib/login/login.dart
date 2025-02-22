import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twilight_imperium/http/http_connector.dart';
import 'package:twilight_imperium/shared/http/create_request.dart';
import 'package:twilight_imperium/shared/http/login_request.dart';
import 'package:twilight_imperium/shared/http/response.dart';
import 'package:twilight_imperium/state/state_page.dart' as ps;

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool popup = false;
  String popupMessage = '';

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
      child: Stack(
        children: [
          (popup) ? Container(
            decoration: const BoxDecoration(
                color: Colors.black45
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Column(
                children: [
                  Text(
                    popupMessage,
                    style: const TextStyle(
                      color: Colors.white
                    )
                  ),
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        popupMessage = '';
                        popup = false;
                      });
                    },
                    child: const Text('OK')
                  )
                ],
              ),
            )
          ) : const SizedBox(),
          Column(
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
                              onPressed: active ? () { _createOrLogin(false, () { Provider.of<ps.PageState>(context, listen: false).changePage(ps.Page.main); }); } : null, 
                              child: const Text('Log In')
                            ),
                            ElevatedButton(
                              onPressed: active ? () { _createOrLogin(true, () { Provider.of<ps.PageState>(context, listen: false).changePage(ps.Page.main); }); } : null, 
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
        ]
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
  
  Future<void> _createOrLogin(bool createGame, void Function() onSuccessfulLogin) async {

    if(_formKey.currentState!.validate()) {
        setState(() {
            active = false;
        });        
        (createGame) ? 
            await HTTPConnector.createGame(
              CreateRequest('', username, password, gameName, 'password'),
              (TIResponse res) {
                if(res.isSuccess) {
                  onSuccessfulLogin();
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(res.message ?? 'No Message Given: Response was ${res.isSuccess}'),
                  )
                );
              },
              () {
                setState(() {
                  popup = true;
                  popupMessage = 'Error in CreateRequest';
                });
              }
            ) :
            await HTTPConnector.login(
              LoginRequest('', username, password, gameName, ''),
              (TIResponse res) { // On Success
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(res.message ?? 'No Message Given: Response was ${res.isSuccess}'),
                  )
                );
              },
              () {
                setState(() {
                  popup = true;
                  popupMessage = 'Error in LoginRequest';
                });
              }
            );

        setState(() {
          active = true;
        });
    }
  }
}