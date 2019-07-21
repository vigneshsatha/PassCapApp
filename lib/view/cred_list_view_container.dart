import 'package:flutter/material.dart';

import 'cred_list_view.dart';
import 'new_cred_entry_container.dart';

class CredListViewContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Home(),
    );
  }
}
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('CredApp'),
        ),
        body: Container(
          child: CredList(),
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewCredEntryContainer()),
            );
          },
        ),
      ),
    );
  }
}
