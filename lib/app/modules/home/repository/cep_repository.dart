import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pesquisa_cep/app/shared/models/cep_model.dart';

class CepRepository {
  final Dio _dio;
  CepRepository(this._dio);

  Future<List<CepModel>> getData({
    @required String uf,
    @required String cidade,
    @required String rua,
  }) async {
    var response = await _dio.get("/$uf/$cidade/$rua/json/");

    List<CepModel> list = [];

    for (var json in (response.data as List)) {
      var cepModel = CepModel.fromJson(json);
      list.add(cepModel);
    }
    return list;
  }
}
