import 'package:flutter/cupertino.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:mobx/mobx.dart';
import 'package:pesquisa_cep/app/modules/home/repository/cep_repository.dart';
import 'package:pesquisa_cep/app/shared/models/cep_model.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  CepRepository _cepRepository;

  _HomeControllerBase(this._cepRepository) {
    firstTime = true;
  }

  static ObservableFuture<List<CepModel>> emptyResponse =
      ObservableFuture.value([]);

  @observable
  bool firstTime = true;

  @observable
  ObservableFuture<List<CepModel>> cepFuture = emptyResponse;

  @observable
  ObservableList<CepModel> cepList = <CepModel>[].asObservable();

  var cidadeController = TextEditingController();
  var ruaController = TextEditingController();
  var ufController = TextEditingController();

  @observable
  String cidade = "";

  @observable
  String rua = "";

  @observable
  String uf = "";

  @action
  setCidade(String value) => cidade = value;

  @action
  setRua(String value) => rua = value;

  @action
  setUf(String value) => uf = value;

  @action
  void fetchData() {
    clearCepList();

    cepFuture = _cepRepository
        .getData(
          cidade: cidade,
          rua: rua,
          uf: uf,
        )
        .asObservable();

    cepFuture.whenComplete(
      () => cepList.addAll(cepFuture.value),
    );
    firstTime = false;
  }

  @action
  clearContext() {
    rua = "";
    cidade = "";
    uf = "";
    cidadeController.clear();
    ruaController.clear();
    ufController.clear();
  }

  @action
  clearCepList() {
    cepList = <CepModel>[].asObservable();
  }

  @computed
  bool get isEmpty => rua.isEmpty && cidade.isEmpty && uf.isEmpty;

  @computed
  bool get canClick => rua.isNotEmpty && cidade.isNotEmpty && uf.isNotEmpty;
}
