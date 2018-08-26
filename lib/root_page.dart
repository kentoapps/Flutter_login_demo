import 'package:flutter/material.dart';
import 'login_page.dart';
import 'auth.dart';
import 'home_page.dart';

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

  void _onSignedOut() {
    setState(() {
      _authStatus = AuthStatus.notSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch(_authStatus) {
      case AuthStatus.notSignIn:
        return LoginPage(auth: widget.auth, onSignedIn: _onSignedIn);
      case AuthStatus.signIn:
        return HomePage(auth: widget.auth, onSignedOut: _onSignedOut);
    }
  }
}
