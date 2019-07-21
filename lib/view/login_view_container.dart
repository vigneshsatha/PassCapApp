import 'package:flutter/material.dart';

import 'login_view.dart';

class LoginViewContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text('MyApp'),
      ),
      body: LoginView(),
    ));
  }
}
