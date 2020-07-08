import 'package:flutter/cupertino.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:mobx/mobx.dart';
import 'package:pesquisa_cep/app/modules/home/repository/cep_repository.dart';
import 'package:pesquisa_cep/app/shared/models/cep_model.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  CepRepository _cepRepository;

  _HomeControllerBase(this._cepRepository);

  static ObservableFuture<List<CepModel>> emptyResponse =
      ObservableFuture.value([]);

  @observable
  ObservableFuture<List<CepModel>> cepFuture = emptyResponse;

  var cidadeController = TextEditingController();
  var ruaController = TextEditingController();
  var ufController = TextEditingController();

  @action
  void fetchData() {
    cepFuture = _cepRepository
        .getData(
          cidade: "Rio de Janeiro",
          rua: "Rua Senador Bernardo Monteiro",
          uf: "RJ",
        )
        .asObservable();
  }
}
