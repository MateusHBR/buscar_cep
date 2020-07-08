import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pesquisa_cep/app/modules/home/components/skeleton_component.dart';
import 'package:pesquisa_cep/app/modules/home/components/text_component.dart';
import 'package:pesquisa_cep/app/shared/models/cep_model.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Busca CEP"),
        actions: <Widget>[
          Observer(
            builder: (_) {
              return IconButton(
                icon: Icon(Icons.clear),
                onPressed: controller.isEmpty ? null : controller.clearContext,
              );
            },
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(7.5),
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Container(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      onChanged: controller.setCidade,
                      controller: controller.cidadeController,
                      validator: (cidade) {
                        if (cidade.isEmpty || cidade.length < 3) {
                          return "campo inválido";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Cidade",
                        hintText: "Informe a cidade a ser consultada",
                      ),
                    ),
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      controller: controller.ruaController,
                      onChanged: controller.setRua,
                      validator: (rua) {
                        if (rua.isEmpty || rua.length < 3) {
                          return "campo inválido";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Rua",
                        hintText: "Informe a rua a ser consultada",
                      ),
                    ),
                    TextFormField(
                      textCapitalization: TextCapitalization.characters,
                      controller: controller.ufController,
                      onChanged: controller.setUf,
                      validator: (uf) {
                        if (uf.isEmpty || uf.length < 2) {
                          return "campo inválido";
                        }
                        return null;
                      },
                      maxLength: 2,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(2),
                      ],
                      decoration: InputDecoration(
                        labelText: "UF",
                        hintText: "Informe o UF a ser consultado, Ex: RJ",
                      ),
                    ),
                    Observer(
                      builder: (_) {
                        return Container(
                          margin: EdgeInsets.only(top: 2, bottom: 5),
                          width: double.infinity,
                          child: RaisedButton(
                            child: Text(
                              'Buscar',
                              style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 0.5,
                              ),
                            ),
                            color: Theme.of(context).primaryColor,
                            onPressed: controller.canClick
                                ? () {
                                    if (_formKey.currentState.validate()) {
                                      controller.fetchData();
                                    }
                                  }
                                : null,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Observer(
                  builder: (_) {
                    if (controller.cepFuture.error != null ||
                        controller.cepFuture.status == FutureStatus.rejected) {
                      return Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Erro ao carregar dados...',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:
                                20 * MediaQuery.of(context).textScaleFactor,
                          ),
                        ),
                      );
                    }

                    if (controller.cepFuture.status == FutureStatus.pending) {
                      return SkeletonComponent();
                    }

                    if (controller.cepFuture.value.isEmpty &&
                        !controller.firstTime) {
                      return Center(
                        child: Text(
                          'Nenhum dado com essas características foi encontrado...',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:
                                16 * MediaQuery.of(context).textScaleFactor,
                          ),
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: controller.cepList.length,
                      itemBuilder: (context, index) {
                        List<CepModel> list = controller.cepList;

                        return Card(
                          elevation: 5,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.location_city,
                                  size: size.height * 0.08,
                                  color: Colors.grey,
                                ),
                                TextComponent(
                                  item: list[index],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
