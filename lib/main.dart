import 'package:flutter/material.dart';

import 'view/login_view_container.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginViewContainer(),
    );
  }
}

