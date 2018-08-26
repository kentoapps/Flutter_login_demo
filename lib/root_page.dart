import 'package:flutter/material.dart';
import 'login_page.dart';
import 'auth.dart';

class RootPage extends StatefulWidget {
  RootPage({this.auth});

  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => _RootPageState();
}

enum AuthStatus { notSignIn, signIn }

class _RootPageState extends State<RootPage> {
  AuthStatus _authStatus = AuthStatus.notSignIn;

  @override
  void initState() {
    super.initState();
    widget.auth.currentUser().then((userId) {
      setState(() {
        _authStatus = userId == null ? AuthStatus.notSignIn : AuthStatus.signIn;
      });
    });
  }

  void _onSignedIn() {
    setState(() {
      _authStatus = AuthStatus.signIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch(_authStatus) {
      case AuthStatus.notSignIn:
        return LoginPage(auth: widget.auth, onSignedIn: _onSignedIn);
      case AuthStatus.signIn:
        return Scaffold(
          body: Container(
            child: Text('Welcome'),
          ),
        );
    }
    return LoginPage(auth: widget.auth);
  }
}
