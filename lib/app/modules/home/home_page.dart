import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
    return Scaffold(
      appBar: AppBar(),
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
                      validator: (cidade) {
                        if (cidade.isEmpty || cidade.length < 3) {
                          return "campo inválido";
                        }
                        return null;
                      },
                      controller: controller.cidadeController,
                      decoration: InputDecoration(
                        labelText: "Cidade",
                        hintText: "Informe a cidade a ser consultada",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        validator: (rua) {
                          if (rua.isEmpty || rua.length < 3) {
                            return "campo inválido";
                          }
                          return null;
                        },
                        controller: controller.ruaController,
                        decoration: InputDecoration(
                          labelText: "Rua",
                          hintText: "Informe a rua a ser consultada",
                        ),
                      ),
                    ),
                    TextFormField(
                      validator: (uf) {
                        if (uf.isEmpty || uf.length < 2) {
                          return "campo inválido";
                        }
                        return null;
                      },
                      maxLength: 2,
                      controller: controller.ufController,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(2),
                      ],
                      decoration: InputDecoration(
                        labelText: "UF",
                        hintText: "Informe o UF a ser consultado, Ex: RJ",
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
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
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            print('sucesso');
                          } else {
                            print('fail');
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return Container(
                      // height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.location_city,
                            size: 80,
                            color: Colors.grey,
                          ),
                          Column(
                            children: <Widget>[
                              Text('TTeste'),
                              SizedBox(
                                height: 5,
                              ),
                              Text('TTeste'),
                              SizedBox(
                                height: 5,
                              ),
                              Text('TTeste'),
                              SizedBox(
                                height: 5,
                              ),
                              Text('TTeste'),
                              SizedBox(
                                height: 5,
                              ),
                              Text('TTeste'),
                              SizedBox(
                                height: 5,
                              ),
                              Text('TTeste'),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          )
                        ],
                      ),
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
