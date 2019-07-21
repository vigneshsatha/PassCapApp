import 'package:flutter/material.dart';

import '../service/crypto_service.dart';

class CredViewContainer extends StatelessWidget {
  final int id;
  final String password;
  final String userName;

  CredViewContainer(this.id, this.userName, this.password);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Cred App'),
          ),
          body: _CredView(this.id, this.userName, this.password)),
    );
  }
}

class _CredView extends StatefulWidget {
  final int id;
  final String password;
  final String userName;

  _CredView(this.id, this.userName, this.password);

  @override
  __CredViewState createState() => __CredViewState();
}

class __CredViewState extends State<_CredView> {
  String _password = "";
  String _passwordMask = "*******";
  bool decryptedFlag = false;
  CryptoService _cryptoService;
  __CredViewState(){
    this._cryptoService = CryptoService();
    this._password = this._passwordMask;
  }
  void decrypt() {
    setState(() {
      this.decryptedFlag = !decryptedFlag;
      if(this.decryptedFlag){
        this._password =  this._cryptoService.decrypt(this.widget.password);
      }else{
        this._password = this._passwordMask;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                Text(
                  "User Name",
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                Text(
                  this.widget.userName,
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.w400,
                      fontSize: 22.0),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                Text(
                  "Password",
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                Text(
                  this._password,
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.w400,
                      fontSize: 22.0),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          RaisedButton(
                            child: Text(
                              this.decryptedFlag
                                  ? "Hide Secret"
                                  : "Show Secret",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 22.0),
                            ),
                            onPressed: this.decrypt,
                            color: Colors.blue,
                            animationDuration: Duration(seconds: 500),
                          )
                        ]),
                  ),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
