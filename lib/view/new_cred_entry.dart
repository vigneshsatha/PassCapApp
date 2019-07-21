import 'package:flutter/material.dart';

import '../crypto/crypto_helper.dart';
import './../service/cred_service.dart';
import './../model/cred_model.dart';

class NewCredEntry extends StatefulWidget {
  @override
  _NewCredEntryState createState() => new _NewCredEntryState();
}

class _NewCredEntryState extends State<NewCredEntry> {
  CredService _credService;
  
  _NewCredEntryState() {
    this._credService = new CredService();
    
  }
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: TextFormField(
                    controller: userNameController,
                    autofocus: true,
                    decoration:
                        InputDecoration(labelText: 'Enter your username'),
                    style: TextStyle(fontSize: 22),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'User Name cannot be empty';
                      }
                      return null;
                    },
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(labelText: 'Enter your Secret'),
                    style: TextStyle(fontSize: 22),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Secret cannot be empty';
                      }
                      return null;
                    },
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  onPressed: () async {
                    // Validate returns true if the form is valid, or false
                    // otherwise.
                    if (_formKey.currentState.validate()) {
                      // If the form is valid, display a Snackbar.
                      CredModel credModel = CredModel();
                      credModel.userName = this.userNameController.text;
                      credModel.password = this.passwordController.text;
                      String password = await CryptoHelper.cryptoHelper.encrypt(credModel.password);
                      credModel.password = password;
                      this._credService.saveCredModel(credModel);
                      Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(this.userNameController.text)));
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    this.userNameController.dispose();
    this.passwordController.dispose();
    super.dispose();
  }
}
