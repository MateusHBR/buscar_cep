class CepModel {
  String cep;
  String rua;
  String complemento;
  String bairro;
  String cidade;
  String uf;

  CepModel({
    this.cep,
    this.rua,
    this.complemento,
    this.bairro,
    this.cidade,
    this.uf,
  });

  CepModel.fromJson(Map<String, dynamic> json) {
    cep = json["cep"];
    rua = json["logradouro"];
    complemento = json["complemento"];
    bairro = json["bairro"];
    cidade = json["localidade"];
    uf = json["uf"];
  }
}
