import 'package:flutter/material.dart';

import 'new_cred_entry.dart';

class NewCredEntryContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text('MyApp'),
      ),
      body: NewCredEntry(),
    ));
  }
}
