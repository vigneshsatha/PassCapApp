import '../model/cred_model.dart';
import './../db/database.dart';

class CredRepo {
  Future<CredModel> getCredModelById(BigInt id) async {
    final db = await DatabaseProvider.databaseProvider.database;
    var res =await  db.query("cred_table", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? CredModel.fromJson(res.first) : Null ;
  }

  Future<List<CredModel>> getCredModels() async {
    final db = await DatabaseProvider.databaseProvider.database;
    var res = await db.query("cred_table");
    List<CredModel> credList = res.map((c){
      return CredModel.fromJson(c);
    }).toList();
    return credList;
  }

  createCredModel(CredModel credModel) async {
    final db = await DatabaseProvider.databaseProvider.database;
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM cred_table");
    int id = table.first["id"];
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into cred_table (id, user_name, password)"
        " VALUES (?,?,?)",
        [id, credModel.userName, credModel.password]);
    return raw;
  }

  deleteCredModel(BigInt id) async {
    final db = await DatabaseProvider.databaseProvider.database;
    db.delete("cred_table", where: "id = ?", whereArgs: [id]);
  }
  void updateCredModel(CredModel credModel) async {
    
  }
}
