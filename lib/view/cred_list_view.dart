// Create a Form widget.
import 'package:flutter/material.dart';

import '../model/cred_model.dart';
import '../service/cred_service.dart';
import 'cred_view.dart';

class CredList extends StatefulWidget {
  @override
  CredListState createState() {
    return CredListState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class CredListState extends State<CredList> {
  CredService _credService;

  CredListState() {
    this._credService = CredService();
  }

  void viewCred(int id, String userName, String password) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CredViewContainer(id, userName, password)),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: FutureBuilder<List<CredModel>>(
          future: this._credService.getAll(),
          builder:
              (BuildContext context, AsyncSnapshot<List<CredModel>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  CredModel credModel = snapshot.data[index];
                  return Card(
                    child: new InkWell(
                      onTap: ()=> viewCred(credModel.id, credModel.userName, credModel.password),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          credModel.userName,
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
