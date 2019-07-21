import '../model/cred_model.dart';
import '../repo/cred_repo.dart';

class CredService {
  CredRepo _credRepo;
  CredService() {
    this._credRepo = CredRepo();
  }
  void saveCredModel(CredModel credModel) {
    this._credRepo.createCredModel(credModel);
  }
  Future<List<CredModel>> getAll(){
    return this._credRepo.getCredModels();
  }
}
