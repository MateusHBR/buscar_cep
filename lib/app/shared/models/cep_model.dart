import 'dart:convert';

class CepModel {
  String cep;
  String rua;
  String complemento;
  String bairro;
  String cidade;
  String uf;
  bool favorite;

  CepModel({
    this.cep,
    this.rua,
    this.complemento,
    this.bairro,
    this.cidade,
    this.uf,
    this.favorite = false,
  });

  CepModel.fromJson(Map<String, dynamic> json) {
    cep = json["cep"];
    rua = json["logradouro"];
    complemento = json["complemento"];
    bairro = json["bairro"];
    cidade = json["localidade"];
    uf = json["uf"];
    favorite = json["favorite"] ?? false;
  }

  copyWith({
    String cep,
    String rua,
    String complemento,
    String bairro,
    String cidade,
    String uf,
    bool favorite,
  }) {
    return CepModel(
      cep: cep ?? this.cep,
      rua: rua ?? this.rua,
      complemento: complemento ?? this.complemento,
      bairro: bairro ?? this.bairro,
      cidade: cidade ?? this.cidade,
      uf: uf ?? this.uf,
      favorite: favorite ?? this.favorite,
    );
  }

  static Map<String, dynamic> toJson(CepModel cepModel) {
    return {
      "cep": cepModel.cep,
      "logradouro": cepModel.rua,
      "complemento": cepModel.complemento,
      "bairro": cepModel.bairro,
      "localidade": cepModel.cidade,
      "uf": cepModel.uf,
      "favorite": cepModel.favorite,
    };
  }

  static String encodeCeps(List<CepModel> ceps) {
    List<Map<String, dynamic>> list = [];

    for (var cepJson in ceps) {
      var cep = CepModel.toJson(cepJson);
      list.add(cep);
    }

    return json.encode(list);
  }

  static List<CepModel> decodeCeps(String ceps) => ceps != null
      ? (json.decode(ceps) as List<dynamic>)
          .map<CepModel>((item) => CepModel.fromJson(item))
          .toList()
      : [];
}
