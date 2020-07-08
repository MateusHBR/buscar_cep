import 'package:flutter/material.dart';
import 'package:pesquisa_cep/app/shared/models/cep_model.dart';

class TextComponent extends StatelessWidget {
  final CepModel item;

  const TextComponent({this.item});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.7,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Cep: ${item.cep}",
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Rua: ${item.rua}",
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Complemento: ${item.complemento}",
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Bairro: ${item.bairro}",
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Cidade: ${item.cidade}",
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "UF: ${item.uf}",
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
