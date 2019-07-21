import 'package:flutter/material.dart';

import 'cred_list_view_container.dart';

class LoginView extends StatelessWidget {
  final pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Scaffold(
          body: Column(
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue[900], fontWeight: FontWeight.w400),
                obscureText: true,
                controller: pinController,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false
                    // otherwise.
                    String pin = pinController.text;
                    if (pin != "2834") {
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text("Wrong pin entered")));
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CredListViewContainer()),
                      );
                    }
                  },
                  child: Text('Submit'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
