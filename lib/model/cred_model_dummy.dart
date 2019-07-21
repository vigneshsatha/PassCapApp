class CredModelDummy{
  BigInt _id;
  String _userName;
  String _password;
  CredModelDummy(this._id, this._userName, this._password);
  String getUserName(){
    return this._userName;
  }
  String getPassword(){
    return this._password;
  }
  BigInt getId(){
    return this._id;
  }
}